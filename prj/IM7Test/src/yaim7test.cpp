#include "yaim7test.h"

#include <QDebug>
#include <QDir>
#include <QFile>
#include <QTime>
#include <MagickCore/MagickCore.h>
#include <MagickWand/MagickWand.h>

YaIM7Test::YaIM7Test(bool isUI, int maxNumOfThreads)
{
    _isUI = isUI;
    _maxNumOfThreads = maxNumOfThreads;
    qDebug() << "UI:" << _isUI << "max # of threads" << _maxNumOfThreads;
}

YaIM7Test::~YaIM7Test()
{

}

void
YaIM7Test::getResources()
{
    QDir    dir;
    QFile   file;
    _resList.clear();
    if (getResourcesList())
    {
        qDebug() << "working dir" << dir.absolutePath();
        qDebug() << "extract resources"<<_resList;
        dir.mkdir("res");
        for (int i=0; i<_resList.size(); i++){
            file.setFileName("./"+_resList.at(i));
            if(file.remove())
                qDebug() << "removed:" << _resList.at(i);
            else
                qDebug() << "can't remove:" << _resList.at(i);
            file.setFileName(":/"+_resList.at(i));
            if (file.copy("./"+_resList.at(i)))
                qDebug() << "extracted:" << _resList.at(i);
            else
                qDebug() << "can't extract:" << _resList.at(i);
        }
    }
// looks like this envvar not working
//    QString clCacheDir(dir.absolutePath());
//    clCacheDir.append("/clcache");
//    qputenv("IMAGEMAGICK_OPENCL_CACHE_DIR",clCacheDir.toLatin1());
}

void
YaIM7Test::removeResources()
{
    QDir    dir;
    QFile   file;
    qDebug() << "remove resources here:" << _resList;

    for (int i=0; i<_resList.size(); i++){
        file.setFileName("./"+_resList.at(i));
        if(file.remove())
            qDebug() << "removed:" << _resList.at(i);
        else
            qDebug() << "can't remove:" << _resList.at(i);
    }
    for (int i=0; i<_testList.size(); i++){
        file.setFileName("./"+_testList.at(i));
        if(file.remove())
            qDebug() << "removed:" << _testList.at(i);
        else
            qDebug() << "can't remove:" << _testList.at(i);
    }
    dir.remove("res");
}

bool
YaIM7Test::testCore(bool writeToFile)
{
    qDebug() << "testCore, write to file:" << writeToFile;
    Image *image, *imagew;
    ImageInfo *read_info;
    ExceptionInfo *exception;
    QTime t;

    MagickCoreGenesis((char *) NULL,MagickFalse);

    exception = AcquireExceptionInfo();
    read_info=CloneImageInfo(NULL);
    CopyMagickString(read_info->filename, _resList.at(0).toLatin1().constData(),
                     MaxTextExtent);
    image = ReadImage(read_info,exception);t.start();


    //just a simple rotate
    imagew = IntegralRotateImage(image,1,exception);

    _result = t.elapsed();
    qDebug() << "core: image rotated:" << _result << "msec";
    if (writeToFile) {
        ImageInfo *write_info;
        MagickBooleanType status;

        _testList.append(QString(_resList.at(0)).replace(0, 4, "./res/core_"));

        write_info=CloneImageInfo(read_info);
        CopyMagickString(write_info->filename,
                         _testList.last().toLatin1().constData(), MaxTextExtent);
        status=WriteImages(write_info, imagew, write_info->filename,exception);
        if (status == MagickFalse)
            qCritical() << "can't write to" << _testList.last();
        DestroyImageInfo(write_info);
    }
    DestroyImage(imagew);
    DestroyImage(image);
    DestroyImageInfo(read_info);
    DestroyExceptionInfo(exception);

    MagickCoreTerminus();

    return true;
}

bool
YaIM7Test::testWand(bool writeToFile)
{
    qDebug() << "testWand, write to file:" << writeToFile;
    MagickWand *magick_wand;
    PixelWand *background = NewPixelWand();
    MagickBooleanType status;

    MagickWandGenesis();

    magick_wand = NewMagickWand();
    status = MagickReadImage(magick_wand,_resList.at(0).toLatin1());
    if (status == MagickFalse)
        qCritical() <<"can't read from" << _resList.at(0);

    QTime t;
    t.start();

    //just simple rotate. after caching should be the same, as core result
    MagickRotateImage(magick_wand,background,90);

    _result = t.elapsed();
    qDebug() << "wand: image rotated:"<<_result << "msec";
    if (writeToFile) {
        _testList.append(QString(_resList.at(0)).replace(0, 4, "./res/wand_"));
        status = MagickWriteImage(magick_wand, _testList.last().toLatin1());
        if (status == MagickFalse)
            qCritical() << "can't write to" << _testList.last();
    }

    background = DestroyPixelWand(background);
    magick_wand = DestroyMagickWand(magick_wand);

    MagickWandTerminus();

    return true;
}

int
YaIM7Test::testOpenMP(int numOfThreads, bool writeToFile)
{
    qDebug() << "testOpenMP, #:" << numOfThreads
             <<", write to file:" << writeToFile;

    testOpenXX(numOfThreads, false, false, writeToFile);

    return _result;
}

int
YaIM7Test::testOpenCL(bool isGPU, bool writeToFile)
{
    qDebug() << "testOpenCL, GPU#:" << isGPU
             <<", write to file:" << writeToFile;
    testOpenXX(0, true, isGPU, writeToFile);
    return _result;
}
int
YaIM7Test::testOpenXX(int numOfThreads, bool useOpenCL, bool useGPU,
                      bool writeToFile)
{
    Image *image, *imagew;
    ImageInfo *read_info;
    ExceptionInfo *exception;
    QTime t;
    QString device;

    if (useOpenCL){
        if (useGPU){
            qputenv("MAGICK_OCL_DEVICE","GPU");
            device.append("OpenCL_GPU");
        }
        else {
            qputenv("MAGICK_OCL_DEVICE","CPU");
            device.append("OpenCL_CPU");
        }
    }
    else {
        qputenv("MAGICK_OCL_DEVICE","OFF");
        if (numOfThreads > 0) //0 is auto in term of app(for magick 0 is equal to 1)
        {
            qputenv("MAGICK_THREAD_LIMIT",QString::number(numOfThreads).toLatin1());
            device.append("OpenMP_");
            device.append(QString::number(numOfThreads));
        } else {
            device.append("OpenMP_Auto");
        }
    }

    MagickCoreGenesis((char *) NULL,MagickFalse);

    exception = AcquireExceptionInfo();
    read_info=CloneImageInfo(NULL);
    CopyMagickString(read_info->filename, _resList.at(0).toLatin1().constData(),
                     MaxTextExtent);
    image = ReadImage(read_info,exception);
    //blur supported by both OpenMP and OpenCL

    t.start();
    imagew = BlurImage(image,16,4.5,exception);
    _result = t.elapsed();

    qDebug() << "image blured on device:"<< device << ":\t" << _result << "msec";

    if (writeToFile) {
        ImageInfo *write_info;
        MagickBooleanType status;

        _testList.append(QString(_resList.at(0)).replace(0, 4,
                                                 ("./res/core_")+device+"_"));

        write_info=CloneImageInfo(read_info);
        CopyMagickString(write_info->filename,
                         _testList.last().toLatin1().constData(), MaxTextExtent);
        status=WriteImages(write_info, imagew, write_info->filename,exception);
        if (status == MagickFalse)
            qCritical() << "can't write to" << _testList.last();
        DestroyImageInfo(write_info);
    }
    DestroyImage(imagew);
    DestroyImage(image);
    DestroyImageInfo(read_info);
    DestroyExceptionInfo(exception);

    MagickCoreTerminus();

    qunsetenv("MAGICK_THREAD_LIMIT");
    qunsetenv("MAGICK_OCL_DEVICE");

    return _result;
}

bool
YaIM7Test::getResourcesList()
{
    QFile file;
    if (_isUI)
        file.setFileName(":/res/resourcesUI.txt");
    else
        file.setFileName(":/res/resourcesConsole.txt");

    if (file.open(QIODevice::ReadOnly | QIODevice::Text)){
        QString str;
        while (!file.atEnd()) {
            str.clear();
            str.append(file.readLine());
            _resList.append(str.remove((str.length()-1), 1));
        }
    } else {
        qCritical() << "file not found" << file.fileName();
        return false;
    }
    return true;
}

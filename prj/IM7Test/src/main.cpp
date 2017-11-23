#include <QCoreApplication>
#include <QDebug>
#include "yaprogramversion.h"
#include "yaim7test.h"


int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    qDebug() << "ImageMagick 7 test app/console";

    YaProgramVersion pv;
    pv.toConsole(true);

    YaIM7Test imt;
    imt.getResources();
    imt.testCore(true);
    imt.testWand(true);
    imt.testOpenMP(YaIM7Test::blur,0, true);
    imt.testOpenMP(YaIM7Test::blur,1, true);
    imt.testOpenCL(YaIM7Test::blur, true, true);
    imt.testOpenCL(YaIM7Test::blur,false, true);
    //imt.removeResources(); //\todo switch ON later

    return a.exec();
}

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
    imt.testOpenMP(0, true);
    imt.testOpenMP(1, true);
    imt.testOpenCL(true, true);
    imt.testOpenCL(false, true);
    //imt.removeResources(); //\todo switch ON later

    return a.exec();
}

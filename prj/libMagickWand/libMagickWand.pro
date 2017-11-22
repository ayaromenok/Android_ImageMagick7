
QT       -= core gui

TARGET = MagickWand
TEMPLATE = lib

DEFINES += LIBCORE_LIBRARY
DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += MAGICKCORE_HDRI_ENABLE=0
DEFINES += MAGICKCORE_QUANTUM_DEPTH=8

INCLUDEPATH += ../../jni/ImageMagick/
INCLUDEPATH += ../../jni/ImageMagick/coders
INCLUDEPATH += ../../jni/ImageMagick/filters
INCLUDEPATH += ../../jni/ImageMagick/MagickCore
INCLUDEPATH += ../../jni/ImageMagick/MagickWand

INCLUDEPATH += ../../jni/opencl/include
LIBS += -lOpenCL
contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    LIBS += -L../../jni/opencl/lib
}

LIBS += -L../libjpeg -ljpeg -L../libpng -lpng -L../libtiff -ltiff
LIBS += -L../libcoders -lcoders -L../libMagickCore -lMagickCore

include(../include/files_wand.pri)

unix {
    target.path = /usr/lib
    INSTALLS += target
}

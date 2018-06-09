
QT       -= core gui

TARGET = MagickCore
TEMPLATE = lib
#QMAKE_CFLAGS += -fopenmp
#QMAKE_LFLAGS += -fopenmp
DEFINES += LIBCORE_LIBRARY
DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += MAGICKCORE_HDRI_ENABLE=0
DEFINES += MAGICKCORE_QUANTUM_DEPTH=8

INCLUDEPATH += ../../jni/ImageMagick/
INCLUDEPATH += ../../jni/ImageMagick/coders
INCLUDEPATH += ../../jni/ImageMagick/filters
INCLUDEPATH += ../../jni/ImageMagick/MagickCore

#linux:!android {
    LIBS += -L../libpng -lpng -L../libjpeg -ljpeg -L../libtiff -ltiff
    LIBS += -L../libcoders -lcoders -lz
#}
#android {
#    contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
#        message("MagickCore/Android/armv7")
#        LIBS += ../libjpeg/libjpeg.a ../libpng/libpng.a ../libtiff/libtiff.a
#        LIBS += ../libcoders/libcoders.a
#    }
#}
include(../include/files_core.pri)

unix {
    target.path = /usr/lib
    INSTALLS += target
}


QT       -= core gui

TARGET = MagickCore
TEMPLATE = lib

DEFINES += LIBCORE_LIBRARY
DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += MAGICKCORE_HDRI_ENABLE=0
DEFINES += MAGICKCORE_QUANTUM_DEPTH=8

INCLUDEPATH += ../../jni/ImageMagick/
INCLUDEPATH += ../../jni/ImageMagick/coders
INCLUDEPATH += ../../jni/ImageMagick/filters
INCLUDEPATH += ../../jni/ImageMagick/MagickCore

LIBS += -L../libjpeg -ljpeg -L../libpng -lpng -L../libtiff -ltiff
LIBS += -L../libcoders -lcoders

include(../include/files_core.pri)

unix {
    target.path = /usr/lib
    INSTALLS += target
}

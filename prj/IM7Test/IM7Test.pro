QT -= gui

TARGET = IM7TestQMake
include(./files.pri)
SOURCES += ./src/main.cpp


android {
##arm64-v8a  armeabi  armeabi-v7a  mips  mips64  x86  x86_64
    contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
        message("IM7Test/Android/armv7")
#        INCLUDEPATH += ../../jni/ImageMagick/
#        LIBS += -L../libMagickCore -L../libMagickWand
#        LIBS += -lMagickCore -lMagickWand -lz
#        LIBS += -L../libjpeg -ljpeg -L../libpng -lpng -L../libtiff -ltiff
#        LIBS += -L../libcoders -lcoders
        ANDROID_EXTRA_LIBS = \
            ../libjpeg/libjpeg.so \
            ../libpng/libpng.so \
            ../libtiff/libtiff.so \
            ../libMagickCore/libMagickCore.so \
            ../libMagickWand/libMagickWand.so
    }
}

#linux:!android {

    INCLUDEPATH += ../../jni/ImageMagick/
    LIBS += -L../libMagickCore -L../libMagickWand
    LIBS += -lMagickCore -lMagickWand -lz
    LIBS += -L../libjpeg -ljpeg -L../libpng -lpng -L../libtiff -ltiff
    #LIBS += -L../libcoders -lcoders
#}

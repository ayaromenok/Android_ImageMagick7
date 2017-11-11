TEMPLATE = subdirs

SUBDIRS = \
    libjpeg \
    libpng \
    libtiff \
    libcoders \
    libMagickCore \
    libMagickWand \
    IM7Test

libtiff.depends = libjpeg
libcoders.depends = libpng libtiff
libMagickCore.depends = libcoders
libMagickWand.depends = libMagickCore
IM7Test.depends = libMagickWand

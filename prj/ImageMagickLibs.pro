TEMPLATE = subdirs

SUBDIRS = \
    libjpeg \
    libpng \
    libtiff \
    libcoders \
    libMagickCore

libtiff.depends = libjpeg
libcoders.depends = libpng libtiff
libMagickCore.depends = libcoders

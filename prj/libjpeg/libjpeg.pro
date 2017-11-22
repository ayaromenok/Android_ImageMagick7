QT       -= core gui

TARGET = jpeg
TEMPLATE = lib
#CONFIG += staticlib

include("../include/files_jpeg.pri")

unix {
    target.path = /usr/lib
    INSTALLS += target
}

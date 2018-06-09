QT       -= core gui

TARGET = png
TEMPLATE = lib
CONFIG += staticlib

include("../include/files_png.pri")
LIBS += -lz
unix {
    target.path = /usr/lib
    INSTALLS += target
}

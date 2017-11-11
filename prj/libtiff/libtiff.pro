QT       -= core gui

TARGET = tiff
TEMPLATE = lib
CONFIG += staticlib

include("../include/files_tiff.pri")

unix {
    target.path = /usr/lib
    INSTALLS += target
}

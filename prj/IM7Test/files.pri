
DEFINES += GIT_VERSION=\\\"$$system(git describe --tags > $$PWD/program_version.txt)\\\"
DEFINES += GIT_VERSION=\\\"$$system(git rev-list --all --count >> $$PWD/program_version.txt)\\\"
DEFINES += GIT_VERSION=\\\"$$system(git branch >> $$PWD/program_version.txt)\\\"
DEFINES += GIT_VERSION=\\\"$$system(git log -1 >> $$PWD/program_version.txt)\\\"

CONFIG += c++11 console
CONFIG -= app_bundle
DEFINES += QT_DEPRECATED_WARNINGS


SOURCES += ./src/yaprogramversion.cpp \
       ./src/yaim7test.cpp

RESOURCES += \
    ./resources.qrc

HEADERS += \
    ./src/yaprogramversion.h \
    ./src/yaim7test.h

#include "yaprogramversion.h"
#include <QDebug>
#include <QFile>
#include <QTextStream>

YaProgramVersion::YaProgramVersion(QObject *parent) : QObject(parent)
{
    QFile file(":/program_version.txt");
    if (file.open(QIODevice::ReadOnly)){
        QTextStream qts(&file);
        QString strVerInfo(qts.readAll());

        QStringList strListVerInfo(strVerInfo.split('\n'));

        _tag.append(strListVerInfo.at(0));
        _count.append(strListVerInfo.at(1));

        foreach (const QString &str, strListVerInfo) {
            if (str.contains("*"))
                _branch += str;
            if (str.contains("commit"))
                _lastCommit += str;
            if (str.contains("Author:"))
                _lastCommit += str;
            if (str.contains("Date"))
                _lastCommit += str;
            if (str.contains("   #"))//assume that every commit belongs to issue
                _lastCommit += str;
        }
    }
}

void
YaProgramVersion::toConsole(bool showLastCommit)
{
    qInfo() << "\tbranch:" << _branch;
    qInfo() << "\ttag:" << _tag;
    qInfo() << "\t#:" << _count;
    if (showLastCommit)
        qInfo() << "last" << _lastCommit;
}

#ifndef YAPROGRAMVERSION_H
#define YAPROGRAMVERSION_H

#include <QObject>

class YaProgramVersion : public QObject
{
    Q_OBJECT
public:
    explicit YaProgramVersion(QObject *parent = nullptr);
    void toConsole(bool showLastCommit = false);

signals:

public slots:

private:
    QString     _tag;
    QString     _branch;
    QString     _count;
    QString     _lastCommit;
};

#endif // YAPROGRAMVERSION_H

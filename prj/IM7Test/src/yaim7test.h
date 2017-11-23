#ifndef YAIM7TEST_H
#define YAIM7TEST_H

#include <QObject>
class QFile;

class YaIM7Test : public QObject
{
    Q_OBJECT

public:
    enum opCL {
        blur,
        charcoal,
        contrast,
        constrast_stretch,
        convolve,
        despeckle,
        edge,
        equalize,
        emboss,
        function,
        gaussian_blur,
        grayscale,
        modulate,
        motion_blur,
        negate,
        noise,
        radial_blur,
        resize,
        sketch,
        unsharp
    };
    explicit YaIM7Test(bool isUI = false, int maxNumOfThreads = 20);
    ~YaIM7Test();
    void    getResources();
    void    removeResources();
    bool    testCore(bool writeToFile = false);
    bool    testWand(bool writeToFile = false);
    int     testOpenMP(opCL op, int numOfThreads = 0, bool writeToFile = false);
    int     testOpenCL(opCL op, bool isGPU = true, bool writeToFile = false);
    int     testOpenXX(opCL op, int numOfThreads, bool useOpenCL, bool useGPU,
                       bool writeToFile = false);

signals:

public slots:

private:
    bool            getResourcesList();


    bool            _isUI;
    int             _result; //msec, enough for few hundred seconds
    int             _maxNumOfThreads;
    QStringList     _resList;
    QStringList     _testList;    
    QFile           *_resFile;
    bool            _canWriteResToFile;
};

#endif // YAIM7TEST_H

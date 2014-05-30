#ifndef _MY_THREAD_H_
#define _MY_THREAD_H_

#include <QtCore>

class MyThread : public QThread
{
    Q_OBJECT
    
public:
    MyThread();
    void setMessage(const QString &message);
    void setMValue(int);
    int  getMValue(void);
    // void stop();

public slots:
	void slotNextValue();

protected:
    void run();
    
private:
	int m_nValue;
    QString messageStr;    
    volatile bool stopped;
    
signals:
	void finished();
    void currentValue(int);    
};

#endif // THREAD_H

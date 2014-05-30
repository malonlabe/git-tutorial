#ifndef __MY_WIDGET_H__
#define __MY_WIDGET_H__

#include <QtCore>
#include <QtGui/QApplication>
#include <QtGui/QPushButton>
#include <QtGui/QLCDNumber>
#include <QtGui/QSlider>
#include <QtGui/QLayout>
#include <QtGui/QLineEdit>
#include "mythread.h"
#include <iostream>

//#define QT_RND_SERVER
#ifndef QT_RND_SERVER
 #include <time.h>
#endif

class MyWidget : public QWidget
{
 
 Q_OBJECT

 public:
     MyWidget(QWidget *parent = 0);
     ~MyWidget(){};

     int GetRNDValue();

     QLineEdit* line3;
     QLineEdit* lnMSTime;

     QPushButton* bCountDown;
     QPushButton* bRnd;
     QPushButton *bQuit;

     QLCDNumber *lcd;

     MyThread m_thread;

 public slots:
     void setValue();
     void onExit ();
     void StartMyThread();
     // int GetRNDValue();
};

#endif // __MY_WIDGET_H__

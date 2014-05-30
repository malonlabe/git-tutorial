#ifndef ALARM_WIDGET_H
#define ALARM_WIDGET_H
//============================================================
//
// Copyright (c) 2011 GENERAL ELECTRIC COMPANY
//
//============================================================
//
// File:           AlarmWidget.h
// Project:        Genie Carestation SW
//
// Author:         YS / Genie SW Team
//
//============================================================
// Description:
//==========================================================
#include <QtGui>
#include <time.h>
#include <windows.h>
#include "gen.h"
#include "appSettings.h"


class AlarmWidget : public QFrame
{
    Q_OBJECT

public:
    AlarmWidget(QFrame *parent = 0);
    ~AlarmWidget(){};

    void initMainWindow();
    void initTimerBoxes();
    void initButtons();
    void initLayouts();
    void initRadioButtons();
    void tuneMainWindow();
    void setMainWindowTitle(QString strToShow);
    void setConnections();
    void startTimer();
    void stopTimer();
    void decrementCounter();
    void updateRemainTxt();
    void startAlarm();
    void restoreSettingsFromINI();
    void closeEvent (QCloseEvent *);
    void playSound();

    void paintEvent(QPaintEvent *e);
    void resizeEvent(QResizeEvent *e);

public slots:
    void onStart();
    void onPause();
    void onTimerEvent();
    void changeTimeUnit();
    void changeSoundOutput();
    void updateTimeUnits();

private:
    int nCounter;
    int m_ButtonFontSize;
    int m_LabelFontSize;
    int nSeconds;
    int radioButtonsTime;
    int radioButtonsSound;

    bool isPause;

    QTimer *m_timer_ctd;
    
    QPixmap pic;

    QString m_FontName;
    
    QSpinBox  *timerValue;
    QLabel    *lblSetTime;
    QLabel    *lblRTime;
    QLineEdit *txtRemain;

    QPushButton *btnPause;
    QPushButton *btnStart;
    QPushButton *btnQuit;

    QRadioButton *radioMin;
    QRadioButton *radioSec;         
    QRadioButton *radioSoundOn;
    QRadioButton *radioSoundOFF;

    QVBoxLayout *mainVlayout;
    QVBoxLayout *radioTimeVlayout;
    QVBoxLayout *radioSoundVlayout;
    QVBoxLayout *textVlayout;
    QVBoxLayout *TimeInsVlayout;
    QHBoxLayout *hLayoutBtns;
    QHBoxLayout *hLayoutTime;
    QHBoxLayout *hLayoutRemainTime;
    QHBoxLayout *hLayoutTimeShow;

    AppSettings *m_settings; 
};

#endif


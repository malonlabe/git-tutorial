//============================================================
//
// Copyright (c) 2011 GENERAL ELECTRIC COMPANY
//
//============================================================
//
// File:           AlarmWidget.cpp
// Project:        Genie Carestation SW
//
// Author:         YS / Genie SW Team
//
//============================================================
// Description:
//==========================================================
#include "AlarmWidget.h"

AlarmWidget::AlarmWidget(QFrame *parent)
     : QFrame(parent)

     , nCounter(0)
     , radioButtonsTime(0) // 0 - minutes, 1 - seconds
     , radioButtonsSound(0) //
     , m_ButtonFontSize(15)
     , m_LabelFontSize (20)
     , nSeconds(60)
     , m_FontName("arial")
     , isPause(false)

 {
     // by default it is minutes

    m_timer_ctd = new QTimer();

    initMainWindow();
    m_settings = new AppSettings(STR_COMPANY_NAME, STR_APP_NAME);
    restoreSettingsFromINI();

    nCounter = timerValue->value() * nSeconds; //  set to minutes
    updateRemainTxt();
    setConnections();
 }

void AlarmWidget::initMainWindow()
{
    initTimerBoxes();
    initButtons();
    initRadioButtons();
    initLayouts();
    tuneMainWindow();
}

void AlarmWidget::initTimerBoxes()
{
    lblSetTime = new QLabel(STR_SET_TIME);
    lblSetTime->setFont(QFont(m_FontName, 20));

    timerValue = new QSpinBox();
    timerValue->setRange(1, 600);
    timerValue->setSuffix(STR_MIN);
    timerValue->setValue(5);
    timerValue->setFont(QFont(m_FontName, 20)); // "Sans";

    lblRTime = new QLabel(STR_REMAINS);
    lblRTime->setFont(QFont(m_FontName, 20));

    txtRemain = new QLineEdit(STR_INIT_TIME);
    txtRemain->setEnabled(false);

    txtRemain->setAlignment(Qt::AlignCenter);
    txtRemain->setFont(QFont(m_FontName, 20));
}

void AlarmWidget::initButtons()
{
    btnPause = new QPushButton(STR_BTN_PAUSE);
    btnPause->setMinimumSize(INT_BTN_W, INT_BTN_H);

    btnStart = new QPushButton(STR_BTN_START);
    btnStart->setMinimumSize(INT_BTN_W, INT_BTN_H);

    btnQuit = new QPushButton(STR_BTN_QUIT);
    btnQuit->setMinimumSize(INT_BTN_W, INT_BTN_H);

    QIcon m_iconPlane(":/Resources/plane.png");
    // QIcon m_iconPlane(STR_PLANE_ICON);
    btnQuit->setIcon(m_iconPlane);
    btnQuit->setIconSize(QSize(30, 30));

    btnStart->setFont(QFont(m_FontName, m_ButtonFontSize));
    btnPause->setFont(QFont(m_FontName, m_ButtonFontSize));
    btnQuit->setFont(QFont(m_FontName, m_ButtonFontSize));

    btnPause->setEnabled(false);
}

void AlarmWidget::initLayouts()
{
    mainVlayout =  new QVBoxLayout();
    radioTimeVlayout =  new QVBoxLayout();
    radioSoundVlayout =  new QVBoxLayout();
    textVlayout =  new QVBoxLayout();
    TimeInsVlayout =  new QVBoxLayout();
    hLayoutBtns  =  new QHBoxLayout();
    hLayoutTime  =  new QHBoxLayout();
    hLayoutRemainTime  =  new QHBoxLayout();
    hLayoutTimeShow  =  new QHBoxLayout();
    
    QGroupBox *groupBoxTime = new QGroupBox();

    radioTimeVlayout->addWidget(radioMin);
    radioTimeVlayout->addWidget(radioSec);
    groupBoxTime->setMaximumHeight(55);
    groupBoxTime->setFlat(true);
    //radioTimeVlayout->addStretch(1);    
    groupBoxTime->setLayout(radioTimeVlayout);
    
    QGroupBox *groupBoxSound = new QGroupBox();
    radioSoundVlayout->addWidget(radioSoundOn);
    radioSoundVlayout->addWidget(radioSoundOFF);
    groupBoxSound->setMaximumHeight(55);
    groupBoxSound->setFlat(true);
    groupBoxSound->setLayout(radioSoundVlayout);

    hLayoutTime->addWidget(timerValue);
    hLayoutTime->addWidget(groupBoxTime);//orig - radioTimeVlayout

    textVlayout->addWidget(lblSetTime);
    textVlayout->addWidget(lblRTime);

    hLayoutRemainTime->addWidget(txtRemain);    
    hLayoutRemainTime->addWidget(groupBoxSound);

    TimeInsVlayout->addLayout(hLayoutTime);
    TimeInsVlayout->addLayout(hLayoutRemainTime);    

    hLayoutTimeShow->addLayout(textVlayout);
    hLayoutTimeShow->addLayout(TimeInsVlayout);

    //set buttons to layout:
    hLayoutBtns->addWidget(btnStart);
    hLayoutBtns->addWidget(btnPause);
    hLayoutBtns->addWidget(btnQuit);

    mainVlayout->addLayout(hLayoutTimeShow);
    mainVlayout->addLayout(hLayoutBtns);

    mainVlayout->setMargin(0);
    //mainVlayout->setSpacing(0);
    

    setLayout(mainVlayout);
}

void AlarmWidget::initRadioButtons()
{
    radioMin =  new QRadioButton(STR_MINUTES);
    radioSec =  new QRadioButton(STR_SECONDS);

    radioSoundOn =  new QRadioButton(STR_SOUND_ON);
    radioSoundOFF =  new QRadioButton(STR_SOUND_OFF);
}

void AlarmWidget::paintEvent(QPaintEvent *e)
{
    QRegion r1(pic.rect());
    QPainter painter(this);
            
    painter.setClipRegion(r1);
    painter.drawPixmap(pic.rect(), pic);
    
}

void AlarmWidget::resizeEvent(QResizeEvent *e)
{
    //setMask(pic.mask());
}

void AlarmWidget::tuneMainWindow()
{
    //set icon:
    // QIcon m_Icon = QIcon(":/plane.png");
    // see - alias:
    QIcon m_iconPlane("://Resources/plane.png");
    setWindowIcon(m_iconPlane);
    //set caption:
    setMainWindowTitle("");    
    //pic.load(":/Dot");
    // pic.load("Resources/anekdotik.png");
    // pic.load("Resources/anekdotik.png");
}

void AlarmWidget::setMainWindowTitle(QString strToShow)
{
    setWindowTitle(strToShow + STR_MAIN_TITLE);
}

void AlarmWidget::setConnections()
{
    connect (btnStart, SIGNAL(clicked()), this, SLOT(onStart()));
    connect(btnPause, SIGNAL(clicked()), this, SLOT(onPause()));
    connect(btnQuit,  SIGNAL(clicked()), this, SLOT(close()));
    connect(m_timer_ctd, SIGNAL(timeout()), this, SLOT(onTimerEvent()));

    connect(radioMin, SIGNAL(toggled(bool)), this, SLOT(changeTimeUnit()));
    connect(radioSec, SIGNAL(toggled(bool)), this, SLOT(changeTimeUnit()));

    connect(radioSoundOFF, SIGNAL(toggled(bool)), this, SLOT(changeSoundOutput()));
    connect(radioSoundOn, SIGNAL(toggled(bool)), this, SLOT(changeSoundOutput()));
}

void AlarmWidget::onStart()
{
    nCounter = timerValue->value() * nSeconds; // set to minutes
    startTimer();
    updateRemainTxt();
    btnPause->setEnabled(true);
}

void AlarmWidget::onPause()
{
    if (isPause)
    {
        isPause = false;
        btnPause->setText(STR_BTN_PAUSE);
        startTimer();
    }
    else
    {
        isPause = true;
        btnPause->setText(STR_BTN_RESUME);
        stopTimer();
    }
}

void AlarmWidget::startTimer()
{
    m_timer_ctd->start(1000);
}
void AlarmWidget::stopTimer()
{
    m_timer_ctd->stop();
}

void AlarmWidget::onTimerEvent()
{
    decrementCounter();
}

void AlarmWidget::decrementCounter()
{
    nCounter = nCounter - 1;
    if (0 >= nCounter)
    {
        updateRemainTxt();
        startAlarm();
        nCounter = 0;
        stopTimer();
        btnPause->setEnabled(false);
    }
    updateRemainTxt();

}

void AlarmWidget::updateRemainTxt()
{
    int nTmpVal = nCounter;
    QString strTmpVal = QString();

    if (60 > nTmpVal)
    {
        strTmpVal = QString().setNum(nTmpVal);
        // setMainWindowTitle(strTmpVal)
    }
    else
    {
        strTmpVal = QString().setNum(nTmpVal / 60) + ":" + QString().setNum(nTmpVal % 60);
    }

    txtRemain->setText(strTmpVal);
}

void AlarmWidget::startAlarm()
{
    showNormal();
    activateWindow();    
    playSound();
    QMessageBox::information(this, "Timer Info", "Timer has got it's limit!");
/*    QtGui.QMessageBox.critical(None, "OpenGL hellogl",
                            "PyOpenGL must be installed to run this example.",
                            QtGui.QMessageBox.Ok | QtGui.QMessageBox.Default,
                            QtGui.QMessageBox.NoButton)
*/
}

void AlarmWidget::changeSoundOutput()
{
    qDebug("changeSoundOutput called.");
    bool _rSoundON = radioSoundOn->isChecked();
    bool _rSoundOFF = radioSoundOFF->isChecked();

    if (_rSoundOFF)
    {
       radioButtonsSound = 0;
    }
    else
    {
       radioButtonsSound = 1;
    }
    // updateTimeUnits();
}

void AlarmWidget::changeTimeUnit()
{
    qDebug("changeTimeUnit called.");
    bool _rMinutes = radioMin->isChecked();
    bool _rSeconds = radioSec->isChecked();

    if (_rMinutes)
    {
       radioButtonsTime = 0;
    }
    else
    {
       radioButtonsTime = 1;
    }
    //qDebug("radioButtonsTime set to %d\n", radioButtonsTime);
    updateTimeUnits();
}

void AlarmWidget::updateTimeUnits()
{
    if (radioButtonsTime)
    {
        nSeconds = 1;
        timerValue->setSuffix(STR_SEC);
    }
    else
    {
        nSeconds = 60;
        timerValue->setSuffix(STR_MIN);
    }
}

void AlarmWidget::restoreSettingsFromINI()
{
    int nTmp = 0;

    nTmp = m_settings->restoreIntValues("MainWindow/Values/LastTimerValue");
    m_settings->restoreAppSizePos(this);
    
    timerValue->setValue (nTmp);

    nTmp = m_settings->restoreIntValues("MainWindow/Values/TimeUnit");
    radioButtonsTime = nTmp;
    
    qDebug ("radioButtonsTime = %d", radioButtonsTime);
    qDebug ("call changeTimeUnit() from restoreSettingsFromINI");    

    if (radioButtonsTime)
    {
        radioSec->setChecked(true);
    }
    else
    {
        radioMin->setChecked(true);
    }
    changeTimeUnit();
    
    nTmp = m_settings->restoreIntValues("MainWindow/Values/Sound_ON_OFF");
    radioButtonsSound = nTmp;    
    
    if (radioButtonsSound)
    {
        radioSoundOn->setChecked(true);
    }
    else
    {
        radioSoundOFF->setChecked(true);
    }
    
}

void AlarmWidget::closeEvent(QCloseEvent* e)
{
    m_timer_ctd->stop();
    m_settings->saveAppSizePos(this);
    m_settings->saveValues("MainWindow/Values/LastTimerValue", timerValue->value());

    m_settings->saveValues("MainWindow/Values/TimeUnit", radioButtonsTime);
    m_settings->saveValues("MainWindow/Values/Sound_ON_OFF", radioButtonsSound);
    //qDebug("radioButtonsTime= %d\n", radioButtonsTime);
}

void AlarmWidget::playSound()
{
    if (radioButtonsSound)
    {
        Beep(500, 100);
        Beep(300, 500);    
    }
    //time.sleep(0.2)    
}

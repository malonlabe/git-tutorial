#include "mywidget.h"

MyWidget::MyWidget(QWidget *parent)
     : QWidget(parent)
 {
    setWindowTitle(tr("Test thread project"));
    setFixedSize(550, 420);

    bQuit = new QPushButton(tr("&Quit"));
    bRnd = new QPushButton ("&RND");
    bCountDown = new QPushButton ("&Start CountDown");

    bQuit->setFont(QFont("Courier", 18, QFont::Bold));
    bRnd->setFont(QFont("Courier", 18, QFont::Bold));
    bCountDown->setFont(QFont("Courier", 18, QFont::Bold));

    lcd = new QLCDNumber();
    lcd->setSegmentStyle(QLCDNumber::Filled);
    lcd->setAutoFillBackground(1);
    lcd->display(0);

    QSlider *slider = new QSlider(Qt::Horizontal);
    slider->setRange(0, 999);
    slider->setValue(0);

    // line3 =    new QLineEdit (this);
    lnMSTime = new QLineEdit (this);

    QVBoxLayout *layout = new QVBoxLayout;
    QHBoxLayout *hLayout = new QHBoxLayout;
    connect(bQuit, SIGNAL(clicked()), qApp, SLOT(quit()));
    
    connect(bCountDown, SIGNAL(clicked()), this, SLOT (StartMyThread()));
    connect(bRnd, SIGNAL(clicked ()), this, SLOT (setValue ()));
    connect(slider, SIGNAL(valueChanged(int)), lcd, SLOT(display(int)));
    
    QObject::connect (&m_thread, SIGNAL(currentValue(int)),
                       lcd, SLOT(display(int)) );
    QObject::connect (&m_thread, SIGNAL(finished()),
                       qApp, SLOT(quit()));

    layout->addWidget(lcd);
    layout->addWidget(slider);
    layout->addWidget(lnMSTime);

    hLayout->addWidget(bRnd);
    hLayout->addWidget(bQuit);
    hLayout->addWidget(bCountDown);
    layout->addLayout(hLayout);
    
    setLayout(layout);
 }

 void MyWidget::StartMyThread()
 {
   m_thread.setMValue( lcd->intValue() );
   m_thread.start();
 }

 void MyWidget::setValue()
{
 lnMSTime->setText(QString::number(GetRNDValue()));
 lcd->display(lnMSTime->text());
 // lnMSTime->setText(QString::number(Get1msTimeMS() ));
 QApplication::beep();
}

int MyWidget::GetRNDValue()
{
int nRetVal=0;
static int nFirstTime = 1;

#ifdef QT_RND_SERVER

 if (1 == nFirstTime)
 {
  qsrand(QTime(0,0,0).secsTo(QTime::currentTime()));
  nFirstTime = 0;
 }
 nRetVal = (int)qrand();

#else

 int RND_MAX; // = 65;

 if (1 == nFirstTime)
 {
  srand (time (NULL));
  nFirstTime = 0;
 }
 nRetVal = 1 + (rand() % RND_MAX);

 //qDebug() << "Time: " << nRetVal;
 //qDebug() << "Execution done";
#endif

return nRetVal;
}

void MyWidget::onExit()
{
 close();
}





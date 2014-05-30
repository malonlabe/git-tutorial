#include "AlarmWidget.h"
#include <QtWidgets/QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
//    QApplication::setStyle(new QCleanlooksStyle);
    AlarmWidget w;
    w.show();
    return a.exec();
}

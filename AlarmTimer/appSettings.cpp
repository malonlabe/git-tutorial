#include "appSettings.h"

AppSettings::AppSettings(QString strCompanyName, QString strAppName)
{
    //settings - save stuff to the Register in Win32
    settings = new QSettings(strCompanyName, strAppName);
}

void AppSettings::restoreAppSizePos(QWidget *app)
{
    QSize size = settings->value("MainWindow/Size", QVariant(QSize(0, 0))).toSize();
    // Check if any data were stored already. if not - ignore resizing.
    if (size == (QSize(0, 0)))
    {
        return;
    }

    app->resize(size);
    QPoint position = settings->value("MainWindow/Position", QVariant(QPoint(0, 0))).toPoint();
    app->move(position);
}

void AppSettings::saveAppSizePos(QWidget *app)
{
    settings->setValue("MainWindow/Size", QVariant(app->size()));
    settings->setValue("MainWindow/Position", QVariant(app->pos()));
    // settings.setValue("MainWindow/State", QVariant(saveState()));
}


int AppSettings::restoreIntValues(QString strPath)
{
    int num = settings->value(strPath, QVariant("0")).toInt();
    return num;
}

QString AppSettings::restoreStrValues(QString strPath)
{
    QString num = settings->value(strPath, QVariant("0")).toString();
    return num;
}

void AppSettings::saveValues(QString strPath, QVariant qValue)
{
    settings->setValue(strPath, QVariant(qValue));
}
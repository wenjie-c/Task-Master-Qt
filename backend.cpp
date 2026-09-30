#include "backend.h"
#include <QDebug>

Backend::Backend()
{

}


void Backend::setMessage(QString text){
    qDebug() << text;
}


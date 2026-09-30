#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QProperty>
#include <QString>

class Backend : public QObject
{
    Q_OBJECT
public:
    Backend();
public slots:
    void setMessage(QString text);
};

#endif // BACKEND_H

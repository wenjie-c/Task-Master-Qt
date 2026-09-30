#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <backend.h>
#include<QtQml>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickWindow::setGraphicsApi(QSGRendererInterface::OpenGL); // necesario ya que no tenemos directx11 https://forum.freecad.org/viewtopic.php?t=81395
    QQmlApplicationEngine engine;

    const QUrl url(u"qrc:/Task-Master/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    Backend backend;
    engine.rootContext()->setContextProperty("backend",&backend); // Exponemos esta clase backend a qml
    return app.exec();
}

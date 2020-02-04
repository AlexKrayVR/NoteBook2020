#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include"modelnotebook.h"
#include<QQmlContext>
#include"notebookfile.h"
#include"QDebug"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

 qDebug() << QCoreApplication::applicationDirPath();


    ModelNoteBook *NoteBook=new ModelNoteBook;


    QQmlContext * context=engine.rootContext();
    context->setContextProperty("NoteBook", NoteBook);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

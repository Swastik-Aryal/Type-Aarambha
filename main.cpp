#include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "src/cpp/dataset.h"
#include "src/cpp/layoutswitcher.h"
#include "src/cpp/lesson.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    app.setWindowIcon(QIcon(":/assets/assets/img/typearrambhaicon.png"));

    LayoutSwitcher layoutSwitcher;
    engine.rootContext()->setContextProperty("layoutSwitcher", &layoutSwitcher);

    Lesson *lessonObj = new Lesson(worddDataset, 25, &app);
    engine.rootContext()->setContextProperty("lessonObj", lessonObj);

    Lesson *gameObj = new Lesson(worddDataset, 1, &app);
    engine.rootContext()->setContextProperty("gameObj", gameObj);

    const QUrl url(u"qrc:/main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

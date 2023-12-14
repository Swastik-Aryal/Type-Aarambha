#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "src/cpp/dataset.h"
#include "src/cpp/languageswitcher.h"
#include "src/cpp/lesson.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    LanguageSwitcher languageSwitcher;
    engine.rootContext()->setContextProperty("languageSwitcher", &languageSwitcher);

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

#include <QApplication>
#include <QIcon>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "src/cpp/dataset.h"
#include "src/cpp/layoutswitcher.h"
#include "src/cpp/lesson.h"
#include "src/cpp/lesson.h"
#include "testresultsmodel.h"
#include "resultssortfilterproxymodel.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    LayoutSwitcher layoutSwitcher;
    engine.rootContext()->setContextProperty("layoutSwitcher", &layoutSwitcher);

    Lesson *lessonObj = new Lesson(worddDataset, 25, &app);
    engine.rootContext()->setContextProperty("lessonObj", lessonObj);

    Lesson *gameObj = new Lesson(worddDataset, 1, &app);
    engine.rootContext()->setContextProperty("gameObj", gameObj);

    TestResultsModel *testResults = new TestResultsModel(&app);
    testResults->loadFromFile(QFile("results.csv"));
    engine.rootContext()->setContextProperty("testResultsModel", testResults);

    ResultsSortFilterProxyModel *proxyModel = new ResultsSortFilterProxyModel(&app);
    proxyModel->setSourceModel(testResults);
    engine.rootContext()->setContextProperty("resultsProxyModel", proxyModel);

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

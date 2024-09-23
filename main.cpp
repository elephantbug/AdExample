#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "ad/Ad.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("AdExample", "Main");

    {
        using namespace AdExample;

        auto ad = createAd();

        ad->load();
    }

    return app.exec();
}

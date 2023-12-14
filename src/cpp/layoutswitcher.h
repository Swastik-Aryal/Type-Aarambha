#ifndef LAYOUTSWITCHER_H
#define LAYOUTSWITCHER_H

#include <QCoreApplication>
#include <QObject>
#include <QWindowStateChangeEvent>
#include <Windows.h>

class LayoutSwitcher : public QObject
{
    Q_OBJECT
public:
    explicit LayoutSwitcher(QObject *parent = nullptr);
    Q_INVOKABLE void activateLayout(const QString &language);

protected:
    bool eventFilter(QObject *obj, QEvent *event) override;

private:
    HKL hklEnglish;
    HKL hklNepali;
    QString m_currentLanguage;
    void switchToEnglish();
    void switchToNepali();
};

#endif // LAYOUTSWITCHER_H

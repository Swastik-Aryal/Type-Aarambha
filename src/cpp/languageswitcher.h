#ifndef LANGUAGESWITCHER_H
#define LANGUAGESWITCHER_H

#include <QObject>
#include <Windows.h>

class LanguageSwitcher : public QObject
{
    Q_OBJECT
public:
    explicit LanguageSwitcher(QObject *parent = nullptr);

public slots:
    void switchToEnglish();
    void switchToNepali();

private:
    HKL hklEnglish;
    HKL hklNepali;
};

#endif // LANGUAGESWITCHER_H

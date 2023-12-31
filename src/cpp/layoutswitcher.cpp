#include "layoutswitcher.h"

LayoutSwitcher::LayoutSwitcher(QObject *parent)
    : QObject(parent)
{
    // Load the keyboard layouts for English and Nepali
    hklEnglish = LoadKeyboardLayout(L"00000409", KLF_ACTIVATE);
    hklNepali = LoadKeyboardLayout(L"00000461", KLF_ACTIVATE);
    QCoreApplication::instance()->installEventFilter(this);
    m_currentLanguage = "english";
}

void LayoutSwitcher::activateLayout(const QString &language)
{
    if (language == "english") {
        switchToEnglish();
        m_currentLanguage = "english";
    }
    if (language == "nepali") {
        switchToNepali();
        m_currentLanguage = "nepali";
    }
}
void LayoutSwitcher::switchToEnglish()
{
    ActivateKeyboardLayout(hklEnglish, KLF_SETFORPROCESS);
}

void LayoutSwitcher::switchToNepali()
{
    ActivateKeyboardLayout(hklNepali, KLF_SETFORPROCESS);
}

/*
 * Deals with changing the layout when application is out of focus or closed
 */
bool LayoutSwitcher::eventFilter(QObject *obj, QEvent *event)
{
    if (event->type() == QEvent::Close) {
        switchToEnglish();
    }
    if (event->type() == QEvent::FocusOut) {
        switchToEnglish();
    }
    if (event->type() == QEvent::FocusIn) {
        //switch to current language
        activateLayout(m_currentLanguage);
    }
    // Standard event processing
    return QObject::eventFilter(obj, event);
}

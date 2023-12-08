#include "languageswitcher.h"

LanguageSwitcher::LanguageSwitcher(QObject *parent)
    : QObject(parent)
{
    // Load the keyboard layouts for English and Nepali
    hklEnglish = LoadKeyboardLayout(L"00000409", KLF_ACTIVATE);
    hklNepali = LoadKeyboardLayout(L"00000461", KLF_ACTIVATE);
}

void LanguageSwitcher::switchToEnglish()
{
    ActivateKeyboardLayout(hklEnglish, KLF_SETFORPROCESS);
}

void LanguageSwitcher::switchToNepali()
{
    ActivateKeyboardLayout(hklNepali, KLF_SETFORPROCESS);
}

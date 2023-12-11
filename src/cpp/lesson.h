#ifndef LESSON_H
#define LESSON_H

#include <QObject>
#include <random>
#include <string>
#include <vector>
#include <iostream>

class Lesson : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString textPrompt READ textPrompt NOTIFY textPromptChanged)
    Q_PROPERTY(QString currentLanguage READ getCurrentLanguage WRITE setCurrentLanguage NOTIFY
                   currentLanguageChanged)


public:
    explicit Lesson(const std::vector<std::vector<QString>> &wordDataset,
                    unsigned wordsPerSample,
                    QObject *parent = nullptr);
    QString textPrompt() const;
    QString getCurrentLanguage() const;

    Q_INVOKABLE void reset();
    Q_INVOKABLE bool processgameKbInput(QString input, bool backspacePressed, bool spacePressed, const QString &currentMode);
    Q_INVOKABLE unsigned calculateWPM(unsigned testTimeSec) const;
    Q_INVOKABLE unsigned calculateAccuracy() const;

public slots:
    // Add setCurrentLanguage to the public slots
    void setCurrentLanguage(const QString &language);

private:
    bool newCharIsCorrect(const QString &currentWord, const QString &input) const;
    void setCurrentWordColor(const QString &currentWord, const QString &input, const QString &currentMode);
    void sampleWordDataset();
    void updateTextPrompt(bool initialize);

    unsigned m_currentWordIdx = 0;
    unsigned m_wordsPerSample = 0;
    unsigned m_correctChars = 0;
    unsigned m_totalTypedChars = 0;
    unsigned m_incorrect_chars=0;
    unsigned m_totalAcceptedChars = 0; /* for calculating WPM */

    /* formated string (color) containing the current test word sample. */
    QString m_textPrompt;
    QString m_textPromptFinished; /* Completed words in the current sample, so far */
    QString m_textPromptCurrentWord;
    QString m_textPromptUntyped;

    QString m_currentLanguage;

    std::vector<QString> m_currentWordSample; /* words which are currently on the screen */
    const std::vector<std::vector<QString>> &m_wordDataset;
    /* for sampling the word dataset */
    std::random_device m_rd;
    std::mt19937 m_rng;
    std::uniform_int_distribution<int> m_randomWordIdx;

signals:
    void textPromptChanged();
    void currentLanguageChanged();
};

#endif // LESSON_H
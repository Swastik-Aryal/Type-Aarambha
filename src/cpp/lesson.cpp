#include <QDebug>
#include <QString>
#include <QStringView>
#include <algorithm>
#include <random>

#include "lesson.h"

Lesson::Lesson(const std::vector<std::vector<QString>> &wordDataset,
               unsigned wordsPerSample,
               QObject *parent)
    : QObject{parent}
    , m_wordsPerSample{wordsPerSample}
    , m_currentWordSample(wordsPerSample, "")
    , m_wordDataset{wordDataset}
    , m_rng{m_rd()}
    , m_randomWordIdx{std::uniform_int_distribution<int>(0, m_wordDataset[0].size() - 1)}
{
    reset();
}

void Lesson::reset()
{
    m_correctChars = 0;
    m_totalTypedChars = 0;
    m_totalAcceptedChars = 0;
    m_nextCharacterIndex = 0;
    m_lessonEnded = false;
    sampleWordDataset();
    updateTextPrompt(true);
}

void Lesson::restart()
{
    m_correctChars = 0;
    m_totalTypedChars = 0;
    m_totalAcceptedChars = 0;
    m_nextCharacterIndex = 0;
    m_lessonEnded = false;
    m_currentWordIdx = 0;
    qDebug() << m_currentWordIdx;
    updateTextPrompt(true);
}

void Lesson::sampleWordDataset()
{
    m_currentWordIdx = 0;
    auto getRandomWord = [&] {
        int languageIndex = (m_currentLanguage == "english") ? 1 : 0;
        return m_wordDataset[languageIndex][m_randomWordIdx(m_rng)];
    };
    std::generate(m_currentWordSample.begin(), m_currentWordSample.end(), getRandomWord);
}

bool Lesson::newCharIsCorrect(const QString &currentWord, const QString &input) const
{
    if (input.size() > currentWord.size()) {
        return input.endsWith(" ");
    }
    return input.back() == currentWord[input.size() - 1];
}

/*
 * This function should be called every time the user presses a key.
 *
 * - Update character counts (corrent and total).
 * - Update color of the current word depending on text input correctness.
 * - Go to the next word if space was pressed.
 * - Load new word sample if all words in the current sample were typed.
 */
void Lesson::processKbInput(const QString &input,
                            bool backspacePressed,
                            bool spacePressed,
                            const QString &currentMode)
{
    // mode true means lesson
    QString initialcolor = "#CCCCB5";
    if (currentMode == "game"){
        initialcolor = "black";
    }
    const QString &currentLessonWord = m_currentWordSample[m_currentWordIdx];
    QString wordColor;
    bool resetTextPrompt = false;

    /* Update character counts only if keypress was not backspace. */
    if (!backspacePressed) {
        if (newCharIsCorrect(currentLessonWord, input)) {
            m_correctChars++;
            if (m_currentWordIdx + 1 == m_wordsPerSample && input == currentLessonWord) {
                endLesson();
            }
        }
        m_totalTypedChars++;
    }
    if (spacePressed) {
        /* Update accepted character count, set color for typed word
         * and change active word in test prompt. */
        QStringView typedWord(input.constData(), input.size() - 1);
        if (typedWord == currentLessonWord) {
            m_totalAcceptedChars += input.size();
            wordColor = initialcolor;
        } else {
            wordColor = "#B81B2C";
        }
        m_textPromptFinished.append(
            QString("<font color='%1'>%2 </font>").arg(wordColor, currentLessonWord));
        m_currentWordIdx++;
        if (m_currentWordIdx == m_wordsPerSample) {
            sampleWordDataset();
            resetTextPrompt = true;
            endLesson();
        } else {
            const QString &nextTestWord = m_currentWordSample[m_currentWordIdx];
            m_textPromptCurrentWord = QString("<u>%1</u>").arg(nextTestWord);
            m_textPromptUntyped.remove(0, nextTestWord.size() + 1);
        }

    } else {
        /* Set color for each typed letter of current word,
         * depending on correctness. */
        setCurrentWordColor(currentLessonWord, input, currentMode);
    }
    updateTextPrompt(resetTextPrompt);
}

void Lesson::processgameKbInput(const QString &input,
                                const QString &currentMode)
{

    QString initialcolor = "white";
    if (currentMode == "game") {
        initialcolor = "black";
    }
    const QString &currentLessonWord = m_currentWordSample[m_currentWordIdx];

    bool resetTextPrompt = false;
    m_lessonEnded = false;

    /* Update character counts*/

    if (newCharIsCorrect(currentLessonWord, input)) {
        m_correctChars++;
    }
    m_totalTypedChars++;

    if (m_currentWordIdx + 1 == m_wordsPerSample && input.size() == currentLessonWord.size()){
        endLesson();
        sampleWordDataset();
        resetTextPrompt = true;
    }

    setCurrentWordColor(currentLessonWord, input, currentMode);

    updateTextPrompt(resetTextPrompt);
}

/*
 * Color each letter of the current word:
 *  - for typed letters choose color (white/red) depending on correctness
 *  - keep default color gray if the letter wasn't typed yet
 */
void Lesson::setCurrentWordColor(const QString &currentWord, const QString &userInput, const QString &currentMode)
{
    QString initialcolor = "#CCCCB5";
    if (currentMode == "game"){
        initialcolor = "black";
    }
    unsigned numTypedChars = std::min(currentWord.size(), userInput.size());
    unsigned numUntypedChars = currentWord.size() - numTypedChars;
    m_textPromptCurrentWord.clear();
    for (unsigned i = 0; i < numTypedChars; i++) {
        QString color = initialcolor;
        if (userInput[i] != currentWord[i]) {
            color = "#B81B2C";
        }
        m_textPromptCurrentWord.append(
            QString("<font color='%1'>%2</font>").arg(color, currentWord[i]));
    }
    /* append untyped part of word (with default color) */
    m_textPromptCurrentWord.append(QStringView(currentWord).right(numUntypedChars));
    m_textPromptCurrentWord = QString("<u>%1</u>").arg(m_textPromptCurrentWord);
}

/*
 * returns the character that the user is supposed to type next
 */
QString Lesson::getNextCharacter(const QString &userInput, bool spacePressed) const
{
    const QString &currentLessonWord = m_currentWordSample[m_currentWordIdx];

    if (spacePressed) {
        return currentLessonWord.at(0);
    } else {
        if (userInput.length() < currentLessonWord.length()) {
            return currentLessonWord.at(userInput.length());
        } else {
            return "space";
        }
    }
}

/*
 * textPrompt contains a sample of words that the user should type.
 * The current word is underlined.
 * Words are colored depending on input correctness.
 */
QString Lesson::textPrompt() const
{
    return m_textPrompt;
}

QString Lesson::getCurrentLanguage() const
{
    return m_currentLanguage;
}

void Lesson::setCurrentLanguage(const QString &language)
{
    if (m_currentLanguage != language) {
        m_currentLanguage = language;
        reset();
        emit currentLanguageChanged();

    }
}

void Lesson::endLesson()
{
    m_lessonEnded = true;
    emit lessonEndedChanged();
}

bool Lesson::lessonEnded() const
{
    return m_lessonEnded;
}

void Lesson::updateTextPrompt(bool initialize = false)
{
    if (initialize) {
        m_textPromptFinished.clear();
        m_textPromptCurrentWord = QString("<u>%1</u>").arg(m_currentWordSample[0]);
        m_textPromptUntyped.clear();
        m_textPromptUntyped = std::accumulate(m_currentWordSample.begin() + 1,
                                              m_currentWordSample.end(),
                                              m_textPromptUntyped,
                                              [](QString &untypedWords, QString &word) {
                                                  return untypedWords + " " + word;
                                              });
    }
    m_textPrompt.clear();
    m_textPrompt.append(m_textPromptFinished);
    m_textPrompt.append(m_textPromptCurrentWord);
    m_textPrompt.append(m_textPromptUntyped);
    emit textPromptChanged();
}

/*
 * Calculate the number of correctly typed words per minute.
 * Assume average word length is 5 like on most typing websites.
 */
float Lesson::calculateWPM(unsigned lessonDuration) const
{
    float wpm = static_cast<float>(m_totalAcceptedChars) / 5 * 60. / (lessonDuration / 1000);
    return (wpm);
}

float Lesson::calculateAccuracy() const
{
    float acc = static_cast<float>(m_correctChars) / m_totalTypedChars;
    return (acc * 100);
}

unsigned Lesson::getCorrectChars() const
{
    return m_correctChars;
}

unsigned Lesson::getTotalTypedChars() const
{
    return m_totalTypedChars;
}

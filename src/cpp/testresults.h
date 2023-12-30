#ifndef TESTINFO_H
#define TESTINFO_H

#include <QString>

/*
 * Holds information about a finished test attempt.
 */
class TestResults
{
public:
    TestResults(unsigned WPM, unsigned accuracy, unsigned testDuration);
    TestResults(unsigned WPM, unsigned accuracy, unsigned testDuration, long long timestamp);
    unsigned WPM() const;
    unsigned accuracy() const;
    unsigned testDuration() const;
    long long timestamp() const;
private:
    unsigned m_WPM;
    unsigned m_accuracy;
    unsigned m_testDuration;
    long long m_timestamp;
};

#endif // TESTINFO_H

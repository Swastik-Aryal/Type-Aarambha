#include <QDateTime>
#include <QString>
#include "testresults.h"


TestResults::TestResults(unsigned WPM, unsigned accuracy, unsigned testDuration)
    : m_WPM{WPM}, m_accuracy{accuracy}, m_testDuration{testDuration},
    m_timestamp{QDateTime::currentSecsSinceEpoch()}
{

}

TestResults::TestResults(unsigned WPM, unsigned accuracy,
                         unsigned testDuration, long long timestamp)
    : m_WPM{WPM}, m_accuracy{accuracy}, m_testDuration{testDuration},
    m_timestamp{timestamp}
{

}

unsigned TestResults::WPM() const
{
    return m_WPM;
}

unsigned TestResults::accuracy() const
{
    return m_accuracy;
}

unsigned TestResults::testDuration() const
{
    return m_testDuration;
}

qint64 TestResults::timestamp() const
{
    return m_timestamp;
}

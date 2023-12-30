#include "testresults.h"
#include "testresultsmodel.h"
#include <QDateTime>
#include <QFile>
#include <QDebug>


TestResultsModel::TestResultsModel(QObject *parent)
    : QAbstractTableModel(parent)
{
}

QVariant TestResultsModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if (orientation == Qt::Horizontal && role == Qt::DisplayRole) {
        switch (section) {
        case ResultsColumn::WPM:
            return QString("WPM");
        case ResultsColumn::Accuracy:
            return QString("Accuracy");
        case ResultsColumn::TestDuration:
            return QString("Duration");
        case ResultsColumn::DateTime:
            return QString("Date, Time");
        }
    }
    return QVariant();
}

int TestResultsModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    return static_cast<int>(m_testResultsList.size());
}

int TestResultsModel::columnCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    return ResultsColumn::count;
}

QVariant TestResultsModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || role != Qt::DisplayRole)
        return QVariant();

    if (index.row() < 0 || static_cast<size_t>(index.row()) >= m_testResultsList.size()) {
        return QVariant();
    }

    const TestResults& testResults = m_testResultsList[index.row()];

    switch (index.column()) {
    case ResultsColumn::WPM:
        return testResults.WPM();
    case ResultsColumn::Accuracy:
        return testResults.accuracy();
    case ResultsColumn::TestDuration:
        return testResults.testDuration();
    case ResultsColumn::DateTime:
        return QDateTime::fromSecsSinceEpoch(testResults.timestamp());
    }

    return QVariant();
}

void TestResultsModel::appendEntry(unsigned WPM, unsigned accuracy, unsigned testDuration)
{
    beginInsertRows(QModelIndex(), static_cast<int>(m_testResultsList.size()),
                    static_cast<int>(m_testResultsList.size()));
    m_testResultsList.push_back(TestResults(WPM, accuracy, testDuration));
    endInsertRows();
}

void TestResultsModel::loadFromFile(QFile file)
{
    if (file.open(QIODevice::ReadOnly)) {
        QTextStream stream(&file);
        QString line;
        line = stream.readLine(); // skip header
        while (true) {
            line = stream.readLine();
            if(line.isNull()) {
                break;
            }
            if(line.isEmpty()) {
                continue;
            }
            QStringList row = line.split(",");
            unsigned WPM = row[ResultsColumn::WPM].toUInt();
            unsigned accuracy = row[ResultsColumn::Accuracy].toUInt();
            unsigned testDuration = row[ResultsColumn::TestDuration].toUInt();
            long long timestamp = row[ResultsColumn::DateTime].toLongLong();
            m_testResultsList.push_back(TestResults(WPM, accuracy, testDuration, timestamp));
        }
    }
}

void TestResultsModel::saveToFile(QString path)
{
    QFile file(path);
    if (file.open(QIODevice::WriteOnly)) {
        QTextStream out(&file);
        out << "wpm,accuracy,testDuration,timestamp\n";
        for (TestResults& result : m_testResultsList) {
            out << result.WPM() << ","
                << result.accuracy() << ","
                << result.testDuration() << ","
                << result.timestamp() << "\n";
        }
    }
}

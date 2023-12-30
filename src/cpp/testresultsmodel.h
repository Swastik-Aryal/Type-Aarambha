#ifndef TESTINFOMODEL_H
#define TESTINFOMODEL_H

#include <vector>
#include <QAbstractTableModel>
#include <QFile>
#include "testresults.h"


enum ResultsColumn {
    WPM = 0,
    Accuracy,
    TestDuration,
    DateTime,
    count /* number of columns */
};

class TestResultsModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit TestResultsModel(QObject *parent = nullptr);

    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent) const override;

    void loadFromFile(QFile file);

public slots:
    void saveToFile(QString path);
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    void appendEntry(unsigned WPM, unsigned accuracy, unsigned testDuration);

private:
    // test attempt info list
    std::vector<TestResults> m_testResultsList;
};

#endif // TESTINFOMODEL_H

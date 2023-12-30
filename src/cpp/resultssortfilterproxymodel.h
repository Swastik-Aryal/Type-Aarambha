#ifndef RESULTSSORTFILTERPROXYMODEL_H
#define RESULTSSORTFILTERPROXYMODEL_H

#include <QDate>
#include <QSortFilterProxyModel>

#include "testresults.h"
#include "testresultsmodel.h"

class ResultsSortFilterProxyModel : public QSortFilterProxyModel
{
    Q_OBJECT

public:
    ResultsSortFilterProxyModel(QObject *parent = nullptr);

    int filterDuration() const { return m_duration; }
    Q_INVOKABLE void sort(int column, Qt::SortOrder order = Qt::AscendingOrder) override;
    Q_INVOKABLE int sortColumn() const;
    Q_INVOKABLE int sortOrder() const;
    Q_INVOKABLE void setFilterDuration(int duration);

protected:
    bool filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const override;
    bool lessThan(const QModelIndex &left, const QModelIndex &right) const override;

private:
    int m_duration = 0; // show results for any test duration if set to 0
};

#endif // RESULTSSORTFILTERPROXYMODEL_H

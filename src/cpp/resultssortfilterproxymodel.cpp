#include "resultssortfilterproxymodel.h"

ResultsSortFilterProxyModel::ResultsSortFilterProxyModel(QObject *parent)
    : QSortFilterProxyModel(parent)
{
}

void ResultsSortFilterProxyModel::setFilterDuration(int duration)
{
    m_duration = duration;
    invalidateFilter();
}

void ResultsSortFilterProxyModel::sort(int column, Qt::SortOrder order)
{
    QSortFilterProxyModel::sort(column, order);
}

int ResultsSortFilterProxyModel::sortColumn() const
{
    return QSortFilterProxyModel::sortColumn();
}

int ResultsSortFilterProxyModel::sortOrder() const
{
    return QSortFilterProxyModel::sortOrder();
}

bool ResultsSortFilterProxyModel::filterAcceptsRow(int sourceRow,
                                                   const QModelIndex &sourceParent) const
{
    if (m_duration == 0) {
        // any test duration is fine
        return true;
    }
    QModelIndex durationIdx =
        sourceModel()->index(sourceRow, ResultsColumn::TestDuration, sourceParent);

    return sourceModel()->data(durationIdx) == m_duration;
}

bool ResultsSortFilterProxyModel::lessThan(const QModelIndex &left,
                                           const QModelIndex &right) const
{
    QVariant leftData = sourceModel()->data(left);
    QVariant rightData = sourceModel()->data(right);

    if (leftData.userType() == QMetaType::QDateTime) {
        return leftData.toDateTime() < rightData.toDateTime();
    }
    return leftData.toUInt() < rightData.toUInt();
}

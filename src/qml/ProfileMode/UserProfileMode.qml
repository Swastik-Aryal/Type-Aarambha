import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtCharts
import Qt.labs.qmlmodels 1.0

FocusScope {
    property int _tickCount: 0
    property int __currentView: 1 //int to indicate the current view; table: 1; chart: 2

    anchors.fill: parent

    function appendToWPMSeries(time, wpm) {
        console.log("Appending to series:", time, wpm)
        _tickCount = _tickCount < 20 ? time : 20
        wpmSeries.append(time, wpm)
        console.log("Series count:", wpmSeries.count)
    }

    function clearWPMSeries() {
        // remove all points
        wpmSeries.removePoints(0, wpmSeries.count)
    }

    //selection bar
    Rectangle {
        implicitWidth: parent.width * 0.20
        implicitHeight: parent.height * 0.065
        anchors {
            centerIn: parent
            verticalCenterOffset: -parent.height / 4.1
        }
        color: "#151A21"
        radius: 15

        Item {
            id: _innerRect
            implicitWidth: parent.width
            implicitHeight: parent.height * 0.65
            anchors.verticalCenter: parent.verticalCenter

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.preferredWidth: 1
                    RowLayout {
                        anchors.fill: parent
                        spacing: 0

                        Item {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.preferredWidth: 0.8

                            Image {
                                id: _tableIcon
                                source: "qrc:/assets/assets/img/table-icon-on.svg"
                                fillMode: Image.PreserveAspectFit
                                scale: 0.45
                                anchors.centerIn: parent
                                anchors.horizontalCenterOffset: parent.width / 4
                            }
                        }
                        Item {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.preferredWidth: 1.6

                            Text {
                                text: "chart"
                                font.family: _NotoSansRegular.name
                                font.pixelSize: parent.height * 0.48
                                color: "#4B5975"
                                anchors.centerIn: parent
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        onClicked: {
                            __currentView = 1
                        }
                    }
                }

                Rectangle {
                    color: "#1B2028"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.preferredWidth: 0.04
                    radius: 50
                }

                Item {

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.preferredWidth: 1
                    RowLayout {
                        anchors.fill: parent
                        spacing: 0

                        Item {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.preferredWidth: 0.8

                            Image {
                                id: _chartIcon
                                source: "qrc:/assets/assets/img/chart-icon-on.svg"
                                fillMode: Image.PreserveAspectFit
                                scale: 0.45
                                anchors.centerIn: parent
                                anchors.horizontalCenterOffset: parent.width / 4
                            }
                        }
                        Item {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.preferredWidth: 1.6

                            Text {
                                text: "graph"
                                font.family: _NotoSansRegular.name
                                font.pixelSize: parent.height * 0.48
                                color: "#4B5975"
                                anchors.centerIn: parent
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        onClicked: {
                            __currentView = 2
                        }
                    }
                }
            }
        }
    }

    states: [
        State {
            name: "tableState"
            when: __currentView === 1

            PropertyChanges {
                target: _tableView
                opacity: 1
            }
            PropertyChanges {
                target: _tableIcon
                source: "qrc:/assets/assets/img/table-icon-on.svg"
            }
            PropertyChanges {
                target: wpmChart
                opacity: 0
            }
            PropertyChanges {
                target: _chartIcon
                source: "qrc:/assets/assets/img/chart-icon-off.svg"
            }
        },
        State {
            name: "chartState"
            when: __currentView === 2
            PropertyChanges {
                target: _tableView
                opacity: 0
            }
            PropertyChanges {
                target: _tableIcon
                source: "qrc:/assets/assets/img/table-icon-off.svg"
            }
            PropertyChanges {
                target: wpmChart
                opacity: 1
            }
            PropertyChanges {
                target: _chartIcon
                source: "qrc:/assets/assets/img/chart-icon-on.svg"
            }
        }
    ]

    Item {
        id: _tableView
        width: parent.width * 0.5
        height: parent.height * 0.6
        anchors.centerIn: parent
        anchors.verticalCenterOffset: parent.height / 7

        ScrollView {
            anchors.horizontalCenter: parent.horizontalCenter

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                HorizontalHeaderView {
                    id: resultsTableHeader
                    syncView: resultsTable
                    boundsMovement: Flickable.StopAtBounds
                    delegate: Rectangle {
                        implicitWidth: column !== 3 ? 150 : 250
                        implicitHeight: 50
                        color: "#151A21"
                        Text {
                            font.pixelSize: 20
                            font.family: _NotoSansMedium.name
                            color: "#CCCCB5"
                            text: display
                            anchors.centerIn: parent
                        }
                    }
                }

                TableView {
                    id: resultsTable
                    width: 720
                    height: 400
                    columnSpacing: 0

                    rowSpacing: 0
                    clip: true
                    boundsMovement: Flickable.StopAtBounds
                    model: resultsProxyModel

                    delegate: Rectangle {
                        color: row % 2 !== 0 ? "#151A21" : "transparent"
                        implicitWidth: column !== 3 ? 150 : 250
                        implicitHeight: 50

                        Text {
                            // handle date formatting
                            text: column === 3 ? display.toLocaleString(
                                                     Qt.locale(),
                                                     "dd/mm/yy, hh:mm") : display
                            color: "#4B5975"
                            font.pixelSize: 20
                            font.family: _NotoSansRegular.name
                            anchors.centerIn: parent
                        }
                    }
                    ScrollBar.vertical: ScrollBar {
                        active: true
                        visible: resultsTable.contentHeight > resultsTable.height
                        contentItem: Rectangle {
                            implicitWidth: 8
                            opacity: enabled ? 1 : 0.3
                            color: "#151A21"
                            radius: 4
                        }
                    }
                }
            }
        }
    }
    ChartView {
        id: wpmChart
        antialiasing: true
        legend.visible: false
        width: 1100
        height: 450
        anchors.centerIn: parent
        anchors.verticalCenterOffset: parent.height / 7
        backgroundColor: "transparent"
        visible: true

        SplineSeries {
            id: wpmSeries
            name: "wpm"
            color: "#23A9D5"
            width: 3

            axisX: ValueAxis {
                color: "#151A21"
                labelsColor: "#4B5975"
                labelsFont.pixelSize: 16
                labelsFont.family: _NotoSansMono.name
                labelsFont.letterSpacing: 2
                gridLineColor: "#151A21"
                titleText: "<font color='#4B5975'>Time</font>"
                min: 0
                max: {
                    let t = 0
                    for (var i = 0; i < wpmSeries.count; i++) {
                        let time = wpmSeries.at(i).x
                        if (time > t) {
                            t = time
                        }
                    }
                    return t
                }

                tickCount: _tickCount
                labelFormat: "%d"
            }

            axisY: ValueAxis {
                color: "#151A21"
                labelsColor: "#4B5975"
                labelsFont.pixelSize: 16
                labelsFont.family: _NotoSansMono.name
                labelsFont.letterSpacing: 2
                gridLineColor: "#151A21"
                min: 0
                max: {
                    let max = 0
                    for (var i = 0; i < wpmSeries.count; i++) {
                        let wpm = wpmSeries.at(i).y
                        if (wpm > max - (max * 0.15)) {
                            max = wpm + (wpm * 0.15)
                        }
                    }
                    return max
                }
                labelFormat: "%d"
                titleText: "<font color='#4B5975'>Words Per Minute</font>"
            }
        }
    }
}

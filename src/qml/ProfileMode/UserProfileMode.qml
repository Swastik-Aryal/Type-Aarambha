import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtCharts
import Qt.labs.qmlmodels 1.0

FocusScope {
    property int _tickCount: 0

    anchors.fill: parent
    function appendToWPMSeries(time, wpm) {
        console.log("Appending to series:", time, wpm)
        _tickCount = time
        wpmSeries.append(time, wpm)
        //wpmSeries.append(0, 0)
        //wpmSeries.append(5, 10)
        //wpmSeries.append(8, 15)
        console.log("Series count:", wpmSeries.count)
    }

    function clearWPMSeries() {
        // remove all points
        wpmSeries.removePoints(0, wpmSeries.count)
    }
    Item {
        id: _tableView
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        anchors.verticalCenterOffset: parent.height / 4

        ScrollView {
            anchors.horizontalCenter: parent.horizontalCenter

            ColumnLayout {
                anchors.fill: parent
                spacing: 10

                HorizontalHeaderView {
                    id: resultsTableHeader
                    syncView: resultsTable
                    //anchors.left: resultsTable.left
                    //anchors.top: orderSelector.bottom
                    // anchors {
                    //     centerIn: parent
                    //     verticalCenterOffset: -parent.height / 4.5
                    // }
                    //anchors.topMargin: 20
                    boundsMovement: Flickable.StopAtBounds
                    delegate: Rectangle {
                        implicitWidth: column !== 3 ? 110 : 180
                        implicitHeight: 40
                        color: "transparent"
                        Text {
                            font.pixelSize: 20
                            color: "#ffffff"
                            text: display
                            anchors.centerIn: parent
                        }
                    }
                }

                TableView {
                    id: resultsTable
                    width: 540
                    height: 350

                    // anchors.top: resultsTableHeader.bottom
                    // anchors.horizontalCenter: parent.horizontalCenter
                    columnSpacing: 2

                    rowSpacing: 1
                    clip: true
                    boundsMovement: Flickable.StopAtBounds
                    model: resultsProxyModel

                    delegate: Rectangle {
                        color: row % 2 === 0 ? "#2b2a2a" : "transparent"
                        implicitWidth: column !== 3 ? 110 : 180
                        implicitHeight: 40

                        Text {
                            // handle date formatting
                            text: column === 3 ? display.toLocaleString(
                                                     Qt.locale(),
                                                     "yyyy/MM/dd hh:mm:ss") : display
                            color: "#ffffff"
                            font.pixelSize: 16
                            anchors.centerIn: parent
                        }
                    }
                    ScrollBar.vertical: ScrollBar {
                        active: true
                        visible: resultsTable.contentHeight > resultsTable.height
                        contentItem: Rectangle {
                            implicitWidth: 8
                            opacity: enabled ? 1 : 0.3
                            color: "#c58940"
                        }
                    }
                }

                //property int __lessonDuration: 15
                //property int wpm: 0
                //property int accuracy: 0
                //implicitWidth: 640
                //implicitHeight: 300
                ChartView {
                    id: wpmChart
                    antialiasing: true

                    //anchors.fill: parent
                    // anchors.top: resultsTable.bottom
                    // anchors.topMargin: 10
                    // anchors.horizontalCenter: parent.horizontalCenter
                    legend.visible: false
                    width: 640
                    height: 300
                    backgroundColor: "transparent"
                    visible: true

                    LineSeries {
                        id: wpmSeries
                        name: "wpm"
                        color: "#91170c"
                        width: 3

                        axisX: ValueAxis {
                            color: "#61584e"
                            labelsColor: "#847869"
                            labelsFont.pixelSize: 14
                            labelsFont.bold: true
                            gridLineColor: "#61584e"
                            titleText: "<font color='#847869'>Time (s)</font>"
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
                            color: "#61584e"
                            labelsColor: "#847869"
                            labelsFont.pixelSize: 14
                            labelsFont.bold: true
                            gridLineColor: "#61584e"
                            min: 0
                            max: {
                                let max = 0
                                for (var i = 0; i < wpmSeries.count; i++) {
                                    let wpm = wpmSeries.at(i).y
                                    if (wpm > max) {
                                        max = wpm
                                    }
                                }
                                return max
                            }
                            titleText: "<font color='#847869'>Current WPM</font>"
                        }
                    }
                }
            }
        }
    }
}

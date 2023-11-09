import QtQuick
import QtQuick.Layouts

Item {
    id: _keyboardLayoutItem
    implicitWidth: parent.width * 0.50
    implicitHeight: parent.height * 0.25

    anchors {
        horizontalCenter: parent.horizontalCenter // Center horizontally in parent
        verticalCenter: parent.verticalCenter
        verticalCenterOffset: parent.height / 4
    }

    ColumnLayout {
        anchors.fill: parent
        Layout.alignment: Qt.AlignVCenter
        spacing: 4
        RowLayout {

            Layout.alignment: Qt.AlignHCenter
            spacing: 4
            Keycap {

                __keyText: "`"
            }
            Keycap {

                __keyText: "1"
            }
            Keycap {

                __keyText: "2"
            }
            Keycap {

                __keyText: "3"
            }
            Keycap {

                __keyText: "4"
            }
            Keycap {

                __keyText: "5"
            }
            Keycap {

                __keyText: "6"
            }
            Keycap {

                __keyText: "7"
            }
            Keycap {

                __keyText: "8"
            }
            Keycap {

                __keyText: "9"
            }
            Keycap {

                __keyText: "0"
            }
            Keycap {

                __keyText: "-"
            }
            Keycap {

                __keyText: "="
            }
            Keycap {
                width: __keyWidth * 2.25
                __keyText: "<-"
            }
        }
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 4
            Keycap {
                width: __keyWidth * 1.625
                __keyText: "Tab"
            }
            Keycap {

                __keyText: "Q"
            }
            Keycap {

                __keyText: "W"
            }
            Keycap {

                __keyText: "E"
            }
            Keycap {

                __keyText: "R"
            }
            Keycap {

                __keyText: "T"
            }
            Keycap {

                __keyText: "Y"
            }
            Keycap {

                __keyText: "U"
            }
            Keycap {

                __keyText: "I"
            }
            Keycap {

                __keyText: "O"
            }
            Keycap {

                __keyText: "P"
            }
            Keycap {

                __keyText: "["
            }
            Keycap {

                __keyText: "]"
            }
            Keycap {
                width: __keyWidth * 1.625
                __keyText: "\\"
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            spacing: 4
            Keycap {
                width: __keyWidth * 2
                __keyText: "Caps"
            }
            Keycap {

                __keyText: "A"
            }
            Keycap {

                __keyText: "S"
            }
            Keycap {

                __keyText: "D"
            }
            Keycap {

                __keyText: "F"
            }
            Keycap {

                __keyText: "G"
            }
            Keycap {

                __keyText: "H"
            }
            Keycap {

                __keyText: "J"
            }
            Keycap {

                __keyText: "K"
            }
            Keycap {

                __keyText: "L"
            }
            Keycap {

                __keyText: ";"
            }
            Keycap {

                __keyText: "'"
            }
            Keycap {
                width: __keyWidth * 2.35
                __keyText: "<-"
            }
        }
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 4
            Keycap {
                width: __keyWidth * 2.725
                __keyText: "SHIFT"
            }
            Keycap {

                __keyText: "Z"
            }
            Keycap {

                __keyText: "X"
            }
            Keycap {

                __keyText: "C"
            }
            Keycap {

                __keyText: "V"
            }
            Keycap {

                __keyText: "B"
            }
            Keycap {

                __keyText: "N"
            }
            Keycap {

                __keyText: "M"
            }
            Keycap {

                __keyText: ","
            }
            Keycap {

                __keyText: "."
            }
            Keycap {

                __keyText: "/"
            }
            Keycap {
                width: __keyWidth * 2.725
                __keyText: "SHIFT"
            }
        }
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 4
            Layout.fillHeight: true
            Keycap {
                width: __keyWidth * 3.125
                __keyText: "CTRL"
            }
            Keycap {
                width: __keyWidth * 1.625
                __keyText: "ALT"
            }
            Keycap {
                width: __keyWidth * 6.65
                __keyText: ""
                Rectangle {
                    anchors.centerIn: parent
                    radius: 50
                    color: "#CCCCB5"
                    width: parent.width * 0.65
                    height: parent.height * 0.04
                    anchors.verticalCenterOffset: -parent.height / 8
                }
            }
            Keycap {
                width: __keyWidth * 1.625
                __keyText: "ALT"
            }
            Keycap {
                width: __keyWidth * 3.125
                __keyText: "CTRL"
            }
        }
    }
}

/*
            Rectangle {
                anchors.fill: parent
                color: "red"
                Text {
                    text: parent.width + " x " + parent.height
                    font.family: _Baloo2.name
                    font.pixelSize: parent.height * 0.5
                    color: "#CCCCB5"
                    anchors.centerIn: parent
                    //   anchors.verticalCenterOffset: -(parent.height / 8)
                }
            }
*/


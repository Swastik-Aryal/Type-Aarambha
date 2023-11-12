import QtQuick
import QtQuick.Layouts

// Main Item containing the keyboard layout
Item {
    id: _keyboardLayoutItem

    // Set the width and height of the keyboard layout
    implicitWidth: parent.width * 0.50
    implicitHeight: parent.height * 0.25

    // Center the keyboard layout within its parent
    anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
        verticalCenterOffset: parent.height / 3.5
    }

    // Column layout for arranging rows of keys
    ColumnLayout {
        // Fill the parent item
        anchors.fill: parent
        Layout.alignment: Qt.AlignVCenter
        spacing: 4

        RowLayout {
            id: _numberRow
            Layout.alignment: Qt.AlignHCenter
            spacing: 4
            Keycap {
                id: _backtickKey
                __keyText: "`"
            }
            Keycap {
                id: _oneKey
                __keyText: "1"
            }
            Keycap {
                id: _twoKey
                __keyText: "2"
            }
            Keycap {
                id: _threeKey
                __keyText: "3"
            }
            Keycap {
                id: _fourKey
                __keyText: "4"
            }
            Keycap {
                id: _fiveKey
                __keyText: "5"
            }
            Keycap {
                id: _sixKey
                __keyText: "6"
            }
            Keycap {
                id: _sevenKey
                __keyText: "7"
            }
            Keycap {
                id: _eightKey
                __keyText: "8"
            }
            Keycap {
                id: _nineKey
                __keyText: "9"
            }
            Keycap {
                id: _zeroKey
                __keyText: "0"
            }
            Keycap {
                id: _minusKey
                __keyText: "-"
            }
            Keycap {
                id: _equalsKey
                __keyText: "="
            }
            Keycap {
                id: _backspaceKey
                width: __keyWidth * 2.25
                __keyText: "<---"
            }
        }

        RowLayout {
            id: _topRow
            Layout.alignment: Qt.AlignHCenter
            spacing: 4
            Keycap {
                id: _tabKey
                width: __keyWidth * 1.625
                __keyText: "TAB"
            }
            Keycap {
                id: _qKey
                __keyText: "Q"
            }
            Keycap {
                id: _wKey
                __keyText: "W"
            }
            Keycap {
                id: _eKey
                __keyText: "E"
            }
            Keycap {
                id: _rKey
                __keyText: "R"
            }
            Keycap {
                id: _tKey
                __keyText: "T"
            }
            Keycap {
                id: _yKey
                __keyText: "Y"
            }
            Keycap {
                id: _uKey
                __keyText: "U"
            }
            Keycap {
                id: _iKey
                __keyText: "I"
            }
            Keycap {
                id: _oKey
                __keyText: "O"
            }
            Keycap {
                id: _pKey
                __keyText: "P"
            }
            Keycap {
                id: _openSquareBracketKey
                __keyText: "["
            }
            Keycap {
                id: _closeSquareBracketKey
                __keyText: "]"
            }
            Keycap {
                id: _backslashKey
                width: __keyWidth * 1.625
                __keyText: "\\"
            }
        }

        RowLayout {
            id: _homeRow
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            spacing: 4
            Keycap {
                id: _capsKey
                width: __keyWidth * 2
                __keyText: "CAPS"
            }
            Keycap {
                id: _aKey
                __keyText: "A"
            }
            Keycap {
                id: _sKey
                __keyText: "S"
            }
            Keycap {
                id: _dKey
                __keyText: "D"
            }
            Keycap {
                id: _fKey
                __keyText: "F"
            }
            Keycap {
                id: _gKey
                __keyText: "G"
            }
            Keycap {
                id: _hKey
                __keyText: "H"
            }
            Keycap {
                id: _jKey
                __keyText: "J"
            }
            Keycap {
                id: _kKey
                __keyText: "K"
            }
            Keycap {
                id: _lKey
                __keyText: "L"
            }
            Keycap {
                id: _semicolonKey
                __keyText: ";"
            }
            Keycap {
                id: _apostropheKey
                __keyText: "'"
            }
            Keycap {
                id: _enterKey
                width: __keyWidth * 2.35
                __keyText: "ENTER"
            }
        }

        RowLayout {
            id: _bottomRow
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 4
            Keycap {
                id: _leftShiftKey
                width: __keyWidth * 2.725
                __keyText: "SHIFT"
            }
            Keycap {
                id: _zKey
                __keyText: "Z"
            }
            Keycap {
                id: _xKey
                __keyText: "X"
            }
            Keycap {
                id: _cKey
                __keyText: "C"
            }
            Keycap {
                id: _vKey
                __keyText: "V"
            }
            Keycap {
                id: _bKey
                __keyText: "B"
            }
            Keycap {
                id: _nKey
                __keyText: "N"
            }
            Keycap {
                id: _mKey
                __keyText: "M"
            }
            Keycap {
                id: _commaKey
                __keyText: ","
            }
            Keycap {
                id: _dotKey
                __keyText: "."
            }
            Keycap {
                id: _slashKey
                __keyText: "/"
            }
            Keycap {
                id: _rightShiftKey
                width: __keyWidth * 2.725
                __keyText: "SHIFT"
            }
        }

        RowLayout {
            id: _spacebarRow
            Layout.alignment: Qt.AlignHCenter
            spacing: 4
            Layout.fillHeight: true
            Keycap {
                id: _leftCtrlKey
                width: __keyWidth * 3.125
                __keyText: "CTRL"
            }
            Keycap {
                id: _leftAltKey
                width: __keyWidth * 1.625
                __keyText: "ALT"
            }
            Keycap {
                id: _spacebarKey
                width: __keyWidth * 6.65
                __keyText: ""
                Rectangle {
                    // for the dash in the spacebar
                    anchors.centerIn: parent
                    radius: 50
                    color: _spacebarKey.__keyTextColor
                    width: parent.width * 0.65
                    height: parent.height * 0.04
                    anchors.verticalCenterOffset: -parent.height / 8
                }
            }
            Keycap {
                id: _rightAltKey
                width: __keyWidth * 1.625
                __keyText: "ALT"
            }
            Keycap {
                id: _rightCtrlKey
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


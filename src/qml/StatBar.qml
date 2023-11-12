import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: _statRect
    // Set the width and height
    implicitWidth: parent.width * 0.50
    implicitHeight: parent.height * 0.065

    // Center within its parent
    anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
        verticalCenterOffset: -parent.height / 5
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
                //language selection Div
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 1
                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    Item {
                        //globe div
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 0.8

                        Image {
                            // globe
                            source: "qrc:/assets/assets/img/globe-americas.svg"
                            fillMode: Image.PreserveAspectFit
                            scale: 0.4
                            anchors.centerIn: parent
                            anchors.horizontalCenterOffset: parent.width / 4
                        }
                    }
                    Item {
                        //language div
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1.6

                        Text {
                            id: _langSelect
                            text: "english"
                            font.family: _NotoSansRegular.name
                            font.pixelSize: parent.height * 0.48
                            color: "#4B5975"
                            anchors.centerIn: parent
                        }
                    }
                }

                MouseArea {
                    id: _langMouseArea
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked: {
                        _langSelect.text = _langSelect.text === "english" ? "nepali" : "english"
                    }
                }

                ToolTip {
                    //text when hovered
                    delay: 200
                    padding: 10
                    y: -40
                    visible: _langMouseArea.containsMouse
                    background: Rectangle {
                        color: "#101111"
                    }

                    Text {
                        text: "switch langauge"
                        font.family: _NotoSansRegular.name
                        font.pixelSize: 16
                        color: "#FFFFFF"
                        anchors.centerIn: parent
                    }

                    enter: Transition {
                        NumberAnimation {
                            property: "opacity"
                            from: 0.0
                            to: 1.0
                        }
                    }
                    exit: Transition {
                        NumberAnimation {
                            property: "opacity"
                            from: 1.0
                            to: 0.0
                        }
                    }
                }
            }

            Rectangle {
                //divider
                color: "#1B2028"
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 0.04
                radius: 50
            }

            Item {
                //wpm Div
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 0.9
                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    Item {
                        //"WPM:" div
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 0.918

                        Text {
                            text: "WPM :"
                            font.family: _NotoSansMedium.name
                            font.pixelSize: parent.height * 0.48
                            color: "#23A9D5"
                            font.weight: 1000
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    Item {
                        //WPM stats div
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 0.8

                        Text {
                            text: "88.8"
                            font.family: _NotoSansRegular.name
                            font.pixelSize: parent.height * 0.48
                            color: "#4B5975"
                            anchors.centerIn: parent
                        }
                    }
                }
                MouseArea {
                    id: _wpmMouseArea
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                }

                ToolTip {
                    //text when hovered
                    delay: 200
                    padding: 10
                    y: -40
                    visible: _wpmMouseArea.containsMouse
                    background: Rectangle {
                        color: "#101111"
                    }

                    Text {
                        text: "88.8 words per minute"
                        font.family: _NotoSansRegular.name
                        font.pixelSize: 16
                        color: "#FFFFFF"
                        anchors.centerIn: parent
                    }

                    enter: Transition {
                        NumberAnimation {
                            property: "opacity"
                            from: 0.0
                            to: 1.0
                        }
                    }
                    exit: Transition {
                        NumberAnimation {
                            property: "opacity"
                            from: 1.0
                            to: 0.0
                        }
                    }
                }
            }

            Rectangle {
                //divider
                color: "#1B2028"
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 0.04
                radius: 50
            }

            Item {
                //accuracy Div
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 4 / 3
                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    Item {
                        //"accuracy:" div
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1

                        Text {
                            text: "accuracy :"
                            font.family: _NotoSansMedium.name
                            font.pixelSize: parent.height * 0.48
                            color: "#23A9D5"
                            font.weight: 1000
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    Item {
                        //accuracy stats div
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 0.8

                        Text {
                            text: "88.8%"
                            font.family: _NotoSansRegular.name
                            font.pixelSize: parent.height * 0.48
                            color: "#4B5975"
                            anchors.centerIn: parent
                        }
                    }
                }

                MouseArea {
                    id: _accMouseArea
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                }

                ToolTip {
                    //text when hovered
                    delay: 200
                    padding: 10
                    y: -40
                    visible: _accMouseArea.containsMouse
                    background: Rectangle {
                        color: "#101111"
                    }

                    Text {
                        text: "88.8% accuracy"
                        font.family: _NotoSansRegular.name
                        font.pixelSize: 16
                        color: "#FFFFFF"
                        anchors.centerIn: parent
                    }

                    enter: Transition {
                        NumberAnimation {
                            property: "opacity"
                            from: 0.0
                            to: 1.0
                        }
                    }
                    exit: Transition {
                        NumberAnimation {
                            property: "opacity"
                            from: 1.0
                            to: 0.0
                        }
                    }
                }
            }

            Rectangle {
                //divider
                color: "#1B2028"
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 0.04
                radius: 50
            }

            Item {
                //characters Div
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 1.9

                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    Item {
                        //"characters:" div
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1

                        Text {
                            text: "characters :"
                            font.family: _NotoSansMedium.name
                            font.pixelSize: parent.height * 0.48
                            color: "#23A9D5"
                            font.weight: 1000
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    Item {
                        //character stats div
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1.2

                        Text {
                            text: "188 / 8 / 8 / 8"
                            font.family: _NotoSansRegular.name
                            font.pixelSize: parent.height * 0.48
                            color: "#4B5975"
                            anchors.centerIn: parent
                        }
                    }
                }

                MouseArea {
                    id: _charMouseArea
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                }

                ToolTip {
                    //text when hovered
                    delay: 200
                    padding: 10
                    y: -40
                    visible: _charMouseArea.containsMouse
                    background: Rectangle {
                        color: "#101111"
                    }

                    Text {
                        text: "correct / incorrect / extra / missed"
                        font.family: _NotoSansRegular.name
                        font.pixelSize: 16
                        color: "#FFFFFF"
                        anchors.centerIn: parent
                    }

                    enter: Transition {
                        NumberAnimation {
                            property: "opacity"
                            from: 0.0
                            to: 1.0
                        }
                    }
                    exit: Transition {
                        NumberAnimation {
                            property: "opacity"
                            from: 1.0
                            to: 0.0
                        }
                    }
                }
            }

            Rectangle {
                //divider
                color: "#1B2028"
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 0.04
                radius: 50
            }

            Item {
                //toggle Div
                id: _toggleDiv
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 1
                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    Item {
                        //keyboard icon div
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1

                        Image {
                            // globe
                            id: _keyboardSvg
                            source: _keyboardLayout.visible ? "qrc:/assets/assets/img/keyboard-solid-on.svg" : "qrc:/assets/assets/img/keyboard-solid-off.svg"
                            fillMode: Image.PreserveAspectFit
                            scale: 0.45
                            anchors {
                                verticalCenter: parent.verticalCenter
                                horizontalCenter: parent.horizontalCenter
                            }
                        }
                    }
                    Item {
                        //"toggle" div
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1.3

                        Text {
                            text: "toggle"
                            font.family: _NotoSansRegular.name
                            font.pixelSize: parent.height * 0.48
                            color: "#4B5975"
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
                MouseArea {
                    id: _toggMouseArea
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked: {
                        _keyboardLayout.visible = !_keyboardLayout.visible
                    }
                }

                ToolTip {
                    //text when hovered
                    delay: 200
                    padding: 10
                    y: -40
                    visible: _toggMouseArea.containsMouse
                    background: Rectangle {
                        color: "#101111"
                    }

                    Text {
                        text: "toggle keyboard visibility"
                        font.family: _NotoSansRegular.name
                        font.pixelSize: 16
                        color: "#FFFFFF"
                        anchors.centerIn: parent
                    }

                    enter: Transition {
                        NumberAnimation {
                            property: "opacity"
                            from: 0.0
                            to: 1.0
                        }
                    }
                    exit: Transition {
                        NumberAnimation {
                            property: "opacity"
                            from: 1.0
                            to: 0.0
                        }
                    }
                }
            }
        }
    }
}

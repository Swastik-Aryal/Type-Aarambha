import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: _statRect
    // Set the width and height
    implicitWidth: parent.width * 0.47
    implicitHeight: parent.height * 0.065

    // Center within its parent
    anchors {
        centerIn: parent
        verticalCenterOffset: -parent.height / 4.5
    }
    color: "#151A21"
    radius: 15

    //custom divider component
    component Divider: Rectangle {
        color: "#1B2028"
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredWidth: 0.04
        radius: 50
    }

    //custom tooltip component
    component Tooltip: ToolTip {
        property string __ttText: ""
        //text when hovered
        delay: 200
        padding: 10
        y: -40
        background: Rectangle {
            color: "#101111"
        }

        Text {
            text: __ttText
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
                            text: _keyboardLayout.__currentLanguage
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
                        lessonObj.setCurrentLanguage(
                                    _keyboardLayout.__currentLanguage)
                        if (_keyboardLayout.__currentLanguage === "english") {
                            languageSwitcher.switchToNepali()
                            _keyboardLayout.__currentLanguage = "nepali"
                            __lessonFont = _NotoSansDevanagari.name
                        } else {
                            languageSwitcher.switchToEnglish()
                            _keyboardLayout.__currentLanguage = "english"
                            __lessonFont = _NotoSansMono.name
                        }
                    }
                }

                Tooltip {
                    visible: _langMouseArea.containsMouse
                    __ttText: "switch langauge"
                }
            }

            Divider {}

            Item {
                //wpm Div
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 1
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

                Tooltip {
                    visible: _wpmMouseArea.containsMouse
                    __ttText: "88.8 words per minute"
                }
            }

            Divider {}

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

                Tooltip {
                    visible: _accMouseArea.containsMouse
                    __ttText: "88.8% accuracy"
                }
            }

            Divider {}

            Item {
                //characters Div
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 1.5

                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    Item {
                        //"characters:" div
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1.35

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
                        Layout.preferredWidth: 1

                        Text {
                            text: "188 / 88"
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

                Tooltip {
                    visible: _charMouseArea.containsMouse
                    __ttText: "188 correct / 88 incorrect"
                }
            }

            Divider {}

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

                Tooltip {
                    visible: _toggMouseArea.containsMouse
                    __ttText: "toggle keyboard visibility"
                }
            }
        }
    }
}

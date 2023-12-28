import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: _lesson
    property int __lessonDuration: 0
    property alias __inputText: _textInput.text
    state: "lessonOff"
    property bool keystrokeIsPrintable: false
    property bool backspacePressed: false
    property bool spacePressed: false

    implicitWidth: parent.width * 0.60
    implicitHeight: parent.height * 0.24

    anchors {
        centerIn: parent
        verticalCenterOffset: -parent.height / 50
    }

    states: [
        State {
            name: "LessonOff"
            PropertyChanges {
                target: _ctsRect
                opacity: 0.9
            }
            PropertyChanges {
                target: _textInput
                focus: false
            }
            PropertyChanges {
                target: _ctsMouseArea
                enabled: true
            }
        },
        State {
            name: "LessonReady"
            PropertyChanges {
                target: _ctsRect
                opacity: 0
            }
            PropertyChanges {
                target: _textInput
                focus: true
            }
            PropertyChanges {
                target: _ctsMouseArea
                enabled: false
            }
        },
        State {
            name: "LessonActive"
            PropertyChanges {
                target: _ctsRect
                opacity: 0
            }
            PropertyChanges {
                target: _textInput
                focus: true
            }
            PropertyChanges {
                target: _ctsMouseArea
                enabled: false
            }
        }
    ]
    transitions: Transition {
        NumberAnimation {
            target: _ctsRect
            property: "opacity"
            duration: 100
        }
    }

    function js_finishLesson() {
        _textInput.clear()
        __lessonDuration = 0
        lessonObj.reset()
        if (_lesson.state === "LessonOff") {
            _keyboardLayout.clearKeyboardHint()
        } else {
            _lesson.state = "LessonReady"
            _keyboardLayout.js_updateKeyboardHint()
        }
    }

    //timer for logging lesson time
    Timer {
        id: _lessonTimer
        interval: 16
        repeat: true
        running: _lesson.state === "LessonActive"
        onTriggered: {
            __lessonDuration += 16
            console.log(__lessonDuration)
            if (lessonObj.lessonEnded) {
                _lessonTimer.stop()
                _statBar.__wpm = lessonObj.calculateWPM(
                            __lessonDuration).toFixed(1)
                _statBar.__accuracy = lessonObj.calculateAccuracy().toFixed(1)
                _statBar.__correctChars = lessonObj.getCorrectChars()
                _statBar.__incorrectChars = (lessonObj.getTotalTypedChars(
                                                 ) - lessonObj.getCorrectChars(
                                                 ))
                _lesson.js_finishLesson()
            }
        }
    }

    //lesson prompt
    Text {
        id: _textPrompt

        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width

        text: lessonObj.textPrompt
        color: "#4B5975"
        font.family: __lessonFont
        font.pixelSize: __lessonFontSize
        font.weight: 550
        font.letterSpacing: __lessonFontSpacing
        wrapMode: Text.WordWrap
    }

    //user input box
    Rectangle {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.25
        height: parent.height * 0.30
        color: "#1B2028"
        border.color: "#23A9D5"
        border.width: 2
        radius: height * 0.15
        TextInput {

            id: _textInput
            anchors.centerIn: parent
            font.family: __lessonFont
            font.pixelSize: __lessonFontSize
            font.weight: 550
            font.letterSpacing: __lessonFontSpacing
            color: "#CCCCB5"

            Keys.onPressed: event => {
                                keystrokeIsPrintable = event.text.length > 0
                                backspacePressed = event.key === Qt.Key_Backspace
                                spacePressed = event.key === Qt.Key_Space

                                if (event.key === Qt.Key_Escape) {
                                    _textInput.clear()
                                    __lessonDuration = 0
                                    _lesson.state = "LessonReady"
                                    lessonObj.restart()
                                    _keyboardLayout.js_updateKeyboardHint()
                                }

                                if (event.key === Qt.Key_Shift) {
                                    _keyboardLayout.__shiftState = "shift"
                                }
                                if (event.modifiers & Qt.ControlModifier
                                    && event.modifiers & Qt.AltModifier) {
                                    _keyboardLayout.__shiftState = "CtrlAltR"
                                }

                                if (event.modifiers & Qt.ControlModifier
                                    && event.modifiers & Qt.AltModifier
                                    && event.modifiers & Qt.ShiftModifier) {
                                    _keyboardLayout.__shiftState = "shiftCtrlAlt"
                                }
                            }
            Keys.onReleased: event => {
                                 if (event.key === Qt.Key_Shift) {
                                     _keyboardLayout.__shiftState = "base"
                                 }
                                 if (event.modifiers & Qt.ControlModifier
                                     || event.modifiers & Qt.AltModifier) {
                                     _keyboardLayout.__shiftState = "base"
                                 }

                                 if (event.modifiers & Qt.ControlModifier
                                     || event.modifiers & Qt.AltModifier
                                     || event.modifiers & Qt.ShiftModifier) {
                                     _keyboardLayout.__shiftState = "base"
                                 }
                             }

            // called after Keys.onPressed callback
            onTextEdited: {
                if (_lesson.state === "LessonReady" && keystrokeIsPrintable) {
                    // start the test automatically
                    // when the user starts typing
                    if (!spacePressed)
                        _lesson.state = "LessonActive"
                }

                if (_lesson.state === "LessonActive") {
                    if (keystrokeIsPrintable || spacePressed
                            || backspacePressed) {
                        // track progress and update test prompt
                        lessonObj.processKbInput(_textInput.text,
                                                 backspacePressed,
                                                 spacePressed, "lesson")
                        _keyboardLayout.js_updateKeyboardHint()
                    }
                }
                // clear input field if the user finished typing the current word
                if (spacePressed) {
                    _textInput.text = ""
                }
            }
        }
    }

    //for click to start
    Rectangle {
        id: _ctsRect
        width: parent.width + 10
        height: parent.height + 10
        opacity: 0.9
        color: "#1B2028"
        Text {
            id: _ctsText
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -parent.height / 4.5
            text: "Click to start lesson"
            color: "#CCCCB5"
            font.family: _NotoSansMono.name
            font.pixelSize: 20
        }
        Image {
            source: "qrc:/assets/assets/img/mouseCursor.svg"
            fillMode: Image.PreserveAspectFit
            height: 19.5
            anchors.right: _ctsText.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -parent.height / 4.5
            anchors.rightMargin: 8
        }
        MouseArea {
            id: _ctsMouseArea
            anchors.fill: parent
            onClicked: {
                _lesson.state = "LessonReady"
                _keyboardLayout.js_updateKeyboardHint()
            }
        }
    }

    //for restart lesson info
    Item {
        implicitWidth: parent.width * 0.17
        implicitHeight: parent.height * 0.08
        anchors {
            centerIn: parent
            verticalCenterOffset: parent.height / 0.5
        }

        Rectangle {
            id: __escButton
            color: "#4B5975"
            width: parent.width * 0.18
            height: parent.height
            radius: 2
            Text {
                text: "esc"
                font.family: _NotoSansMono.name
                font.pixelSize: parent.height * 0.70
                color: "#1B2028"
                anchors.centerIn: parent
            }
        }

        Text {
            text: " - restart lesson"
            font.family: _NotoSansMono.name
            font.pixelSize: parent.height * 0.80
            color: "#CCCCB5"
            anchors.left: __escButton.right
        }
    }
}

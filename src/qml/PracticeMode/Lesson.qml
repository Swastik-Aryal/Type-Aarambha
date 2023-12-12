import QtQuick

Item {
    id: _lesson
    state: "LessonReady"
    property int __lessonDuration: 0
    property alias __inputText: _textInput.text

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
            name: "LessonReady"
        },
        State {
            name: "LessonActive"
        }
    ]

    function js_finishLesson() {
        _textInput.clear()
        __lessonDuration = 0
        _lesson.state = "LessonReady"
        _textInput.focus = true
        lessonObj.reset()
        _keyboardLayout.js_updateKeyboardHint()
    }

    Timer {
        id: _lessonTimer
        interval: 16
        repeat: true
        running: _lesson.state === "LessonActive"
        onTriggered: {
            __lessonDuration += 16
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
            focus: true
            activeFocusOnTab: true
            Keys.onPressed: event => {
                                keystrokeIsPrintable = event.text.length > 0
                                backspacePressed = event.key === Qt.Key_Backspace
                                spacePressed = event.key === Qt.Key_Space
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
                        //console.log("input length: " + _textInput.length)
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
    Component.onCompleted: _keyboardLayout.js_updateKeyboardHint()
}

import QtQuick

Item {
    id: _lesson
    state: "LessonReady"
    property int __lessonDuration

    implicitWidth: parent.width * 0.60
    implicitHeight: parent.height * 0.22

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
        },
        State {
            name: "LessonFinished"
        }
    ]

    function finishLesson() {
        lesson.state = "LessonFinished"
        _textInput.clear()
    }

    function restartLesson() {
        lesson.testDuration = lesson.nextTestDuration
        remainingTime = lesson.testDuration
        lesson.state = "LessonReady"
        _textInput.text = ""
        _textInput.focus = true
        lessonObj.reset()
    }

    function finishTest() {
        lesson.state = "LessonFinished"
        _textInput.clear()
    }

    function restartTest() {
        lesson.testDuration = lesson.nextTestDuration
        remainingTime = lesson.testDuration
        lesson.state = "LessonReady"
        _textInput.text = ""
        _textInput.focus = true
        lessonObj.reset()
    }
    Text {
        id: _textPrompt

        anchors.fill: parent
        width: parent.width

        text: lessonObj.textPrompt
        color: "#4B5975"
        font.family: __lessonFont
        font.pixelSize: 22
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
            font.pixelSize: 22
            color: "#CCCCB5"
            focus: true
            activeFocusOnTab: true

            visible: parent.state !== "LessonFinished"

            property bool keystrokeIsPrintable: false
            property bool backspacePressed: false
            property bool spacePressed: false
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
                    _lesson.state = "LessonActive"
                }

                if (_lesson.state === "LessonActive") {
                    if (keystrokeIsPrintable || spacePressed
                            || backspacePressed) {
                        // track progress and update test prompt
                        lessonObj.processKbInput(_textInput.text,
                                                 backspacePressed, spacePressed)

                        // clear input field if the user finished typing the current word
                        if (spacePressed) {
                            _textInput.text = ""
                        }
                    }
                }
            }
        }
    }
}

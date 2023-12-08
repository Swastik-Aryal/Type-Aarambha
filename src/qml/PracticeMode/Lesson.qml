import QtQuick

Rectangle {
    id: _testRect
    implicitWidth: parent.width * 0.50
    implicitHeight: parent.height * 0.11

    anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
        // verticalCenterOffset: parent.height / 3.5
    }

    state: "testReady"

    states: [
        State {
            name: "testReady"
            PropertyChanges {
                target: hintRect
                opacity: 1.0
            }
            PropertyChanges {
                target: currentTestResults
                opacity: 0.0
            }
            PropertyChanges {
                target: remainingTimeStr
                opacity: 1.0
            }
        },
        State {
            name: "testActive"
            PropertyChanges {
                target: hintRect
                opacity: 0.0
            }
        },
        State {
            name: "testFinished"
            PropertyChanges {
                target: restartButton
                focus: true
            }
            PropertyChanges {
                target: hintRect
                opacity: 0.0
            }
            PropertyChanges {
                target: currentTestResults
                opacity: 1.0
            }
            PropertyChanges {
                target: remainingTimeStr
                opacity: 0.0
            }
        }
    ]

    TextInput {
        id: testInput
        anchors.fill: parent
        font.pixelSize: 30
        color: "#fae1c3"
        focus: true
        activeFocusOnTab: true
        visible: parent.state !== "testFinished"

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
            if (Lesson.state === "testReady" && keystrokeIsPrintable) {
                // start the test automatically
                // when the user starts typing
                Lesson.state = "testActive"
            }

            if (Lesson.state === "testActive") {
                if (keystrokeIsPrintable || spacePressed || backspacePressed) {
                    // track progress and update test prompt
                    typingTest.processKbInput(testInput.text, backspacePressed,
                                              spacePressed)

                    // clear input field if the user finished typing the current word
                    if (spacePressed) {
                        testInput.text = ""
                    }
                }
            }
        }
    }
}

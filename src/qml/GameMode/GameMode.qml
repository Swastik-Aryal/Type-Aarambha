import QtQuick

FocusScope {
    id: _win
    width: 1000
    height: 600
    anchors.top: _headerBar.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: -60

    property int __score: 0
    property string __trialtext: "HiCutie"
    property int __currentLog: 1
    property string _lesson: "LessonReady"
    property int __lessonDuration
    property bool live1_visible: true
    property bool live2_visible: true
    property bool live3_visible: true
    property int liveslost: 0

    Image {

        id: bg
        source: "qrc:/assets/assets/img/images-gamemode/cloudyforest.jpg"
        width: _win.width
        height: _win.height
        opacity: 0.75
        z: -1
    }

    //scorecard and lives
    Item {

        anchors {
            left: parent.left
            top: parent.top
        }

        //scorecard
        Rectangle {
            id: _score

            width: 190
            height: 40
            radius: 10
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "#1E3F66"
                }
                GradientStop {
                    position: 0.33
                    color: "#2E5984"
                }
                GradientStop {
                    position: 1.0
                    color: "#528AAE"
                }
            }

            anchors {
                leftMargin: -10
                topMargin: 12
                left: parent.left
                top: parent.top
            }
            Text {
                id: _scoreTxt
                text: "Score"
                color: "white"
                font.italic: true
                font.pixelSize: 25

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
                Text {
                    text: __score
                    color: "white"
                    font.italic: true
                    font.pixelSize: 25

                    anchors {
                        left: parent.right
                        leftMargin: 5
                    }
                }
            }
        }

        //lives
        Rectangle {

            id: _lives
            anchors {
                leftMargin: 40
                topMargin: 12
                left: parent.left
                top: _score.bottom
            }
            Image {
                id: _live3
                source: "qrc:/assets/assets/img/images-gamemode/live.png"
                width: 25
                height: 25
                visible: live3_visible
            }
            Image {
                id: _live2
                source: "qrc:/assets/assets/img/images-gamemode/live.png"
                width: 25
                height: 25
                anchors {
                    leftMargin: 5
                    left: _live3.right
                }
                visible: live2_visible
            }
            Image {
                id: _live1
                source: "qrc:/assets/assets/img/images-gamemode/live.png"
                width: 25
                height: 25
                anchors {
                    leftMargin: 5
                    left: _live2.right
                }
                visible: live3_visible
            }
        }
    }

    //main game section (jump section)
    Rectangle {

        id: _mainRect
        color: "transparent"

        height: _win.height
        width: 450

        anchors.centerIn: parent
        state: "1_down"

        // logs ( check obstacle.qml to edit)
        Obstacle {
            id: _log3
            width: 250
            height: 60
            anchors {
                right: parent.right
            }
            y: 150 - height / 1.5
        }

        Obstacle {
            id: _log2
            width: 250
            height: 60
            anchors {
                left: parent.left
            }

            y: 300
        }
        Obstacle {
            id: _log1
            width: 250
            height: 60
            anchors {
                right: parent.right
            }

            y: 450 + height / 1.5
        }

        states: [
            State {
                name: "1_down"

                PropertyChanges {
                    target: _log1
                    y: 450 + height / 1.5
                }
                PropertyChanges {
                    target: _log2
                    y: 300
                }
                PropertyChanges {
                    target: _log3
                    y: 150 - height / 1.5
                }
            },
            State {
                name: "2_down"

                PropertyChanges {
                    target: _log1
                    y: 150 - height / 1.5
                }
                PropertyChanges {
                    target: _log2
                    y: 450 + height / 1.5
                }
                PropertyChanges {
                    target: _log3
                    y: 300
                }
            },
            State {
                name: "3_down"

                PropertyChanges {
                    target: _log1
                    y: 300
                }
                PropertyChanges {
                    target: _log2
                    y: 150 - height / 1.5
                }
                PropertyChanges {
                    target: _log3
                    y: 450 + height / 1.5
                }
            }
        ]

        transitions: [
            Transition {
                from: "1_down"
                to: "2_down"
                PropertyAnimation {
                    targets: _log3
                    property: "y"
                    from: 150 - _log1.height / 1.5
                    to: 300
                    duration: 2000
                }
                PropertyAnimation {
                    targets: _log2
                    property: "y"
                    from: 300
                    to: 450 + _log1.height / 1.5
                    duration: 2000
                }

                SequentialAnimation {

                    NumberAnimation {
                        targets: _log1
                        property: "y"
                        from: 450 + _log1.height / 1.5
                        to: _mainRect.height
                        duration: 1000
                    }
                    NumberAnimation {
                        targets: _log1
                        property: "y"
                        from: 0
                        to: 150 - _log1.height / 1.5
                        duration: 1000
                    }
                }
            },
            Transition {
                from: "2_down"
                to: "3_down"
                PropertyAnimation {
                    targets: _log1
                    property: "y"
                    from: 150 - _log1.height / 1.5
                    to: 300
                    duration: 2000
                }
                PropertyAnimation {
                    targets: _log3
                    property: "y"
                    from: 300
                    to: 450 + _log1.height / 1.5
                    duration: 2000
                }
                SequentialAnimation {

                    NumberAnimation {
                        targets: _log2
                        property: "y"
                        from: 450 + _log1.height / 1.5
                        to: _mainRect.height
                        duration: 1000
                    }
                    NumberAnimation {
                        targets: _log2
                        property: "y"
                        from: 0
                        to: 150 - _log1.height / 1.5
                        duration: 1000
                    }
                }
            },
            Transition {
                from: "3_down"
                to: "1_down"
                PropertyAnimation {
                    targets: _log2
                    property: "y"
                    from: 150 - _log1.height / 1.5
                    to: 300
                    duration: 2000
                }
                PropertyAnimation {
                    targets: _log1
                    property: "y"
                    from: 300
                    to: 450 + _log1.height / 1.5
                    duration: 2000
                }
                SequentialAnimation {

                    NumberAnimation {
                        targets: _log3
                        property: "y"
                        from: 450 + _log1.height / 1.5
                        to: _mainRect.height
                        duration: 1000
                    }
                    NumberAnimation {
                        targets: _log3
                        property: "y"
                        from: 0
                        to: 150 - _log1.height / 1.5
                        duration: 1000
                    }
                }
            }
        ]

        // player here
        AnimatedImage {

            id: _player
            source: "qrc:/assets/assets/img/images-gamemode/giphy1.gif"
            mirror: false
            width: 300
            height: 260
            //x:_log1.x-20 ; y:_log1.y-160
            anchors {
                bottom: _log1.top
                horizontalCenter: _log1.horizontalCenter
                bottomMargin: -100
            }

            ScaleAnimator {
                id: _scaler1
                target: _player
                from: 1
                to: 0
                duration: 1000
                running: false
            }
            ScaleAnimator {
                id: _scaler2
                target: _player
                from: 0
                to: 1
                duration: 1000
                running: false
            }
        }

        Text {
            id: _textPrompt

            anchors {
                horizontalCenter: _log2.horizontalCenter
                bottom: _log2.top
                bottomMargin: -15
            }

            text: gameObj.textPrompt
            color: "#4B5975"
            font.family: __lessonFont
            font.pixelSize: 35
            wrapMode: Text.WordWrap
        }

        TextInput {

            id: _textInput
            font.family: __lessonFont
            font.pixelSize: 22
            color: "transparent"
            cursorVisible: false
            focus: true
            activeFocusOnTab: true

            visible: false

            property bool keystrokeIsPrintable: false
            property bool backspacePressed: false
            property bool spacePressed: false
            property bool wordcomplete: false

            function restartTest() {

                _lesson = "LessonReady"
                _textInput.text = ""
                _textInput.focus = true
                gameObj.reset()
            }
            Keys.onPressed: event => {

                                if (event.key === Qt.Key_Backspace) {
                                    // Consume the Backspace key event, preventing it from reaching the TextInput
                                    event.accepted = true
                                }
                                keystrokeIsPrintable = event.text.length > 0

                                spacePressed = event.key === Qt.Key_Space
                            }
            // called after Keys.onPressed callback
            onTextEdited: {

                if (_lesson === "LessonReady" && keystrokeIsPrintable) {
                    // start the test automatically
                    // when the user starts typing
                    _lesson = "LessonActive"
                }

                if (_lesson === "LessonActive") {

                    if (keystrokeIsPrintable || spacePressed
                            || backspacePressed) {
                        if (liveslost !== 3) {

                            // track progress and update test prompt
                            if (gameObj.processgameKbInput(_textInput.text,
                                                           backspacePressed,
                                                           spacePressed,
                                                           "game")) {

                                _textInput.text = ""
                                if (__currentLog === 3) {

                                    _textPrompt.anchors.horizontalCenter = _log2.horizontalCenter
                                    _textPrompt.anchors.bottom = _log2.top

                                    _player.mirror = false
                                    __score = __score + 1

                                    _player.anchors.bottom = _log1.top
                                    _player.anchors.horizontalCenter = _log1.horizontalCenter
                                    _scaler1.stop()
                                    _scaler2.start()

                                    __currentLog = 1
                                    _mainRect.state = "1_down"
                                } else if (__currentLog === 1) {

                                    _textPrompt.anchors.horizontalCenter = _log3.horizontalCenter
                                    _textPrompt.anchors.bottom = _log3.top

                                    _player.mirror = true
                                    __score = __score + 1

                                    _scaler1.start()
                                    _mainRect.state = "2_down"
                                    _player.anchors.bottom = _log2.top
                                    _player.anchors.horizontalCenter = _log2.horizontalCenter
                                    _scaler1.stop()
                                    _scaler2.start()

                                    __currentLog = 2
                                } else if (__currentLog === 2) {
                                    _textPrompt.anchors.horizontalCenter = _log1.horizontalCenter
                                    _textPrompt.anchors.bottom = _log1.top

                                    _player.mirror = false
                                    __score = __score + 1

                                    _scaler1.start()

                                    _player.anchors.bottom = _log3.top
                                    _player.anchors.horizontalCenter = _log3.horizontalCenter
                                    _scaler1.stop()
                                    _scaler2.start()

                                    __currentLog = 3
                                    _mainRect.state = "3_down"
                                }
                            }
                        } else {
                            __score = 0
                            live1_visible = true
                            live2_visible = true
                            live3_visible = true
                            _textPrompt.anchors.horizontalCenter = _log2.horizontalCenter
                            _textPrompt.anchors.bottom = _log2.top

                            _player.anchors.bottom = _log1.top
                            _player.anchors.horizontalCenter = _log1.horizontalCenter
                            __currentLog = 1
                            _mainRect.state = "1_down"
                            liveslost = 0

                            restartTest()
                        }

                        // clear input field if the user finished typing the current word
                        //if (wordcomplete) {
                        //  _textInput.text = ""
                        //}
                    }
                }
            }


            /*

        //input field above the logs
        TextInput {







            id: testInput
            font.italic: true
            font.pixelSize: 25
            color: "black"
            focus: true
            anchors {

                bottom: _log2.top
                horizontalCenter: _log2.horizontalCenter
                left: _log2.left
                bottomMargin: -5
                leftMargin: 50
            }
            onTextEdited: {
                if (__currentLog === 3 && (testInput.text === __trialtext)) {
                    testInput.clear()
                    testInput.anchors.bottom = _log2.top
                    testInput.anchors.horizontalCenter = _log2.horizontalCenter
                    testInput.anchors.left = _log2.left

                    _player.mirror = false
                    __score = __score + 1
                    console.log("pressed")
                    _log1.__textVisibility = false
                    _log2.__textVisibility = true
                    _log3.__textVisibility = true
                    _scaler1.start()

                    _player.anchors.bottom = _log1.top
                    _player.anchors.horizontalCenter = _log1.horizontalCenter
                    _scaler1.stop()
                    _scaler2.start()

                    __currentLog = 1
                    _mainRect.state = "1_down"
                } else if (__currentLog === 1
                           && (testInput.text === __trialtext)) {

                    testInput.clear()
                    testInput.anchors.bottom = _log3.top
                    testInput.anchors.horizontalCenter = _log3.horizontalCenter
                    testInput.anchors.left = _log3.left

                    _player.mirror = true
                    __score = __score + 1
                    console.log("pressed")
                    _log1.__textVisibility = true
                    _log2.__textVisibility = false
                    _log3.__textVisibility = true

                    _scaler1.start()
                    _mainRect.state = "2_down"
                    _player.anchors.bottom = _log2.top
                    _player.anchors.horizontalCenter = _log2.horizontalCenter
                    _scaler1.stop()
                    _scaler2.start()

                    __currentLog = 2
                } else if (__currentLog === 2
                           && (testInput.text === __trialtext)) {

                    testInput.clear()
                    testInput.anchors.bottom = _log1.top
                    testInput.anchors.horizontalCenter = _log1.horizontalCenter
                    testInput.anchors.left = _log1.left

                    _player.mirror = false
                    __score = __score + 1
                    console.log("pressed")
                    _log1.__textVisibility = true
                    _log2.__textVisibility = true
                    _log3.__textVisibility = false
                    _scaler1.start()

                    _player.anchors.bottom = _log3.top
                    _player.anchors.horizontalCenter = _log3.horizontalCenter
                    _scaler1.stop()
                    _scaler2.start()

                    __currentLog = 3
                    _mainRect.state = "3_down"
                }
            }
        }
        */
        }
    }
}

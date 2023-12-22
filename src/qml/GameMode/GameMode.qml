import QtQuick

FocusScope {
    id: _win
    width: 1000
    height: 600
    anchors.top: _headerBar.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: -60

    property int __score: 0
    property int __currentLog: 1
    property string _lesson: "LessonReady"
    property bool live1_visible: true
    property bool live2_visible: true
    property bool live3_visible: true
    property int liveslosttotal: 0
    property int liveslost: 0
    property bool res_visibility: false
    property int __highscore: 0
    property bool wrongchar: false
    property bool newgame: false
    property string __gamefont: _NotoSansMono.name
    property string __engbtncolor: "#69BC0C"
    property string __nepbtncolor: "#AC724F"

    function resetgame() {
        live1_visible = true
        live2_visible = true
        live3_visible = true
        liveslost = 0
        liveslosttotal = 0

        _textPrompt.anchors.horizontalCenter = _log2.horizontalCenter
        _textPrompt.anchors.bottom = _log2.top

        _player.mirror = false

        _mainRect.state = "1_down"
        _player.anchors.bottom = _log1.top
        _player.anchors.horizontalCenter = _log1.horizontalCenter

        __currentLog = 1
        _lesson = "LessonReady"

        wrongchar = false
        gameObj.reset()
        _textInput.text = ""
        langcolorchange()
    }
    function restartgame() {
        res_visibility = false
        __score = 0
        resetgame()
        langcolorchange()
        newgame = true
    }
    function langcolorchange() {
        if (__currentLanguage == "english") {
            __engbtncolor = "#69BC0C"
            __nepbtncolor = "#AC724F"
        } else {
            __engbtncolor = "#AC724F"
            __nepbtncolor = "#69BC0C"
        }
    }

    Image {

        id: bg
        source: "qrc:/assets/assets/img/images-gamemode/cloudyforest.jpg"
        width: _win.width
        height: _win.height
        opacity: 0.75
        z: -1
    }

    //scorecard and lives
    Rectangle {

        width: _win.width
        height: 100
        color: "transparent"

        anchors {
            left: parent.left
            top: parent.top
        }
        Image {
            id: _left
            source: "qrc:/assets/assets/img/images-gamemode/left.png"
            scale: 0.55

            fillMode: Image.PreserveAspectFit
            anchors {
                left: parent.left
                top: parent.top
                topMargin: -112
                leftMargin: -230
            }
        }

        Image {
            id: _right
            source: "qrc:/assets/assets/img/images-gamemode/right.png"

            fillMode: Image.PreserveAspectFit
            scale: 0.55
            anchors {
                right: parent.right
                top: parent.top
                topMargin: -112
                rightMargin: -200
            }
        }

        //high scorecard
        Rectangle {
            id: _highscore

            width: 190
            height: 40
            color: "transparent"

            anchors {
                rightMargin: 0
                topMargin: -3
                horizontalCenter: _right.horizontalCenter
                top: parent.top
            }
            Text {
                id: _highscoreTxt
                text: "High Score:"
                color: "#260600"
                font.family: __gamefont
                font.weight: 10

                font.pixelSize: 20

                anchors {

                    left: parent.left
                    leftMargin: 25
                    verticalCenter: parent.verticalCenter
                }
                Text {
                    text: __highscore
                    color: "#69BC0C"
                    font.family: __gamefont

                    font.pixelSize: 20

                    anchors {
                        left: parent.right
                        leftMargin: 6
                    }
                }
            }
        }

        //scorecard
        Rectangle {
            id: _score

            width: 190
            height: 40
            color: "transparent"

            anchors {
                leftMargin: 0
                topMargin: -9
                horizontalCenter: _right.horizontalCenter
                top: _highscore.bottom
            }
            Text {
                id: _scoreTxt
                text: "Score:"
                color: "#260600"
                font.family: __gamefont
                font.bold: true

                font.pixelSize: 28

                anchors {

                    left: parent.left
                    leftMargin: 25
                    verticalCenter: parent.verticalCenter
                }
                Text {
                    text: __score
                    color: "#69BC0C"
                    font.family: __gamefont
                    font.bold: true

                    font.pixelSize: 28

                    anchors {
                        left: parent.right
                        leftMargin: 7
                    }
                }
            }
        }

        //lives
        Rectangle {

            id: _lives
            anchors {
                leftMargin: 40
                topMargin: 10
                left: parent.left
                top: parent.top
            }

            Text {
                id: _livetxt
                text: "Lives: "
                color: "#260600"
                font.family: __gamefont

                font.pixelSize: 30
                anchors {

                    left: parent.left
                    leftMargin: -25
                    top: _lives.top
                }
            }
            Image {
                id: _live3dead
                source: "qrc:/assets/assets/img/images-gamemode/dead.png"
                width: 35
                height: 32
                anchors {
                    verticalCenter: _live3.verticalCenter
                    horizontalCenter: _live3.horizontalCenter
                }
            }
            Image {
                id: _live2dead
                source: "qrc:/assets/assets/img/images-gamemode/dead.png"
                width: 35
                height: 32
                anchors {
                    verticalCenter: _live2.verticalCenter
                    horizontalCenter: _live2.horizontalCenter
                }
            }
            Image {
                id: _live1dead
                source: "qrc:/assets/assets/img/images-gamemode/dead.png"
                width: 35
                height: 32
                anchors {
                    verticalCenter: _live1.verticalCenter
                    horizontalCenter: _live1.horizontalCenter
                }
            }
            Image {
                id: _live3
                source: "qrc:/assets/assets/img/images-gamemode/live.png"
                width: 35
                height: 32
                visible: live3_visible
                anchors {

                    left: _livetxt.right

                    top: _lives.top
                    topMargin: 7
                }
            }
            Image {
                id: _live2
                source: "qrc:/assets/assets/img/images-gamemode/live.png"
                width: 35
                height: 32
                anchors {
                    leftMargin: 8
                    left: _live3.right
                    top: _lives.top
                    topMargin: 7
                }
                visible: live2_visible
            }
            Image {
                id: _live1
                source: "qrc:/assets/assets/img/images-gamemode/live.png"
                width: 35
                height: 32
                anchors {
                    leftMargin: 8
                    left: _live2.right
                    top: _lives.top
                    topMargin: 7
                }
                visible: live1_visible
            }
        }

        //for blureffect for error
        Rectangle {
            id: _wrong
            color: "red"
            opacity: 0.5
            visible: wrongchar
            z: 1
            width: _win.width
            height: _win.height
        }
        //for blureffect after death
        Rectangle {

            color: "red"
            opacity: 0.5
            visible: res_visibility
            z: 1
            width: _win.width
            height: _win.height
        }
    }
    //start screen
    Rectangle {
        id: _startscreen
        z: 2
        visible: newgame
        color: "transparent"
        focus: newgame

        width: 750
        height: 420
        anchors {

            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: _ply
            source: "qrc:/assets/assets/img/images-gamemode/plyboard.png"

            anchors {

                left: parent.left
                top: parent.top
                topMargin: 30
            }

            width: parent.width
            height: parent.height
        }

        //tutorial txt
        Rectangle {

            id: _tutorial
            width: parent.width / 2 - 30
            height: 100
            color: "transparent"

            anchors {
                top: _ply.top
                left: _ply.left
                topMargin: 25
                leftMargin: 50
            }

            Text {
                id: _tut1
                text: "How To Play: "
                color: "#55321B"
                font.pixelSize: 30
                font.bold: true
                font.family: __gamefont
                anchors {

                    top: parent.top
                    left: parent.left
                }
            }

            Text {
                id: _tut2
                width: parent.width
                text: "Navigate your character by jumping on logs while typing the given words accurately. Your goal is to reach the highest score possible before running out of lives. Each log bears a word, and you must type it correctly to make your character jump. Be quick and precise, as every mistake will cost you a life."
                color: "#260600"
                font.pixelSize: 15
                font.family: __gamefont
                anchors {
                    top: _tut1.bottom
                    left: _tut1.left
                    topMargin: 16
                }
                wrapMode: Text.WordWrap
            }
            Text {
                id: _tut3
                width: parent.width
                text: "Ready to test your typing skills and reflexes? Let the game begin!"
                color: "#260600"
                font.pixelSize: 15
                font.family: __gamefont
                anchors {
                    top: _tut2.bottom
                    left: _tut1.left
                    topMargin: 8
                }
                wrapMode: Text.WordWrap
            }
        }

        //language selection buttons
        Rectangle {
            id: _langselect
            width: parent.width / 2 - 40
            height: 100
            color: "transparent"

            anchors {
                top: _ply.top
                right: _ply.right
                topMargin: 25
                rightMargin: 0
            }
            Text {
                id: _lang1
                text: "Select Language: "
                color: "#55321B"
                font.pixelSize: 30
                font.bold: true
                font.family: __gamefont
                anchors {

                    top: parent.top
                    left: parent.left
                }
            }
            Rectangle {
                id: _langeng
                color: "#55321B"
                width: 125
                height: 36
                radius: 10
                anchors {
                    left: parent.left
                    top: _lang1.bottom
                    topMargin: 20
                    leftMargin: 0
                }
                Text {
                    text: "English"
                    color: __engbtncolor
                    font.family: __gamefont
                    font.pixelSize: 18
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }
                }
                MouseArea {
                    id: _languagemousearea
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked: {
                        lessonObj.setCurrentLanguage("nepali")
                        gameObj.setCurrentLanguage("nepali")
                        layoutSwitcher.activateLayout("english")
                        __currentLanguage = "english"
                        __lessonFont = _NotoSansMono.name
                        __lessonFontSize = 24
                        __lessonFontSpacing = 1

                        resetgame()
                    }
                }
            }
            Rectangle {
                id: _langnep
                color: "#55321B"
                width: 125
                height: 36
                radius: 10
                anchors {
                    left: _langeng.right
                    top: _lang1.bottom
                    topMargin: 20
                    leftMargin: 30
                }
                Text {
                    text: "Nepali"
                    color: __nepbtncolor
                    font.family: __gamefont
                    font.pixelSize: 18
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }
                }
                MouseArea {
                    id: _languagemousearea2
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked: {
                        lessonObj.setCurrentLanguage("english")
                        gameObj.setCurrentLanguage("english")
                        layoutSwitcher.activateLayout("nepali")
                        __currentLanguage = "nepali"
                        __lessonFont = _NotoSansDevanagari.name
                        __lessonFontSize = 30
                        __lessonFontSpacing = 3

                        resetgame()
                    }
                }
            }
        }
        AnimatedImage {

            source: "qrc:/assets/assets/img/images-gamemode/gamerobot.gif"
            mirror: false
            scale: 0.82

            anchors {
                bottom: parent.bottom
                right: parent.right
                bottomMargin: -60
                rightMargin: 38
            }
        }
        //startbutton
        Rectangle {
            id: _startbtn
            color: "#55321B"
            width: 200
            height: 60
            radius: 10
            anchors {
                left: parent.left
                bottom: parent.bottom

                leftMargin: 110
            }
            Text {
                text: "START"
                color: "#AC724F"
                font.family: __gamefont
                font.pixelSize: 35
                font.bold: true
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
            }
            MouseArea {

                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onClicked: {
                    newgame = false
                }
            }
        }
    }

    //gameover area
    Rectangle {
        id: gameoverscreen
        z: 2
        visible: res_visibility
        color: "transparent"

        width: 750
        height: 420
        anchors {

            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: _ply1
            source: "qrc:/assets/assets/img/images-gamemode/plyboard.png"

            anchors {

                left: parent.left
                top: parent.top
                topMargin: 30
            }

            width: parent.width
            height: parent.height
        }

        Rectangle {

            id: _tutorial1
            width: parent.width / 2 - 60
            height: 100
            color: "transparent"

            anchors {
                top: _ply1.top
                left: _ply1.left
                topMargin: 50
                leftMargin: 50
            }

            Text {
                id: _gameovertxt
                text: "GAME OVER!"
                color: "#69BC0C"
                font.pixelSize: 50
                font.bold: true
                font.family: __gamefont
                anchors {

                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Text {
                id: _score1

                text: "Score:"
                color: "#260600"
                font.pixelSize: 30
                font.family: __gamefont
                anchors {
                    top: _gameovertxt.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 30
                    leftMargin: -10
                }
            }
            Text {
                id: _score1txt

                text: __score
                color: "#69BC0C"
                font.pixelSize: 30
                font.family: __gamefont
                anchors {
                    left: _score1.right
                    top: _score1.top
                    leftMargin: 10
                }
            }
            Text {
                id: _highscore1

                text: "High Score:"
                color: "#260600"
                font.pixelSize: 30
                font.family: __gamefont
                anchors {
                    top: _score1.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 30
                    leftMargin: -10
                }
            }
            Text {
                id: _highscore1txt

                text: __highscore
                color: "#69BC0C"
                font.pixelSize: 30
                font.family: __gamefont
                anchors {
                    left: _highscore1.right
                    top: _highscore1.top
                    leftMargin: 10
                }
            }
        }

        //language selection buttons
        Rectangle {
            id: _langselect1
            width: parent.width / 2 - 40
            height: 100
            color: "transparent"

            anchors {
                top: _ply1.top
                right: _ply1.right
                topMargin: 30
                rightMargin: 0
            }
            Text {
                id: _lang11
                text: "Select Language: "
                color: "#55321B"
                font.pixelSize: 30
                font.bold: true
                font.family: __gamefont
                anchors {

                    top: parent.top
                    left: parent.left
                }
            }
            Rectangle {
                id: _langeng1
                color: "#55321B"
                width: 125
                height: 36
                radius: 10
                anchors {
                    left: parent.left
                    top: _lang11.bottom
                    topMargin: 20
                    leftMargin: 0
                }
                Text {
                    text: "English"
                    color: __engbtncolor
                    font.family: __gamefont
                    font.pixelSize: 18
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }
                }
                MouseArea {
                    id: _languagemousearea1
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked: {
                        lessonObj.setCurrentLanguage("nepali")
                        gameObj.setCurrentLanguage("nepali")
                        layoutSwitcher.activateLayout("english")
                        __currentLanguage = "english"
                        __lessonFont = _NotoSansMono.name
                        __lessonFontSize = 24
                        __lessonFontSpacing = 1

                        resetgame()
                    }
                }
            }
            Rectangle {
                id: _langnep1
                color: "#55321B"
                width: 125
                height: 36
                radius: 10
                anchors {
                    left: _langeng1.right
                    top: _lang11.bottom
                    topMargin: 20
                    leftMargin: 30
                }
                Text {
                    text: "Nepali"
                    color: __nepbtncolor
                    font.family: __gamefont
                    font.pixelSize: 18
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }
                }
                MouseArea {
                    id: _languagemousearea11
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked: {
                        lessonObj.setCurrentLanguage("english")
                        gameObj.setCurrentLanguage("english")
                        layoutSwitcher.activateLayout("nepali")
                        __currentLanguage = "nepali"
                        __lessonFont = _NotoSansDevanagari.name
                        __lessonFontSize = 30
                        __lessonFontSpacing = 3

                        resetgame()
                    }
                }
            }
        }

        AnimatedImage {

            source: "qrc:/assets/assets/img/images-gamemode/gamerobot.gif"
            mirror: false
            scale: 0.82

            anchors {
                bottom: parent.bottom
                right: parent.right
                bottomMargin: -60
                rightMargin: 38
            }
        }
        //restartbutton
        Rectangle {
            id: _restartbtn
            color: "#55321B"
            width: _tutorial1.width
            height: 60
            radius: 10
            anchors {
                horizontalCenter: _tutorial1.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 30
            }
            Text {
                text: "PLAY AGAIN"
                color: "#69BC0C"
                font.family: __gamefont
                font.pixelSize: 35
                font.bold: true
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
            }
            MouseArea {

                anchors.fill: _restartbtn
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onClicked: {
                    res_visibility = false
                    __score = 0

                    resetgame()
                }
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
                    duration: 1200
                }
                PropertyAnimation {
                    targets: _log2
                    property: "y"
                    from: 300
                    to: 450 + _log1.height / 1.5
                    duration: 1200
                }

                SequentialAnimation {

                    NumberAnimation {
                        targets: _log1
                        property: "y"
                        from: 450 + _log1.height / 1.5
                        to: _mainRect.height
                        duration: 600
                    }
                    NumberAnimation {
                        targets: _log1
                        property: "y"
                        from: 0
                        to: 150 - _log1.height / 1.5
                        duration: 600
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
                    duration: 1200
                }
                PropertyAnimation {
                    targets: _log3
                    property: "y"
                    from: 300
                    to: 450 + _log1.height / 1.5
                    duration: 1200
                }
                SequentialAnimation {

                    NumberAnimation {
                        targets: _log2
                        property: "y"
                        from: 450 + _log1.height / 1.5
                        to: _mainRect.height
                        duration: 600
                    }
                    NumberAnimation {
                        targets: _log2
                        property: "y"
                        from: 0
                        to: 150 - _log1.height / 1.5
                        duration: 600
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
                    duration: 1200
                }
                PropertyAnimation {
                    targets: _log1
                    property: "y"
                    from: 300
                    to: 450 + _log1.height / 1.5
                    duration: 1200
                }
                SequentialAnimation {

                    NumberAnimation {
                        targets: _log3
                        property: "y"
                        from: 450 + _log1.height / 1.5
                        to: _mainRect.height
                        duration: 600
                    }
                    NumberAnimation {
                        targets: _log3
                        property: "y"
                        from: 0
                        to: 150 - _log1.height / 1.5
                        duration: 600
                    }
                }
            }
        ]

        // player here
        AnimatedImage {

            id: _player
            source: "qrc:/assets/assets/img/images-gamemode/gamerobot.gif"
            mirror: false
            width: 310
            height: 364
            scale: 0.46
            //x:_log1.x-20 ; y:_log1.y-160
            anchors {
                bottom: _log1.top
                horizontalCenter: _log1.horizontalCenter
                bottomMargin: -135
            }

            ScaleAnimator {
                id: _scaler1
                target: _player
                from: 0.46
                to: 0
                duration: 600
                running: false
            }
            ScaleAnimator {
                id: _scaler2
                target: _player
                from: 0
                to: 0.46
                duration: 600
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
            focus: !newgame

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

            Timer {
                id: timeoutTimer
                interval: 250
                repeat: false

                onTriggered: {
                    wrongchar = false
                }
            }

            function wrong() {
                wrongchar = true
                timeoutTimer.start()
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

                        // track progress and update test prompt
                        gameObj.processgameKbInput(_textInput.text,
                                                   backspacePressed,
                                                   spacePressed, "game")

                        liveslost = gameObj.getTotalTypedChars(
                                    ) - gameObj.getCorrectChars()
                        if (liveslost != 0 && liveslosttotal !== liveslost) {
                            liveslosttotal += 1

                            if (liveslosttotal === 1 || liveslosttotal === 2) {
                                wrong()
                            }
                        }

                        if (liveslosttotal === 3) {

                            live3_visible = false
                            res_visibility = true

                            _lesson = "LessonEnded"
                        } else {

                            if (liveslosttotal == 1) {

                                live1_visible = false
                            } else if (liveslosttotal == 2) {

                                live2_visible = false
                            }
                        }

                        if (gameObj.lessonEnded) {
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
                            if (__score > __highscore) {
                                __highscore = __score
                            }
                            _textInput.text = ""
                        }
                    }
                }
            }
        }
    }
}

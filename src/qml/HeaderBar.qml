import QtQuick

Item {
    id: _headerItem
    implicitWidth: parent.width * 0.75
    implicitHeight: parent.height * 0.25
    anchors {
        horizontalCenter: parent.horizontalCenter
        top: parent.top
    }

    Item {
        id: _logoContainer
        width: parent.width * 0.50
        height: parent.height
        anchors.left: parent.left

        Item {
            width: parent.width * 0.75
            height: parent.height / 2
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
            Image {
                // Logo
                source: "qrc:/assets/assets/img/typearrambhalogo.svg"
                fillMode: Image.PreserveAspectFit

                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

    Item {
        id: _modeButtonItem
        width: parent.width * 0.40
        height: parent.height

        anchors.right: parent.right

        Item {

            // Assign an ID to the Rectangle
            width: _modeButtonItem.width / 4
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            height: _modeButtonItem.height / 3

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    // Handle practice mode click
                    __currentView = 1
                }
            }

            Text {
                id: _practiceButtonText
                text: "Practice"
                font.family: _NotoSansMedium.name
                font.pixelSize: parent.width / 4
                color: "#CCCCB5"
                anchors.centerIn: parent
            }
        }

        Item {
            id: _gameModeButton
            width: _modeButtonItem.width / 4
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: _modeButtonItem.height / 3

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    __currentView = 2
                }
            }

            Text {
                id: _gameButtonText
                text: "Game"
                font.family: _NotoSansMedium.name
                font.pixelSize: parent.width / 4
                color: "#CCCCB5"
                anchors.centerIn: parent
            }
        }

        Item {
            id: _profileModeButton

            width: _modeButtonItem.width / 4
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            height: _modeButtonItem.height / 3

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    // Handle profile mode click
                    __currentView = 3
                }
            }

            Text {
                id: _profileButtonText
                text: "Profile"
                font.family: _NotoSansMedium.name
                font.pixelSize: parent.width / 4
                color: "#CCCCB5"
                anchors.centerIn: parent
            }
        }
    }
    property int __currentView: 1 //int to indicate the current view; practiceView: 1; gameView: 2; profileView: 3;
    on__CurrentViewChanged: {
        _practiceMode.__lessonState = "LessonOff"
        _practiceMode.js_finishLesson()
        _gameMode.resetgame()
    }

    states: [
        State {
            name: "practiceState"
            when: __currentView === 1

            //highlights the currentView's button
            PropertyChanges {
                target: _practiceButtonText
                color: "#23A9D5"
            }
            PropertyChanges {
                target: _gameButtonText
                color: "#CCCCB5"
            }
            PropertyChanges {
                target: _profileButtonText
                color: "#CCCCB5"
            }

            //makes the currentView visible
            PropertyChanges {
                target: _practiceMode
                visible: true
                focus: true
            }
            PropertyChanges {
                target: _gameMode
                visible: false
                focus: false
            }
            PropertyChanges {
                target: _userProfileMode
                visible: false
                focus: false
            }
        },
        State {
            name: "gameState"
            when: __currentView === 2
            //highlights the currentView's button
            PropertyChanges {
                target: _practiceButtonText
                color: "#CCCCB5"
            }
            PropertyChanges {
                target: _gameButtonText
                color: "#23A9D5"
            }
            PropertyChanges {
                target: _profileButtonText
                color: "#CCCCB5"
            }
            //makes the currentView visible
            PropertyChanges {
                target: _practiceMode
                visible: false
                focus: false
            }
            PropertyChanges {
                target: _gameMode
                visible: true
                focus: true
            }
            PropertyChanges {
                target: _userProfileMode
                visible: false
                focus: false
            }
        },
        State {
            name: "profileState"
            when: __currentView === 3
            //highlights the currentView's button
            PropertyChanges {
                target: _practiceButtonText
                color: "#CCCCB5"
            }
            PropertyChanges {
                target: _gameButtonText
                color: "#CCCCB5"
            }
            PropertyChanges {
                target: _profileButtonText
                color: "#23A9D5"
            }
            //makes the currentView visible
            PropertyChanges {
                target: _practiceMode
                visible: false
                focus: false
            }
            PropertyChanges {
                target: _gameMode
                visible: false
                focus: false
            }
            PropertyChanges {
                target: _userProfileMode
                visible: true
                focus: true
            }
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "practiceState"
            reversible: true
            ColorAnimation {
                properties: "color"
                duration: 250
            }
        },
        Transition {
            from: "*"
            to: "gameState"
            reversible: true
            ColorAnimation {

                properties: "color"
                duration: 250
            }
        },
        Transition {
            from: "*"
            to: "profileState"
            reversible: true
            ColorAnimation {

                properties: "color"
                duration: 250
            }
        }
    ]
}

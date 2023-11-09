import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: _headerBar // Assign an ID to the parent Item
    implicitWidth: parent.width * 0.75
    implicitHeight: parent.height * 0.25
    anchors {
        horizontalCenter: parent.horizontalCenter // Center horizontally in parent
        top: parent.top // Align with the top of the parent
    }

    Item {
        id: _logoContainer // Assign an ID to the Item
        width: parent.width * 0.50
        height: parent.height
        anchors.left: parent.left // Anchor to the left of the parent

        Item {
            width: parent.width * 0.75
            height: parent.height / 2
            anchors {
                left: parent.left // Anchor to the left of the parent
                verticalCenter: parent.verticalCenter // Center vertically in parent
            }
            Image {
                // Logo
                source: "qrc:/assets/assets/img/typearrambhalogo.svg"
                fillMode: Image.PreserveAspectFit

                anchors {
                    left: parent.left // Anchor to the left of the parent
                    verticalCenter: parent.verticalCenter // Center vertically in parent
                    horizontalCenter: parent.horizontalCenter // Center horizontally in parent
                }
            }
        }
    }

    Item {
        id: _modeButtonItem // Assign an ID to the parent Rectangle
        width: parent.width * 0.40
        height: parent.height

        anchors.right: parent.right // Anchor to the right of the parent

        Item {
            id: _practiceModeButton // Assign an ID to the Rectangle

            width: _modeButtonItem.width / 4
            anchors.verticalCenter: parent.verticalCenter // Center vertically in parent
            anchors.left: parent.left
            height: _modeButtonItem.height / 3

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    // Handle practice mode click
                    __currentView = 1

                    _practiceMode.visible = true
                    // Add your logic for practice mode here
                }
            }

            Text {
                id: _practiceButtonText
                text: "practice"
                font.family: _NotoSansMedium.name
                font.pixelSize: parent.width / 4
                color: "#CCCCB5"
                anchors.centerIn: parent
            }
        }

        Item {
            id: _gameModeButton // Assign an ID to the Rectangle
            width: _modeButtonItem.width / 4
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter // Center vertically in parent
            height: _modeButtonItem.height / 3

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    // Handle game mode click
                    __currentView = 2
                    // Add your logic for game mode here
                }
            }

            Text {
                id: _gameButtonText
                text: "game"
                font.family: _NotoSansMedium.name
                font.pixelSize: parent.width / 4
                color: "#CCCCB5"
                anchors.centerIn: parent
            }
        }

        Item {
            id: _profileModeButton // Assign an ID to the Rectangle

            width: _modeButtonItem.width / 4
            anchors.verticalCenter: parent.verticalCenter // Center vertically in parent
            anchors.right: parent.right
            height: _modeButtonItem.height / 3

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    // Handle profile mode click
                    __currentView = 3

                    _userProfileMode.visible = true
                    // Add your logic for profile mode here
                }
            }

            Text {
                id: _profileButtonText
                text: "profile"
                font.family: _NotoSansMedium.name
                font.pixelSize: parent.width / 4
                color: "#CCCCB5"
                anchors.centerIn: parent
            }
        }
    }
    property int __currentView: 1 //int to indicate the current view; practiceView: 1; gameView: 2; profileView: 3;

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
            }
            PropertyChanges {
                target: _gameMode
                visible: false
            }
            PropertyChanges {
                target: _userProfileMode
                visible: false
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
            }
            PropertyChanges {
                target: _gameMode
                visible: true
            }
            PropertyChanges {
                target: _userProfileMode
                visible: false
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
            }
            PropertyChanges {
                target: _gameMode
                visible: false
            }
            PropertyChanges {
                target: _userProfileMode
                visible: true
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

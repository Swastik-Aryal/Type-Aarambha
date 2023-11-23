import QtQuick

Item {
    id: win
    width: 1000
    height: 600
    anchors.top: _headerBar.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: -60

    property int score: 0

    Image {

        id: bg
        source: "qrc:/assets/assets/img/images-gamemode/cloudyforest.jpg"
        width: win.width
        height: win.height
        opacity: 0.75
        z: -1
    }

    //text for instructions only
    Text {
        text: "Press space to jump"
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
    }

    //scorecard and lives
    Item {

        anchors {
            left: parent.left
            top: parent.top
        }

        //scorecard
        Rectangle {
            id: __score

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
                id: __scoretxt
                text: "Score"
                color: "white"
                font.italic: true
                font.pixelSize: 25

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
                Text {
                    text: score
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

            id: lives
            anchors {
                leftMargin: 40
                topMargin: 12
                left: parent.left
                top: __score.bottom
            }
            Image {
                id: live3
                source: "qrc:/assets/assets/img/images-gamemode/live.png"
                width: 25
                height: 25
            }
            Image {
                id: live2
                source: "qrc:/assets/assets/img/images-gamemode/live.png"
                width: 25
                height: 25
                anchors {
                    leftMargin: 5
                    left: live3.right
                }
            }
            Image {
                id: live1
                source: "qrc:/assets/assets/img/images-gamemode/live.png"
                width: 25
                height: 25
                anchors {
                    leftMargin: 5
                    left: live2.right
                }
            }
        }
    }

    //main game section (jump section)
    Rectangle {
        id: __main
        color: "transparent"

        height: win.height
        width: 450

        anchors.centerIn: parent
        state: "1_down"

        // logs ( check obstacle.qml to edit)
        Obstacle {
            id: log3
            width: 250
            height: 60
            anchors {
                right: parent.right
            }
            y: 150 - height / 1.5
            text_visibility: true
        }

        Obstacle {
            id: log2
            width: 250
            height: 60
            anchors {
                left: parent.left
            }

            y: 300
            text_visibility: true
        }
        Obstacle {
            id: log1
            width: 250
            height: 60
            anchors {
                right: parent.right
            }

            y: 450 + height / 1.5
            text_visibility: false
        }

        states: [
            State {
                name: "1_down"
                PropertyChanges {
                    target: log3
                    y: 150 - height / 1.5
                }
                PropertyChanges {
                    target: log1
                    y: 450 + height / 1.5
                }
                PropertyChanges {
                    target: log2
                    y: 300
                }
            },
            State {
                name: "2_down"
                PropertyChanges {
                    target: log1
                    y: 150 - height / 1.5
                }
                PropertyChanges {
                    target: log2
                    y: 450 + height / 1.5
                }
                PropertyChanges {
                    target: log3
                    y: 300
                }
            },
            State {
                name: "3_down"
                PropertyChanges {
                    target: log2
                    y: 150 - height / 1.5
                }
                PropertyChanges {
                    target: log3
                    y: 450 + height / 1.5
                }
                PropertyChanges {
                    target: log1
                    y: 300
                }
            }
        ]

        transitions: [
            Transition {
                from: "1_down"
                to: "2_down"
                PropertyAnimation {
                    targets: log3
                    property: "y"
                    from: 150 - log1.height / 1.5
                    to: 300
                    duration: 2000
                }
                PropertyAnimation {
                    targets: log2
                    property: "y"
                    from: 300
                    to: 450 + log1.height / 1.5
                    duration: 2000
                }

                SequentialAnimation {

                    NumberAnimation {
                        targets: log1
                        property: "y"
                        from: 450 + log1.height / 1.5
                        to: __main.height
                        duration: 1000
                    }
                    NumberAnimation {
                        targets: log1
                        property: "y"
                        from: 0
                        to: 150 - log1.height / 1.5
                        duration: 1000
                    }
                }
            },
            Transition {
                from: "2_down"
                to: "3_down"
                PropertyAnimation {
                    targets: log1
                    property: "y"
                    from: 150 - log1.height / 1.5
                    to: 300
                    duration: 2000
                }
                PropertyAnimation {
                    targets: log3
                    property: "y"
                    from: 300
                    to: 450 + log1.height / 1.5
                    duration: 2000
                }
                SequentialAnimation {

                    NumberAnimation {
                        targets: log2
                        property: "y"
                        from: 450 + log1.height / 1.5
                        to: __main.height
                        duration: 1000
                    }
                    NumberAnimation {
                        targets: log2
                        property: "y"
                        from: 0
                        to: 150 - log1.height / 1.5
                        duration: 1000
                    }
                }
            },
            Transition {
                from: "3_down"
                to: "1_down"
                PropertyAnimation {
                    targets: log2
                    property: "y"
                    from: 150 - log1.height / 1.5
                    to: 300
                    duration: 2000
                }
                PropertyAnimation {
                    targets: log1
                    property: "y"
                    from: 300
                    to: 450 + log1.height / 1.5
                    duration: 2000
                }
                SequentialAnimation {

                    NumberAnimation {
                        targets: log3
                        property: "y"
                        from: 450 + log1.height / 1.5
                        to: __main.height
                        duration: 1000
                    }
                    NumberAnimation {
                        targets: log3
                        property: "y"
                        from: 0
                        to: 150 - log1.height / 1.5
                        duration: 1000
                    }
                }
            }
        ]

        // player here
        AnimatedImage {
            property int current_log: 1

            id: player
            source: "qrc:/assets/assets/img/images-gamemode/giphy1.gif"
            mirror: false
            width: 300
            height: 260
            //x:log1.x-20 ; y:log1.y-160
            anchors {
                bottom: log1.top
                horizontalCenter: log1.horizontalCenter
                bottomMargin: -100
            }
            focus: true

            ScaleAnimator {
                id: scaler1
                target: player
                from: 1
                to: 0
                duration: 1000
                running: false
            }
            ScaleAnimator {
                id: scaler2
                target: player
                from: 0
                to: 1
                duration: 1000
                running: false
            }

            Keys.onPressed: event => {
                                if (event.key === Qt.Key_Space) {
                                    if (current_log === 3) {
                                        player.mirror = false
                                        score = score + 1
                                        console.log("pressed")
                                        log1.text_visibility = false
                                        log2.text_visibility = true
                                        log3.text_visibility = true
                                        scaler1.start()

                                        player.anchors.bottom = log1.top
                                        player.anchors.horizontalCenter = log1.horizontalCenter
                                        scaler1.stop()
                                        scaler2.start()

                                        current_log = 1
                                        __main.state = "1_down"
                                    } else if (current_log === 1) {
                                        player.mirror = true
                                        score = score + 1
                                        console.log("pressed")
                                        log1.text_visibility = true
                                        log2.text_visibility = false
                                        log3.text_visibility = true
                                        scaler1.start()

                                        player.anchors.bottom = log2.top
                                        player.anchors.horizontalCenter = log2.horizontalCenter
                                        scaler1.stop()
                                        scaler2.start()
                                        current_log = 2
                                        __main.state = "2_down"
                                    } else {
                                        player.mirror = false
                                        score = score + 1
                                        console.log("pressed")
                                        log1.text_visibility = true
                                        log2.text_visibility = true
                                        log3.text_visibility = false
                                        scaler1.start()

                                        player.anchors.bottom = log3.top
                                        player.anchors.horizontalCenter = log3.horizontalCenter
                                        scaler1.stop()
                                        scaler2.start()
                                        current_log = 3
                                        __main.state = "3_down"
                                    }
                                }
                            }
        }
    }
}

/**
        transform: Rotation{
            origin.x:player.width/2
            origin.y:player.height/2

            RotationAnimation on angle{
                from:0
                to:360
                duration: 2000
                loops: Animation.Infinite

            }



        }
**/


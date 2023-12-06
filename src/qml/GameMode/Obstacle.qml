import QtQuick

Item {
    property bool __textVisibility: true

    Text {
        id: _txt

        text: __trialtext
        font.italic: true
        color: "black"
        opacity: 0.5

        font.pixelSize: 25
        visible: __textVisibility
        anchors {
            bottom: parent.top
            left: parent.left
            leftMargin: 50

            bottomMargin: -5
        }
    }

    Image {

        width: 250
        height: 40
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        source: "qrc:/assets/assets/img/images-gamemode/stick.png"
    }
}

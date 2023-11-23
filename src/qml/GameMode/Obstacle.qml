import QtQuick 2.0

Item {
    property bool text_visibility: true

    Text{

        text:"Placeholder"
        font.italic: true
        font.pixelSize: 25
        visible:text_visibility
        anchors{
            bottom: parent.top
            horizontalCenter: parent.horizontalCenter
            bottomMargin: -5

        }


    }

    Image {

        width:250; height:40
        anchors{
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        source:"qrc:/assets/assets/img/images-gamemode/stick.png"

    }

}
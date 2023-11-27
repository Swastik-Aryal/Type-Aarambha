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

    TextInput {
        id: testInput
        anchors.fill: parent
        font.pixelSize: 30
        color: "#fae1c3"
        focus: true
        activeFocusOnTab: true
    }
}

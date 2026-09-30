import QtQuick 2.0
import QtQuick.Controls 2.15

Item{
    anchors.fill: parent
    Rectangle{
        id:bgRec
        anchors.fill: parent
        color: "#f2f2f3"

        Label {
            id: loadingLbl
            anchors.centerIn: parent
            text: "Loading..."
            font.pointSize: 16

        }

    }
}


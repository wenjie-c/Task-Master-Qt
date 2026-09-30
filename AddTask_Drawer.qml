import QtQuick 2.15
import QtQuick.Controls 2.15

Drawer {
    id: addTask_Drawer
    width: parent.width
    height: parent.height / 2
    edge: Qt.BottomEdge // Tell QT to open from the borrom
    background: Rectangle{
        anchors.fill: parent
        color: "#2c3e50"

    }

    Label{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.Top
        anchors.topMargin: 10
        text: "Add New"
        color: "white"
        id: titleLb
    }

    TextField{
        id: titleInput
        placeholderText: qsTr("Your task")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: titleLb.bottom
        anchors.topMargin: 13
        width: parent.width/2
    }

    Item{
        width: titleInput.width/2
        height: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: titleInput.bottom
        anchors.topMargin: 13

        TextField{
            id: dateInput
            height: parent.height
            width: parent.width/2.5
            anchors.left: parent.left
            placeholderText: "0000-00-00"
        }

        TextField{
            id: timeInput
            height: parent.height
            width: parent.width/2.5
            anchors.left: parent.right
            placeholderText: "00:00"
        }


    }
    RoundButton {
        id: submitButton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 200
        text: qsTr("Submit")
        width: 200
        onClicked: {
            if(titleInput.text != "" &&
                    dateInput.text != "" &&
                    timeInput.text != ""){
myListModel.append({"titleText":titleInput.text,
                   "dateText":dateInput.text + " | " + timeInput.text})
                titleInput.clear()
                timeInput.clear()
                dateInput.clear()
                addTask_Drawer.close()
            }
        }
    }
}

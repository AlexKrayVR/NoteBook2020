import QtQuick 2.0


Rectangle {
    anchors.fill: parent
//    ModelNoteBook{
//        id: noteBook
//    }
    Rectangle {
        width:parent.width
        anchors.bottom: parent.bottom
        height: parent.height-img.height/2
        color: "#e8bf68"
    }
    Image {
        id: img
        y: 33
        width:parent.width-30
        height: parent.height/7
        anchors.top: parent.top
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        source: "/new/prefix1/spring.png"
    }
    Rectangle {
        id:dilimiter
        width:parent.width
        anchors.top: img.bottom
        height: 2
        color: "#040404"
    }

    Rectangle {
        id:buttonNew
        width:parent.width/6
        anchors.top: listView.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height/8
        color: "#040404"
    }


    ListView{
        id: listView
        anchors.top:img.bottom
        width: parent.width-30
        height: parent.height-img.height-60
        clip: true
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10
        model: NoteBook

        delegate: Item {
            id:del
            height: parent.width/6
            width: parent.width
            Rectangle {
                id: delegateDilimiter
                width:parent.width
                anchors.top: del.top
                height:  model.index===0 ? 0 : 2
                color: "#040404"
            }
            Rectangle{
                id:delegate
                anchors.fill: parent
                radius: 11
                color: "transparent"
                MouseArea {
                    anchors.fill: parent
                    onClicked: listView.currentIndex = model.index
                }
                Text {
                    font.pointSize: delegate.height/3.4
                    width: parent.width-4
                    height: parent.height-2
                    wrapMode: Text.WrapAnywhere

                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignLeft
                    anchors.centerIn: parent
                    text: {
                        //string text[11] = model.text
                        model.text
                    }
                    clip: true
                    smooth: true
                    antialiasing: true
                }
            }
        }
    }


}

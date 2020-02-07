import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12


Rectangle {
    id:notes
    width: 340
    height: 480
    property string allText: ""
    property int indexModel: 0
    signal signalExit
    signal signalDoubleClick
    signal moveText(string v)
    Rectangle {
        width: parent.width
        anchors.bottom: parent.bottom
        height: parent.height-img.height/2
        color: "#e8bf68"
    }
    Item{
        id: img
        width:parent.width-30
        height: parent.height/7
        anchors.top: parent.top
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        Image {
            id: springImg
            anchors.fill: parent
            anchors.margins: 5
            source: "/new/prefix1/spring.png"
        }
    }

    Rectangle {
        id:dilimiter
        width:parent.width
        anchors.top: img.bottom
        height: 2
        color: "#040404"
    }


    ListView{
        id: listView
        anchors.top:dilimiter.bottom
        width: parent.width-40
        height: (parent.height-img.height-dilimiter.height)*0.8
        clip: true
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 1
        model: NoteBook

        highlight: Rectangle{
            color:"#f2dbab"
        }
        highlightFollowsCurrentItem:true

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
                    onClicked: {
                        listView.currentIndex = model.index
                        indexModel= model.index
                    }
                    onDoubleClicked: {
                        allText=model.text
                        notes.signalDoubleClick()
                        notes.signalExit()
                        moveText(model.text)
                    }
                }
                Text {
                    id:textNote
                    font.pointSize: delegate.height/3.4
                    width: parent.width-4
                    height: parent.height-2
                    wrapMode: Text.WrapAnywhere
                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignHCenter
                    anchors.centerIn: parent
                    text: {
                        model.text
                    }
                    clip: true
                    smooth: true
                    antialiasing: true
                }
            }
        }
    }


    Row{
        id:rowMenu
        anchors.top: listView.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width
        height: (parent.height-img.height-dilimiter.height)*0.2

        //type button
        Item {
            width: rowMenu.width/4
            height: Math.min(width,parent.height)
            MouseArea{
                id:buttonSearch
                anchors.fill: parent
                onClicked: notes.signalExit()
            }
            Image {
                id: imageSearch
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10
                anchors.fill: parent
                antialiasing: true
                source: buttonSearch.pressed?"/new/prefix1/type2.png" :"/new/prefix1/type.png"
            }
        }
        //delete note button
        Item {
            width: rowMenu.width/4
            height: Math.min(width,parent.height)
            MouseArea{
                id:buttonDeleteNote
                anchors.fill: parent
                onClicked: {
                    NoteBook.deleteNote(indexModel)
                    NoteBook.saveToFile()
                }
            }
            Image {
                id: imageDeleteNote
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10
                anchors.fill: parent
                antialiasing: true
                source: buttonDeleteNote.pressed ? "/new/prefix1/noteDelete2.png" :"/new/prefix1/noteDelete.png"
            }
        }

        //exit app button
        Item {
            width: rowMenu.width/4
            height: Math.min(width,parent.height)
            MouseArea{
                id:buttonClose
                anchors.fill: parent
                onClicked: {
                    NoteBook.saveToFile()
                    Qt.quit()
                }
            }
            Image {
                id: imageClose
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10
                anchors.fill: parent
                antialiasing: true
                source: buttonClose.pressed?"/new/prefix1/noteClose2.png" :"/new/prefix1/noteClose.png"
            }
        }
    }
}



#include "notebookfile.h"

NoteBookFile::NoteBookFile(): m_fileName(".//NoteBook.txt"),m_mainText()
{

    QFile myFile(m_fileName);
    QString data;
    myFile.open(QIODevice::WriteOnly|QIODevice::Text|QIODevice::ReadOnly);
    QTextStream stream(&myFile);
    while (!myFile.atEnd()) {
        data=stream.readAll();
    }
    myFile.flush();
    myFile.close();

    QString temp;
    for (int i=0; i<data.size() ;i++) {
        if(data[i]!='#'){
            temp+=data[i];
        }else {
            i++;
        m_mainText.push_back(temp);
        temp="";
        }
    }

}

NoteBookFile::~NoteBookFile()
{

}

void NoteBookFile::refresh()
{
    QFile myFile(m_fileName);
   if(myFile.open(QIODevice::WriteOnly|QIODevice::Text)){
       QTextStream stream(&myFile);
       QString temp;
       for (auto &el:m_mainText) {
           temp+=el;
           temp+='#';
       }
       stream<<temp;
   }

   myFile.close();
}

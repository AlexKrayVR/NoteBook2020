#ifndef NOTEBOOKFILE_H
#define NOTEBOOKFILE_H

#include<QString>
#include<QFile>
#include<vector>
#include<QTextStream>
#include<string>
#include<QDir>
#include <QGuiApplication>
class NoteBookFile
{
public:
    NoteBookFile();
     ~NoteBookFile();

    void refresh();

    QString m_fileName;
    QList <QString> m_mainText;
};

#endif // NOTEBOOKFILE_H

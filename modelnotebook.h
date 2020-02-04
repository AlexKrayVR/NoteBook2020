#ifndef MODELNOTEBOOK_H
#define MODELNOTEBOOK_H


#include <QObject>
#include<vector>
#include<QAbstractListModel>
#include<string>
#include<QList>
#include"notebookfile.h"
using namespace std;

class ModelNoteBook : public QAbstractListModel
{
    Q_OBJECT
public:
   explicit ModelNoteBook();


    QHash<int,QByteArray> roleNames() const override;
    int rowCount(const QModelIndex& parent)const override;
    QVariant data(const QModelIndex& index, int role) const override;
    enum CardRoles{
        Text=Qt::UserRole+1
    };
    Q_INVOKABLE void addNote(const QString &note);
    Q_INVOKABLE void deleteNote(int index);

    Q_INVOKABLE void saveToFile();

private:
    NoteBookFile *m_nootBookFile;
    QList<QString> m_wholeText;


};

#endif // MODELNOTEBOOK_H

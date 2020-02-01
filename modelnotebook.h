#ifndef MODELNOTEBOOK_H
#define MODELNOTEBOOK_H


#include <QObject>
#include<vector>
#include<QAbstractListModel>
using namespace std;

class ModelNoteBook : public QAbstractListModel
{
    Q_OBJECT
public:
   explicit ModelNoteBook();

    vector<QString> m_wholeText;

    Q_INVOKABLE void addNote(QString &note);
    QHash<int,QByteArray> roleNames() const override;
    int rowCount(const QModelIndex& parent)const override;
    QVariant data(const QModelIndex& index, int role) const override;
    enum CardRoles{
        Text=Qt::UserRole+1
    };

};

#endif // MODELNOTEBOOK_H

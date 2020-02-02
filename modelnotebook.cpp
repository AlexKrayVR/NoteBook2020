#include "modelnotebook.h"


ModelNoteBook::ModelNoteBook()
{
    m_wholeText.push_back("first fg;fdjjgdfjgdg dgffgdfgdfgfgdg"
                          "dfgdgdgdhl;h;lhdfgdgdggfgdgdfgdgdg"
                          "\ndfgdfg345cg");
    m_wholeText.push_back("grethr\n\tfhfhhfg\ngfjj");
    m_wholeText.push_back("fdgjhbnv");
    m_wholeText.push_back("12cxvny");
    m_wholeText.push_back("ghjhiom");
}

void ModelNoteBook::addNote(const QString &note)
{
    beginResetModel();
    m_wholeText.push_back(note);
    endResetModel();

}

void ModelNoteBook::deleteNote(int index)
{
    if (index<0||index>=m_wholeText.size()){
        return;
    }
    beginResetModel();
    m_wholeText.erase(m_wholeText.begin()+index);
    endResetModel();
}

QHash<int, QByteArray> ModelNoteBook::roleNames() const
{

    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[Text] = "text";
    return roles;
}

int ModelNoteBook::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }
    return static_cast<int>(m_wholeText.size());
}

QVariant ModelNoteBook::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }
    switch (role) {
    case Text:
        return m_wholeText[index.row()];
    default:
        return QVariant();
    }
}

#include "modelnotebook.h"


ModelNoteBook::ModelNoteBook()
{  

    m_nootBookFile=new NoteBookFile;
    for(const auto &el: m_nootBookFile->m_mainText){
        m_wholeText.push_back(el);
    }
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

void ModelNoteBook::saveToFile()
{
    m_nootBookFile->m_mainText.clear();
    for(const auto &el: m_wholeText){
        m_nootBookFile->m_mainText.push_back(el);
    }
    m_nootBookFile->refresh();
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

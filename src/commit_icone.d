module commit_semantico_icone;

class IconeCommit {

    string icone;
    string descricao;

    this(string icone,string descricao){
        this.icone = icone;
        this.descricao = descricao;
    }

    string getIcone(){
        return this.icone;
    }

    string getDescricao(){
        return this.descricao;
    }

}
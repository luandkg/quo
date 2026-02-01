import std.stdio;

int main(string[] args) {
    writeln("");
    writeln("--------------------- QUO :: Commit Semântico @luandkg -----------------------");
    writeln("");

    writeln("Número de argumentos : ",args.length);

    string[] argumentos;
    foreach(index, arg; args){
        writeln("\t Lendo : ",index," = ",arg);
        if( index> 0){
            writeln("\t Adicionando : ",index," = ",arg);
            argumentos ~=arg;
        }
    }


    writeln(argumentos);

    bool exibirAjuda = false;

    if(argumentos.length> 0){
        string primeiro = argumentos[0];

        if(primeiro =="?"){
            exibirAjuda= true;
        }

    }else{
        exibirAjuda= true;
    }


    if(exibirAjuda){
        menuAjuda();
    }

    return 0;
}


void menuAjuda(){

    writeln("\t Ajuda           : ? - Exibe esta ajuda");
    writeln("\t Formato simples : quo tipo_de_commit mensagem_do_commit");
    
}
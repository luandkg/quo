import std.stdio;
import std.string;
import commit.semantico;

int main(string[] args) {
    writeln("");
    writeln("--------------------- QUO :: Commit Semântico @luandkg -----------------------");
    writeln("");

    string[] argumentos;
    foreach(index, arg; args){
        if( index> 0){
            argumentos ~=arg;
        }
    }

    bool exibirAjuda = false;

    if(argumentos.length> 0){
        string primeiro = toUpper(argumentos[0]);

        if(primeiro =="?" || primeiro == "AJUDA" || primeiro == "HELP"){
            exibirAjuda= true;
        }else{
            quo_construir(argumentos);
        }

    }else{
        exibirAjuda= true;
    }


    if(exibirAjuda){
        menuAjuda();
    }


    writeln("");
    writeln("------------------------------------------------------------------------------");

    return 0;
}


void menuAjuda(){

    writeln("\t Ajuda           : ? - Exibe esta ajuda");
    writeln("\t Formato simples : quo tipo_de_commit mensagem_do_commit");
    
}
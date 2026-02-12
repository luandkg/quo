import std.stdio;
import std.string;
import commit.semantico;
import std.file;
import std.path;
import configuracoes;

int main(string[] args) {
    writeln("");
    writeln("--------------------- QUO :: Commit Semântico @luandkg -----------------------");
    writeln("");

    string pastaLocal = dirName(thisExePath());
    string arquivoConfig = buildPath(pastaLocal, "quo.config");

    //writeln("Executavel :: ",arquivoConfig);
    string[string] configuracoes = ler(arquivoConfig);


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

        }else if(primeiro == "@NUMERADO"){

            alterar_numeracao(argumentos,arquivoConfig,configuracoes);
        
        }else if(primeiro == "@HIFEN"){

            alterar_hifen(argumentos,arquivoConfig,configuracoes);

        }else if(primeiro == "@EMOJI"){

            alterar_emoji(argumentos,arquivoConfig,configuracoes);


        }else if(primeiro == "@CONFIG"){

            configuracoes_exibir(configuracoes);

        }else{
            quo_construir(argumentos,configuracoes);
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
import std.stdio;
import std.string;
import std.algorithm : remove;
import commit.semantico;
import std.file;
import std.path;
import configuracoes;
import algoritmos;
import std.process;

int main(string[] args) {
    writeln("");
    writeln("--------------------- QUO :: Commit Semântico @luandkg -----------------------");
    writeln("");

    string pastaLocal = dirName(thisExePath());
    string arquivoConfig = buildPath(pastaLocal, "quo.config");

    string[string] configuracoes = ler(arquivoConfig);

    string[] argumentos = args.remove(0);


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

        }else if(primeiro == "@COMMIT"){

            argumentos = argumentos.remove(0);
            Opcional!string mensagem_commit  = quo_construir(argumentos,configuracoes);

            if(mensagem_commit.temValor()){
                string comando = "git commit -m \"" ~ mensagem_commit.get() ~ "\"";
                writeln("\n\t Executando :: ",comando);
                executeShell(comando);
            }

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
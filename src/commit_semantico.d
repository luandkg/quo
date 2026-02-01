module commit_semantico;

import std.stdio;
import std.string;

import algoritmos;

void quo_construir(string[] argumentos){

    if(argumentos.length == 1){

        writeln("\t ERRO :: é necessário mais de uma palavra para construir o commit semântico.");

    }else{

        Opcional!string commit_tipo = new Opcional!string(argumentos[0]);
        string commit_escopo = "";
        string commit_mensagem = "";

        int indice = 1;
        bool escopo_delimitado = false;
        bool mensagem_delimitado = false;


        while(indice<argumentos.length && escopo_delimitado==false){
            if(argumentos[indice] == "-"){
                escopo_delimitado = true;
            }else{
                commit_escopo ~= " " ~ argumentos[indice];
            }
            indice+=1;
        }

        while(indice<argumentos.length && mensagem_delimitado==false){
            if(argumentos[indice] == "=="){
                mensagem_delimitado = true;
            }else{
                commit_mensagem ~= " " ~ argumentos[indice];
            }
            indice+=1;
        }



        commit_tipo.set(strip(commit_tipo.get()));
        commit_escopo = strip(commit_escopo);
        commit_mensagem = strip(commit_mensagem);

        writeln("\t COMMIT TIPO     :: ",commit_tipo);
        writeln("\t COMMIT ESCOPO   :: ",commit_escopo);
        writeln("\t COMMIT MENSAGEM :: ",commit_mensagem);

    }
}
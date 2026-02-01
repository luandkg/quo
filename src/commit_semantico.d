module commit_semantico;

import std.stdio;
import std.string;

import algoritmos;

void quo_construir(string[] argumentos){

    if(argumentos.length == 1){

        writeln("\t ERRO :: é necessário mais de uma palavra para construir o commit semântico.");

    }else{

        Opcional!string commit_tipo = new Opcional!string(strip(argumentos[0]));
        Opcional!string commit_escopo = new Opcional!string();
        Opcional!string commit_mensagem = new Opcional!string();

        int indice = 1;
        
        indice = parser_ate_opcionalmente(argumentos,indice,"-",commit_escopo);
        indice = parser_ate_opcionalmente(argumentos,indice,"==",commit_mensagem);


        writeln("\t COMMIT TIPO     :: ",commit_tipo.get());
        writeln("\t COMMIT ESCOPO   :: ",commit_escopo.get());
        writeln("\t COMMIT MENSAGEM :: ",commit_mensagem.get());

        writeln("");

        string publicar_mensagem = constroi_mensagem_de_commit(commit_tipo,commit_escopo,commit_mensagem);


        writeln("\t ",publicar_mensagem);


    }

}

int parser_ate_opcionalmente(string[] argumentos,int inicio,string delimitador,Opcional!string resultado){

        int indice = inicio;
        bool delimitador_encontrado = false;
        string texto = "";

        while(indice<argumentos.length && delimitador_encontrado==false){
            if(argumentos[indice] == delimitador){
                delimitador_encontrado = true;
            }else{
                texto ~= " " ~ argumentos[indice];
            }
            indice+=1;
        }

        texto = strip(texto);
        resultado.set(texto);

        return indice;
}


string constroi_mensagem_de_commit(Opcional!string commit_tipo,Opcional!string commit_escopo,Opcional!string commit_mensagem){

    string publicar_mensagem = "";

    if (commit_tipo.temValor()){
        publicar_mensagem = commit_tipo.get();
    }


    if(commit_escopo.temValor()){
        publicar_mensagem ~= "(" ~ commit_escopo.get() ~ ")";
    }

    if(commit_mensagem.temValor()){
        publicar_mensagem ~= ": " ~ commit_mensagem.get();
    }

    return publicar_mensagem;
}
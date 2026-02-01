
module commit.semantico;

import std.stdio;
import std.string;
import std.algorithm.searching;
import std.conv;

import algoritmos;
import commit.icone;
 

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

        string[] varias_frases;

        while(indice<argumentos.length){

            Opcional!string frase_corrente = new Opcional!string();
            indice = parser_ate_opcionalmente(argumentos,indice,"==",frase_corrente);

            if(frase_corrente.temValor()){
                varias_frases ~= frase_corrente.get();
            }

        }


        string publicar_mensagem = constroi_mensagem_de_commit(commit_tipo,commit_escopo,commit_mensagem,varias_frases);


        writeln("\t COMMIT TIPO     :: ",commit_tipo.get());
        writeln("\t COMMIT ESCOPO   :: ",commit_escopo.get());
        writeln("\t COMMIT MENSAGEM :: ",commit_mensagem.get());

        writeln("");

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


string constroi_mensagem_de_commit(Opcional!string commit_tipo,Opcional!string commit_escopo,Opcional!string commit_mensagem,string[] varias_frases){

    string publicar_mensagem = "";


    IconeCommit[] icones;

    icones ~=new IconeCommit("🎉 ","init");

    icones ~=new IconeCommit("✨","feat");
    icones ~=new IconeCommit("🔧","chore");
    icones ~=new IconeCommit("🧪","test");
    icones ~=new IconeCommit("🐛","bug");
    icones ~=new IconeCommit("💥","fix");
    icones ~=new IconeCommit("📦","package");
    icones ~=new IconeCommit("📚","docs");

    icones ~=new IconeCommit("⚡","perf");
    icones ~=new IconeCommit("♻️","refactor");
    icones ~=new IconeCommit("🧹","cleanup");
    icones ~=new IconeCommit("🗑️","remove");
    icones ~=new IconeCommit("🗃️","raw");
    icones ~=new IconeCommit("🧱","ci");
    icones ~=new IconeCommit("🛠️","build");


    bool numerado = false;


    if (commit_tipo.temValor()){

        if(canFind(commit_tipo.get(),"@numerado")){
            commit_tipo.set(replace(commit_tipo.get(),"@numerado",""));
            numerado= true;
        }


        bool temIcone = false;
        string commit_icone = "";

        foreach(icone;icones){
            if(icone.getDescricao() == commit_tipo.get()){
                temIcone=true;
                commit_icone = icone.getIcone();
                break;
            }
        }

        if(temIcone){
            publicar_mensagem = commit_icone ~ " " ~commit_tipo.get();
        }else{
            publicar_mensagem = commit_tipo.get();
        }

    }


    if(commit_escopo.temValor()){
        if(commit_escopo.get().length>0){
            publicar_mensagem ~= "(" ~ commit_escopo.get() ~ ")";
        }
    }

    if(commit_mensagem.temValor()){
        publicar_mensagem ~= ": " ~ commit_mensagem.get();
    }

    if (varias_frases.length>0){

        string mensagem_longa = "";

        int numerando =1;

        foreach(frase;varias_frases){

            string frase_local = frase;

            if(numerado){
                frase_local = to!string(numerando) ~ ") " ~ frase;
                numerando+=1;
            }

            mensagem_longa ~= "\n" ~ frase_local;
        }

        publicar_mensagem ~= "\n" ~mensagem_longa;
    }



    return publicar_mensagem;
}
module configuracoes;

import std.file;
import std.string;
import std.stdio;
import Texto;


string[string] ler(string arquivoLocal){

    string[string] configuracoes;

    string conteudo = "";

    if (exists(arquivoLocal)){
        conteudo = readText(arquivoLocal);

        foreach(linha; splitLines(conteudo)){
            linha = strip(linha);
            string chave = Texto.obterAte(linha,'=');
            string valor = Texto.obterDepoisDe(linha,'=');
            configuracoes[chave] = valor;
        }

    }else{
        configuracoes["NUMERADO"] = "NAO";
        configuracoes["HIFEN"] = "NAO";
    }


    return configuracoes;
}


void guardar(string arquivoLocal,string[string] configuracoes){


    string conteudo = "";

    foreach(chave,valor; configuracoes){
        conteudo ~=chave  ~"=" ~ valor ~ "\n";
    }

    std.file.write(arquivoLocal,conteudo);

}



void alterar_numeracao(string[] argumentos,string arquivoConfig,string[string] configuracoes){

    if(argumentos.length == 2){

        string valor = toUpper(argumentos[1]);

        writeln("\t ++ Numerado -->> ",valor);

        if(valor == "SIM" || valor == "NAO"){

            configuracoes["NUMERADO"] = valor;

            guardar(arquivoConfig,configuracoes);

            writeln("\t >> configurações atualizadas !!!");

        }else{
             writeln("\t ERRO = o valor informado é inválido. Use SIM ou NAO.");
        }
    }else{
        writeln("\t ERRO = são dois argumentos.");    
    }

}

void alterar_hifen(string[] argumentos,string arquivoConfig,string[string] configuracoes){

    if(argumentos.length == 2){

        string valor = toUpper(argumentos[1]);

        writeln("\t ++ Hifen -->> ",valor);

        if(valor == "SIM" || valor == "NAO"){

            configuracoes["HIFEN"] = valor;

            guardar(arquivoConfig,configuracoes);

            writeln("\t >> configurações atualizadas !!!");

        }else{
             writeln("\t ERRO = o valor informado é inválido. Use SIM ou NAO.");
        }
    }else{
        writeln("\t ERRO = são dois argumentos.");    
    }

}

void configuracoes_exibir(string[string] configuracoes){

    writeln("");

    foreach(chave,valor; configuracoes){
        writeln("\t -- ",chave, " = ", valor);
    }

}
module commit_semantico;

import std.stdio;

void quo_construir(string[] argumentos){

    foreach(index, arg; argumentos){
        writeln("\t ++ ",arg);
    }

}
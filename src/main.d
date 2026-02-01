import std.stdio;

int main(string[] args) {
    writeln("");
    writeln("--------------------- QUO :: Commit Semântico @luandkg -----------------------");
    writeln("");

    writeln("Número de argumentos : ",args.length);

    foreach(index, arg; args){
        writeln("\t Argumento : ",index," = ",arg);
    }

    return 0;
}

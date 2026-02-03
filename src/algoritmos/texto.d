module Texto;

string obterAte(string conteudo, char ate){

    string retornar = "";

    ulong i = 0;
    ulong o = conteudo.length;

    while(i<o){

        char letra = conteudo[i];

        if (letra == ate){
            break;
        }

        retornar ~=letra;

        i+=1;
    }

    return retornar;
}

string obterDepoisDe(string conteudo, char depoisDe){

    string retornar = "";

    ulong i = 0;
    ulong o = conteudo.length;

    bool encontrou = false;

    while(i<o){

        char letra = conteudo[i];

        if(encontrou){
            retornar ~=letra;
        }else{

            if (letra == depoisDe){
                encontrou=true;
            }

        }
        i+=1;
    }

    return retornar;
}
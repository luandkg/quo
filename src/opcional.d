module algoritmos;

class Opcional(T){
    T valor;
    bool status;

    this (){
        this.status = false;
    }
    
    this(T valor){
        set(valor);
    }

    bool temValor(){
        return this.status;
    }

    T get(){
        return this.valor;
    }

    void set(T valor){
        if(valor !is null){
            this.status= true;
            this.valor = valor;
        }else{
            this.status= false; 
        }
    }
}
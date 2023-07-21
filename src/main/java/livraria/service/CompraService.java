package livraria.service;

import livraria.model.Compra;
import livraria.model.Livro;

public class CompraService {

    public float calcularTotal(Compra compra){
        float total = 0;
        if(!compra.getLivros().isEmpty()){
            for(Livro l: compra.getLivros()){
                total += l.getValor()*l.getQuantidade();
            }
        }
        return total;
    }

    public void somarQuantidade(Compra compra, int codlivro){
        for(int i=0; i < compra.getLivros().size(); i++){
            if(compra.getLivros().get(i).getCodlivro() == codlivro) {
                compra.getLivros().get(i).setQuantidade(compra.getLivros().get(i).getQuantidade() + 1);
            }
        }
    }

    public void subtrairQuantidade(Compra compra, int codlivro){
        for(int i=0; i < compra.getLivros().size(); i++){
            if(compra.getLivros().get(i).getCodlivro() == codlivro) {
                compra.getLivros().get(i).setQuantidade(compra.getLivros().get(i).getQuantidade() - 1);
            }
        }
    }
}

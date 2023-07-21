package livraria.model;

import java.sql.Date;
import java.util.ArrayList;

public class Compra {
    private int codCompra;
    private float total;
    private ArrayList<Livro> livros = new ArrayList<Livro>();
    private Usuario cliente;

    public Compra() {
    }

    public Compra(int codCompra, float total) {
        this.codCompra = codCompra;
        this.total = total;
    }

    public Compra(int codCompra, float total, Usuario cliente) {
        this.codCompra = codCompra;
        this.total = total;
        this.cliente = cliente;
    }

    public ArrayList<Livro> getLivros() {
        return livros;
    }

    public void setLivros(ArrayList<Livro> livros) {
        this.livros = livros;
    }

    public int getCodCompra() {
        return codCompra;
    }

    public void setCodCompra(int codCompra) {
        this.codCompra = codCompra;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public Usuario getCliente() {
        return cliente;
    }

    public void setCliente(Usuario cliente) {
        this.cliente = cliente;
    }
}

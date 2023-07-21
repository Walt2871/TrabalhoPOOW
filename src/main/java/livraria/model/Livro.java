package livraria.model;

public class Livro {
    private int codlivro;
    private String titulo;
    private float valor;
    private String autor;
    private String editora;
    private String categoria;
    private String urlimg;
    private int quantidade = 0;

    public Livro() {
    }

    public Livro(String titulo, float valor, String autor, String editora, String categoria) {
        this.titulo = titulo;
        this.valor = valor;
        this.autor = autor;
        this.editora = editora;
        this.categoria = categoria;
    }

    public Livro(int codLivro, String titulo, float valor, String autor, String editora, String categoria, String urlimg) {
        this.codlivro = codLivro;
        this.titulo = titulo;
        this.valor = valor;
        this.autor = autor;
        this.editora = editora;
        this.categoria = categoria;
        this.urlimg = urlimg;
    }

    public Livro(int codlivro, String titulo, float valor, String autor, String editora, String categoria, String urlimg, int quantidade) {
        this.codlivro = codlivro;
        this.titulo = titulo;
        this.valor = valor;
        this.autor = autor;
        this.editora = editora;
        this.categoria = categoria;
        this.urlimg = urlimg;
        this.quantidade = quantidade;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getEditora() {
        return editora;
    }

    public void setEditora(String editora) {
        this.editora = editora;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getCodlivro() {
        return codlivro;
    }

    public void setCodlivro(int codlivro) {
        this.codlivro = codlivro;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public String getUrlimg() {
        return urlimg;
    }

    public void setUrlimg(String urlimg) {
        this.urlimg = urlimg;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
}

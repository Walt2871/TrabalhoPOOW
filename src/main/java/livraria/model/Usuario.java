package livraria.model;

public class Usuario {
    private int codusuario;
    private String nome;
    private String celular;
    private String email;
    private String cpf;
    private String senha;
    private boolean funcionario;

    public Usuario() {
    }

    public Usuario(int codUsuario, String nome, String celular, String email, String cpf, String senha, boolean funcionario) {
        this.codusuario = codUsuario;
        this.nome = nome;
        this.celular = celular;
        this.email = email;
        this.cpf = cpf;
        this.senha = senha;
        this.funcionario = funcionario;
    }

    public int getCodusuario() {
        return codusuario;
    }

    public void setCodusuario(int codusuario) {
        this.codusuario = codusuario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public boolean isFuncionario() {
        return funcionario;
    }

    public void setFuncionario(boolean funcionario) {
        this.funcionario = funcionario;
    }
}

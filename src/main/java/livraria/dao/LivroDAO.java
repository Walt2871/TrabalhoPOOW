package livraria.dao;

import livraria.model.Livro;
import livraria.model.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class LivroDAO {

    private String sql;
    private Statement statement;
    private ResultSet resultset;
    private PreparedStatement preparedStatement;
    private String status;

    public ArrayList<Livro> getLivros(){
        ArrayList<Livro> livros = new ArrayList<>();

        try(Connection connection = new ConectaDB().getConexao()){

            this.sql = "SELECT * FROM livro";
            this.statement = connection.createStatement();
            this.resultset = this.statement.executeQuery(sql);

            while(this.resultset.next()){
                livros.add(new Livro(this.resultset.getInt("codlivro"), this.resultset.getString("titulo"), this.resultset.getFloat("valor"), this.resultset.getString("autor"), this.resultset.getString("editora"), this.resultset.getString("categoria"), this.resultset.getString("urlimg")));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return livros;
    }

    public Livro getLivro(int codlivro){
        Livro livro = new Livro();
        try(Connection connection = new ConectaDB().getConexao()){

            this.sql = "SELECT * FROM livro WHERE codlivro = ?";
            this.preparedStatement = connection.prepareStatement(this.sql);
            preparedStatement.setInt(1, codlivro);
            this.resultset = this.preparedStatement.executeQuery();
            this.resultset.next();
            livro.setCodlivro(this.resultset.getInt("codlivro"));
            livro.setTitulo(this.resultset.getString("titulo"));
            livro.setCategoria(this.resultset.getString("categoria"));
            livro.setEditora(this.resultset.getString("editora"));
            livro.setAutor(this.resultset.getString("autor"));
            livro.setUrlimg(this.resultset.getString("urlimg"));
            livro.setValor(this.resultset.getFloat("valor"));

        }catch (SQLException e){
            e.printStackTrace();
        }
        return livro;
    }

    public String cadastrarLivro(Livro livro){
        try(Connection connection = new ConectaDB().getConexao()){

            connection.setAutoCommit(false);

            this.sql = "INSERT INTO livro(titulo, valor, categoria, autor, editora, urlimg) VALUES (?, ?, ?, ?, ?, ?)";

            this.preparedStatement =  connection.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, livro.getTitulo());
            preparedStatement.setFloat(2, livro.getValor());
            preparedStatement.setString(3, livro.getCategoria());
            preparedStatement.setString(4, livro.getAutor());
            preparedStatement.setString(5, livro.getEditora());
            preparedStatement.setString(6, livro.getUrlimg());

            this.preparedStatement.execute();
            this.resultset = this.preparedStatement.getGeneratedKeys();
            this.resultset.next();

            if(this.resultset.getInt(1) > 0){
                livro.setCodlivro(this.resultset.getInt(1));
                this.status = "OK";
                connection.commit();
            }

        }catch (SQLException e){
            e.printStackTrace();
            this.status = "ERRO";
        }

        return this.status;
    }

    public String deletarLivro(int codlivro){

        try(Connection connection = new ConectaDB().getConexao()){
            connection.setAutoCommit(false);

            this.sql = "DELETE FROM livro WHERE codlivro = ?";

            this.preparedStatement =  connection.prepareStatement(this.sql);
            preparedStatement.setInt(1, codlivro);

            if(!this.preparedStatement.execute()){
                this.status = "OK";
                connection.commit();
            }

        }catch (SQLException e){
            e.printStackTrace();
            this.status = "ERRO";
        }

        return this.status;
    }

    public String editarLivro(Livro livro){
        try(Connection connection = new ConectaDB().getConexao()){


            this.sql = "UPDATE livro SET titulo = ?, valor = ?, categoria = ?, autor = ?, editora = ?, urlimg = ? WHERE codlivro = ?";

            this.preparedStatement =  connection.prepareStatement(this.sql);
            preparedStatement.setString(1, livro.getTitulo());
            preparedStatement.setFloat(2, livro.getValor());
            preparedStatement.setString(3, livro.getCategoria());
            preparedStatement.setString(4, livro.getAutor());
            preparedStatement.setString(5, livro.getEditora());
            preparedStatement.setString(6, livro.getUrlimg());
            preparedStatement.setInt(7, livro.getCodlivro());

            if(!this.preparedStatement.execute()){
                this.status = "OK";
                System.out.println(livro.getTitulo());
            }

        }catch (SQLException e){
            e.printStackTrace();
            this.status = "ERRO";
        }

        return this.status;
    }

}

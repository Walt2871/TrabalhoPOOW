package livraria.dao;

import livraria.model.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class UsuarioDAO {

    private String sql;
    private Statement statement;
    private ResultSet resultset;
    private PreparedStatement preparedStatement;
    private String status;

    public ArrayList<Usuario> getUsuarios(){
        ArrayList<Usuario> usuarios = new ArrayList<>();

        try(Connection connection = new ConectaDB().getConexao()){

            this.sql = "SELECT * FROM usuario WHERE usuario.funcionario = false";
            this.statement = connection.createStatement();
            this.resultset = this.statement.executeQuery(sql);

            while(this.resultset.next()){
                usuarios.add(new Usuario(this.resultset.getInt("codusuario"), this.resultset.getString("nomeusuario"), this.resultset.getString("celular"), this.resultset.getString("email"), this.resultset.getString("cpf"), this.resultset.getString("senha"), this.resultset.getBoolean("funcionario")));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return usuarios;
    }

    public Usuario getUsuario(String cpf){
        Usuario usuario = new Usuario();
        try(Connection connection = new ConectaDB().getConexao()){

            this.sql = "SELECT * FROM usuario WHERE cpf = ?";
            this.preparedStatement = connection.prepareStatement(this.sql);
            preparedStatement.setString(1, cpf);
            this.resultset = this.preparedStatement.executeQuery();
            this.resultset.next();
            usuario.setCodusuario(this.resultset.getInt("codusuario"));
            usuario.setNome(this.resultset.getString("nomeusuario"));
            usuario.setCelular(this.resultset.getString("celular"));
            usuario.setCpf(this.resultset.getString("cpf"));
            usuario.setEmail(this.resultset.getString("email"));
            usuario.setSenha(this.resultset.getString("senha"));
            usuario.setFuncionario(this.resultset.getBoolean("funcionario"));

        }catch (SQLException e){
            e.printStackTrace();
        }

        return usuario;
    }

    public String cadastrarUsuario(Usuario usuario){
        try(Connection connection = new ConectaDB().getConexao()){

            connection.setAutoCommit(false);

            this.sql = "INSERT INTO usuario(nomeusuario, celular, email, cpf, senha, funcionario) VALUES (?, ?, ?, ?, ?, ?)";

            this.preparedStatement =  connection.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getCelular());
            preparedStatement.setString(3, usuario.getEmail());
            preparedStatement.setString(4, usuario.getCpf());
            preparedStatement.setString(5, usuario.getSenha());
            preparedStatement.setBoolean(6, usuario.isFuncionario());

            this.preparedStatement.execute();
            this.resultset = this.preparedStatement.getGeneratedKeys();
            this.resultset.next();

            if(this.resultset.getInt(1) > 0){
                usuario.setCodusuario(this.resultset.getInt(1));
                this.status = "OK";
                connection.commit();
            }

        }catch (SQLException e){
            e.printStackTrace();
            this.status = "ERRO";
        }

        return this.status;
    }

    public String deletarUsuario(int codusuario){

        try(Connection connection = new ConectaDB().getConexao()){
            connection.setAutoCommit(false);

            this.sql = "DELETE FROM usuario WHERE codusuario = ?";

            this.preparedStatement =  connection.prepareStatement(this.sql);
            preparedStatement.setInt(1,codusuario);

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

    public String editarUsuario(Usuario usuario){
        try(Connection connection = new ConectaDB().getConexao()){

            connection.setAutoCommit(false);

            this.sql = "UPDATE usuario SET nomeusuario = ?, celular = ?, email = ?, cpf = ?, senha = ?, funcionario = ? WHERE codusuario = ? ";

            this.preparedStatement =  connection.prepareStatement(this.sql);
            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getCelular());
            preparedStatement.setString(3, usuario.getEmail());
            preparedStatement.setString(4, usuario.getCpf());
            preparedStatement.setString(5, usuario.getSenha());
            preparedStatement.setBoolean(6, usuario.isFuncionario());
            preparedStatement.setInt(7, usuario.getCodusuario());


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
}

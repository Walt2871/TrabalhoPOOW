package livraria.dao;

import livraria.model.Compra;
import livraria.model.Livro;
import livraria.model.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class CompraDAO {

    private String sql;
    private Statement statement;
    private ResultSet resultset;
    private PreparedStatement preparedStatement;
    private String status;

    public ArrayList<Compra> getCompras(Usuario usuario){
        ArrayList<Compra> compras = new ArrayList<>();

        try(Connection connection = new ConectaDB().getConexao()){

            this.sql = "SELECT * FROM compra WHERE codcliente = ?";
            this.preparedStatement = connection.prepareStatement(this.sql);
            preparedStatement.setInt(1, usuario.getCodusuario());
            this.resultset = this.preparedStatement.executeQuery();

            while(this.resultset.next()){
                compras.add(new Compra(this.resultset.getInt("codcompra"), this.resultset.getFloat("total"), usuario));
            }

            if(compras.size()>0){
                this.sql = "SELECT * FROM compralivro cl, livro l WHERE cl.codlivro = l.codlivro AND cl.codcompra = ?";
                this.preparedStatement = connection.prepareStatement(this.sql);
                for(int i=0;i<compras.size();i++){
                    ArrayList<Livro> livros = new ArrayList<>();
                    preparedStatement.setInt(1, compras.get(i).getCodCompra());
                    this.resultset = this.preparedStatement.executeQuery();

                    while(this.resultset.next()){
                        livros.add(new Livro(this.resultset.getInt("codlivro"), this.resultset.getString("titulo"), this.resultset.getFloat("valor"), this.resultset.getString("autor"), this.resultset.getString("editora"), this.resultset.getString("categoria"), this.resultset.getString("urlimg"), this.resultset.getInt("quantidade")));
                    }
                    compras.get(i).setLivros(livros);
                }
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return compras;
    }

    public ArrayList<Compra> getComprasParcial(){
        ArrayList<Compra> compras = new ArrayList<>();

        try(Connection connection = new ConectaDB().getConexao()){
            this.sql = "SELECT codcompra, total, compra.codcliente, nomeusuario FROM compra, usuario WHERE compra.codcliente = usuario.codusuario";
            this.statement = connection.createStatement();
            this.resultset = this.statement.executeQuery(sql);

            while(resultset.next()){
                Compra compra = new Compra();
                compra.setCodCompra(resultset.getInt("codcompra"));
                compra.setTotal(resultset.getFloat("total"));
                Usuario usuario = new Usuario();
                usuario.setCodusuario(resultset.getInt("codcliente"));
                usuario.setNome(resultset.getString("nomeusuario"));
                compra.setCliente(usuario);
                compras.add(compra);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return compras;
    }

    public Compra getCompra(int codcompra){
        Compra compra = new Compra();
        try(Connection connection = new ConectaDB().getConexao()){
            this.sql = "SELECT * FROM compralivro cl, livro l WHERE cl.codlivro = l.codlivro AND cl.codcompra = ?";
            this.preparedStatement = connection.prepareStatement(this.sql);
            preparedStatement.setInt(1, codcompra);
            this.resultset = this.preparedStatement.executeQuery();
            ArrayList<Livro> livros = new ArrayList<>();
            while(this.resultset.next()){
                compra.setCodCompra(codcompra);
                livros.add(new Livro(this.resultset.getInt("codlivro"), this.resultset.getString("titulo"), this.resultset.getFloat("valor"), this.resultset.getString("autor"), this.resultset.getString("editora"), this.resultset.getString("categoria"), this.resultset.getString("urlimg"), this.resultset.getInt("quantidade")));
            }
            compra.setLivros(livros);
        }catch (SQLException e){
            e.printStackTrace();
        }

        return compra;
    }

    public String cadastrarCompra(Usuario usuario, Compra compra){
        try(Connection connection = new ConectaDB().getConexao()){

            connection.setAutoCommit(false);

            this.sql = "INSERT INTO compra(total, codcliente) VALUES (?, ?)";

            this.preparedStatement =  connection.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setFloat(1, compra.getTotal());
            preparedStatement.setInt(2, usuario.getCodusuario());

            this.preparedStatement.execute();
            this.resultset = this.preparedStatement.getGeneratedKeys();
            this.resultset.next();

            if(this.resultset.getInt(1) > 0){
                compra.setCodCompra(this.resultset.getInt(1));
                this.status = "OK";
            }

            if(this.status.equals("OK")){
                this.sql = "INSERT INTO compralivro (codcompra, codlivro, quantidade) VALUES (?, ?, ?)";

                this.preparedStatement = connection.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
                for(Livro livro: compra.getLivros()){
                    preparedStatement.setInt(1, compra.getCodCompra());
                    preparedStatement.setInt(2, livro.getCodlivro());
                    preparedStatement.setInt(3, livro.getQuantidade());
                    this.preparedStatement.addBatch();
                }
                this.preparedStatement.executeBatch();
                this.resultset = this.preparedStatement.getGeneratedKeys();
                this.resultset.next();
                if(this.resultset.getInt(1)>0){
                    connection.commit();
                }
            }

        }catch (SQLException e){
            e.printStackTrace();
            this.status = "ERRO";
        }

        return this.status;
    }
}
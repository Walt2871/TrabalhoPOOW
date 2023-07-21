package livraria.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConectaDB {

    private static final String DRIVER = "org.postgresql.Driver";
    private static final String URL = "jdbc:postgresql://192.168.56.102:5432/Loja_de_Livros";
    private static final String USER = "postgres";
    private static final String SENHA = "1234";

    public Connection getConexao(){
        Connection conn = null;
        try{
            Class.forName(this.DRIVER);
            conn = DriverManager.getConnection(this.URL, this.USER, this.SENHA);
            System.out.println("Conexão realizada com sucesso");
        }catch (Exception e){
            e.printStackTrace();
        }
        return conn;
    }

}

package livraria.service;

import livraria.dao.UsuarioDAO;
import livraria.model.Usuario;

public class LoginService {
    public Usuario autenticar(String cpf, String senha){
        Usuario user = new UsuarioDAO().getUsuario(cpf);
        System.out.println(user.getCpf());
        if(user.getCpf() == null){
            System.out.println("Usuario inexistente");
            return null;
        }
        else if(user.getCpf().equals(cpf) && user.getSenha().equals(senha)){
            return user;
        }
        else{
            return null;
        }
    }
}

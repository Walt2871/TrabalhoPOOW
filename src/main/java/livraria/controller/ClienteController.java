package livraria.controller;

import livraria.dao.LivroDAO;
import livraria.dao.UsuarioDAO;
import livraria.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/cliente")
public class ClienteController {

    @GetMapping("/editarPerfil")
    public String editarPerfil(HttpSession sessao, Model model){
       Usuario usuario = (Usuario) sessao.getAttribute("usuario");
       model.addAttribute("usuario", usuario);
       return "cliente/editarPerfil";
    }

    @PostMapping("/confirmarEdicao")
    public String confirmarEdicao(@ModelAttribute("usuario")Usuario usuario, HttpSession sessao, Model model){
        new UsuarioDAO().editarUsuario(usuario);
        sessao.setAttribute("usuario", usuario);
        model.addAttribute("livros", new LivroDAO().getLivros());
        return "cliente/principal";
    }

    @GetMapping("/principal")
    public String voltarPrincipal(Model model){
        model.addAttribute("livros", new LivroDAO().getLivros());
        return "cliente/principal";
    }

    @GetMapping("/cadastro")
    public String cadastrar(Model model){
        model.addAttribute("usuario", new Usuario());
        return "cadastro";
    }

    @PostMapping("/confirmarCadastro")
    public String confirmarCadastro(@ModelAttribute("cliente")Usuario cliente, Model model){
        new UsuarioDAO().cadastrarUsuario(cliente);

        model.addAttribute("usuario", new Usuario());

        return "login";
    }

    @GetMapping("/listaUsuarios")
    public String listaUsuarios(Model model){
        model.addAttribute("usuarios", new UsuarioDAO().getUsuarios());
        return "funcionario/listaUsuarios";
    }

    @GetMapping("/editar/{cpf}")
    public String editarUsuario(Model model, @PathVariable("cpf") String cpf){
        model.addAttribute("usuarioEditar", new UsuarioDAO().getUsuario(cpf));

        return "funcionario/editarUsuario";
    }

    @PostMapping("/confirmarEditar")
    public String confirmarEdicao(@ModelAttribute("usuario") Usuario usuario, Model model, HttpSession sessao){
        new UsuarioDAO().editarUsuario(usuario);

        model.addAttribute("usuarios", new UsuarioDAO().getUsuarios());

        return "funcionario/listaUsuarios";
    }

    @GetMapping("/excluir/{codusuario}")
    public String excluirUsuario(@PathVariable("codusuario")int codusuario, Model model){
        new UsuarioDAO().deletarUsuario(codusuario);
        model.addAttribute("usuarios", new UsuarioDAO().getUsuarios());
        return "funcionario/listaUsuarios";
    }
}


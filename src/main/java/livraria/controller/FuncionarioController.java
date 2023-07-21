package livraria.controller;

import livraria.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/funcionario")
public class FuncionarioController {

    @GetMapping("/principal")
    public String voltarPrincipal(){
        return "funcionario/principal";
    }

    @GetMapping("/editarPerfil")
    public String editarPerfil(HttpSession sessao, Model model){
        Usuario usuario = (Usuario) sessao.getAttribute("usuario");
        model.addAttribute("usuario", usuario);
        return "funcionario/editarPerfil";
    }

}

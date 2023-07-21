package livraria.controller;

import livraria.dao.LivroDAO;
import livraria.model.Compra;
import livraria.model.Usuario;
import livraria.service.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @PostMapping("/logar")
   public String logar(@ModelAttribute("usuario")Usuario usuario, Model model, HttpSession sessao){
        Usuario aux = new LoginService().autenticar(usuario.getCpf(), usuario.getSenha());
        if(aux != null){
            sessao.setAttribute("usuario", aux);
            if(!aux.isFuncionario()){
                sessao.setAttribute("carrinho", new Compra());
                model.addAttribute("livros", new LivroDAO().getLivros());
                model.addAttribute("usuario", aux);
                return "cliente/principal";
            }
            else{
                model.addAttribute("usuario", aux);
                return "funcionario/principal";
            }
        }
        return "login";
   }

   @GetMapping("/sair")
   public String sair(HttpSession sessao, Model model){
        sessao.invalidate();

        model.addAttribute("usuario", new Usuario());
        return "login";
   }

}

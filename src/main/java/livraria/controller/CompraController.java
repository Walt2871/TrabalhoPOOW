package livraria.controller;

import livraria.dao.CompraDAO;
import livraria.dao.LivroDAO;
import livraria.model.Compra;
import livraria.model.Livro;
import livraria.model.Usuario;
import livraria.service.CompraService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/compra")
public class CompraController {

    @GetMapping("/adicionar/{codlivro}")
    public String adicionar(@PathVariable("codlivro")int codlivro, HttpSession sessao, Model model){
        boolean repetido = false;
        Compra carrinho = (Compra) sessao.getAttribute("carrinho");

        if(carrinho.getLivros().isEmpty()){
            carrinho.getLivros().add(new LivroDAO().getLivro(codlivro));
            System.out.println(carrinho.getLivros().get(0).getTitulo());
        }
        else{
            for(int i = 0; i < carrinho.getLivros().size(); i++){
                if(carrinho.getLivros().get(i).getCodlivro() == codlivro){
                    repetido = true;
                    break;
                }
            }
            if(!repetido){
                carrinho.getLivros().add(new LivroDAO().getLivro(codlivro));
            }
        }
        new CompraService().somarQuantidade(carrinho, codlivro);
        carrinho.setTotal(new CompraService().calcularTotal(carrinho));

        model.addAttribute("livros", new LivroDAO().getLivros());

        return "cliente/principal";
    }

    @GetMapping("/remover/{codlivro}")
    public String removerLivroCarrinho(@PathVariable("codlivro")int codlivro, HttpSession sessao, Model model){
        Compra carrinho = (Compra) sessao.getAttribute("carrinho");
        Livro livroRemover = null;
        for(Livro livro : carrinho.getLivros()){
            if(livro.getCodlivro() == codlivro){
                new CompraService().subtrairQuantidade(carrinho, codlivro);
                if(livro.getQuantidade() == 0){
                    livroRemover = livro;
                }
            }
        }
        if(livroRemover != null){
            carrinho.getLivros().remove(livroRemover);
        }
        carrinho.setTotal(new CompraService().calcularTotal(carrinho));
        model.addAttribute("carrinho", carrinho);
        return "/cliente/carrinho";
    }

    @GetMapping("/carrinho")
    public String carrinho(HttpSession sessao, Model model){
        Compra carrinho = (Compra) sessao.getAttribute("carrinho");
        model.addAttribute("carrinho", carrinho);
        return "/cliente/carrinho";
    }

    @GetMapping("/finalizarCompra")
    public String finalizarCompra(HttpSession sessao, Model model){
        Compra carrinho = (Compra) sessao.getAttribute("carrinho");
        Usuario usuario = (Usuario) sessao.getAttribute("usuario");

        new CompraDAO().cadastrarCompra(usuario, carrinho);
        sessao.setAttribute("carrinho", new Compra());
        model.addAttribute("livros", new LivroDAO().getLivros());

        return "cliente/principal";
    }

    @GetMapping("/historicoCliente")
    public String historicoCliente(HttpSession sessao, Model model){
        Usuario usuario = (Usuario) sessao.getAttribute("usuario");
        model.addAttribute("historico", new CompraDAO().getCompras(usuario));

        return "cliente/historicoCompras";
    }

    @GetMapping("/historicoFuncionario")
    public String historicoFuncionario(Model model){
        model.addAttribute("historico", new CompraDAO().getComprasParcial());

        return "funcionario/historicoVendas";
    }

    @GetMapping("detalhes/{codcompra}")
    public String detalhesCompra(Model model, @PathVariable("codcompra")int codcompra){
        model.addAttribute("compra", new CompraDAO().getCompra(codcompra));
        return "funcionario/detalhes";
    }
}

package livraria.controller;

import livraria.dao.LivroDAO;
import livraria.model.Livro;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequestMapping("/livro")
public class LivroController {

    @GetMapping("/listaLivros")
    public String listaLivros(Model model){
        model.addAttribute("livros", new LivroDAO().getLivros());
        return "funcionario/listaLivros";
    }

    @GetMapping("/cadastrar")
    public String cadastrarLivro(Model model){
        model.addAttribute("livro", new Livro());
        return "funcionario/cadastrarLivro";
    }

    @PostMapping("/confirmaCadastro")
    public String confirmarCadastrar(Model model, @ModelAttribute("livro")Livro livro){
        new LivroDAO().cadastrarLivro(livro);
        return "funcionario/listaLivros";
    }

    @GetMapping("/excluir/{codlivro}")
    public String excluirLivro(@PathVariable("codlivro")int codlivro, Model model){
        new LivroDAO().deletarLivro(codlivro);
        model.addAttribute("livros", new LivroDAO().getLivros());
        return "funcionario/listaLivros";
    }

    @GetMapping("/editar/{codlivro}")
    public String editarLivro(@PathVariable("codlivro")int codlivro, Model model){
        model.addAttribute("livro", new LivroDAO().getLivro(codlivro));
        return "funcionario/editarLivro";
    }

    @PostMapping("/confirmarEdicao")
    public String confirmarEdicao(@ModelAttribute("livro")Livro livro, Model model){
        new LivroDAO().editarLivro(livro);
        model.addAttribute("livros", new LivroDAO().getLivros());
        return "funcionario/listaLivros";
    }
}

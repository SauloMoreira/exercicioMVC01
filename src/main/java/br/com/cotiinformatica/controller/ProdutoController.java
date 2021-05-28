package br.com.cotiinformatica.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.cotiinformatica.dto.ProdutoCadastroDTO;
import br.com.cotiinformatica.dto.ProdutoConsultaDTO;
import br.com.cotiinformatica.entities.Produto;
import br.com.cotiinformatica.repositories.ProdutoRepository;

@Controller
public class ProdutoController {

	@Autowired // inicializar automaticamente!
	private ProdutoRepository produtoRepository;

	@RequestMapping("/produto-cadastrar")
	public ModelAndView cadastro() {

		// instanciando o objeto ModelAndView e definindo o nome da página
		// que será aberta por este método..
		ModelAndView modelAndView = new ModelAndView("produto-cadastrar");

		// enviando para a página o DTO que fará a coleta dos dados
		modelAndView.addObject("dto", new ProdutoCadastroDTO());

		return modelAndView; // segue para a página
	}

	@RequestMapping(value = "cadastrarProduto", method = RequestMethod.POST)
	public ModelAndView cadastrarProduto(ProdutoCadastroDTO dto) {

		ModelAndView modelAndView = new ModelAndView("produto-cadastrar");

		try {

			Produto produto = new Produto();
			produto.setNome(dto.getNomeProduto());
			produto.setQuantidade(dto.getQuantidadeProduto());
			produto.setPreco(dto.getPrecoProduto());
			produto.setDescricao(dto.getDescricaoProduto());
			produtoRepository.create(produto);
			modelAndView.addObject("mensagem_sucesso", "Produto cadastrado com sucesso!");

		} catch (Exception e) {

			modelAndView.addObject("mensagem_erro", "Erro ao cadastrar!" + e.getMessage());

		}

		modelAndView.addObject("dto", new ProdutoCadastroDTO());

		return modelAndView;

	}

	@RequestMapping("/produto-consultar")
	public ModelAndView consulta() {

		ModelAndView modelAndView = new ModelAndView("produto-consultar");
		try {
			modelAndView.addObject("listagem_produtos", produtoRepository.findAll());
		} catch (Exception e) {
			modelAndView.addObject("mensagem_erro", "Ocorreu um erro: " + e.getMessage());
		}
		modelAndView.addObject("dto", new ProdutoConsultaDTO());
		return modelAndView;
	}

	@RequestMapping(value = "consultarProdutos", method = RequestMethod.POST)
	public ModelAndView consultaProduto(ProdutoConsultaDTO dto) {
		ModelAndView modelAndView = new ModelAndView("produto-consultar");
		try {
			
			modelAndView.addObject("listagem_produtos", produtoRepository.findByPrecoRef(Double.parseDouble(dto.getPrecoref())));
		} catch (Exception e) {
			modelAndView.addObject("mensagem_erro", "Ocorreu um erro: " + e.getMessage());
		}
		modelAndView.addObject("dto", new ProdutoConsultaDTO());
		return modelAndView;
	}

	@RequestMapping("/produto-alterar")
	public String alteracao() {
		return "produto-alterar";
	}

	@RequestMapping("excluirProdutos")
	public ModelAndView exclusao(Integer id) {
		ModelAndView modelAndView = new ModelAndView("produto-consultar");
		try {
			Produto produto = produtoRepository.findById(id);
			produtoRepository.delete(produto);
			modelAndView.addObject("mensagem_sucesso", "Produto " + produto.getNome() + " excluído com sucesso.");
			modelAndView.addObject("listagem_produtos", produtoRepository.findAll());
		} catch (Exception e) {
			modelAndView.addObject("mensagem_erro", "Ocorreu um erro: " + e.getMessage());
		}
		modelAndView.addObject("dto", new ProdutoConsultaDTO());
		return modelAndView;
	}

}

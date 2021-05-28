package br.com.cotiinformatica.interfaces;

import java.util.List;

import br.com.cotiinformatica.entities.Produto;

public interface IProdutoRepository extends IBaseRepository<Produto> {
	List<Produto> findByPrecoRef(double prec)throws Exception;
}

package br.com.cotiinformatica.entities;

public class Produto {
	
	private Integer idProduto;
	private String nome;
	private Integer quantidade;
	private Double preco;
	private String descricao;
	public Produto() {
		// TODO Auto-generated constructor stub
	}
	public Produto(Integer idProduto, String nome, Integer quantidade, Double preco, String descricao) {
		super();
		this.idProduto = idProduto;
		this.nome = nome;
		this.quantidade = quantidade;
		this.preco = preco;
		this.descricao = descricao;
	}
	public Integer getIdProduto() {
		return idProduto;
	}
	public void setIdProduto(Integer idProduto) {
		this.idProduto = idProduto;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Integer getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}
	public Double getPreco() {
		return preco;
	}
	public void setPreco(Double preco) {
		this.preco = preco;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	@Override
	public String toString() {
		return "Produto [idProduto=" + idProduto + ", nome=" + nome + ", quantidade=" + quantidade + ", preco=" + preco
				+ ", descricao=" + descricao + "]";
	}
	
}

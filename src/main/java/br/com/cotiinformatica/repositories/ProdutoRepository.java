package br.com.cotiinformatica.repositories;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import br.com.cotiinformatica.entities.Produto;
import br.com.cotiinformatica.interfaces.IProdutoRepository;

public class ProdutoRepository implements IProdutoRepository {

	private JdbcTemplate jdbcTemplate;

	public ProdutoRepository(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void create(Produto entity) throws Exception {
		String sql = "insert into produto(nome, quantidade, preco, descricao) values(?,?,?,?)";
		Object[] params = { entity.getNome(), entity.getQuantidade(),entity.getPreco(), entity.getDescricao() };
		jdbcTemplate.update(sql, params);
	}

	@Override
	public void update(Produto entity) throws Exception {
		String sql = "Update produto set nome = ? , quantidade = ? , preco = ? , descricao = ?";
		Object[] params = { entity.getNome(), entity.getQuantidade(), entity.getPreco(), entity.getDescricao() };
		jdbcTemplate.update(sql, params);

	}

	@Override
	public void delete(Produto entity) throws Exception {

		String sql = "delete from produto where idproduto = ?";
		Object[] params = { entity.getIdProduto() };
		jdbcTemplate.update(sql, params);

	}

	@Override
	public List<Produto> findAll() throws Exception {
		String sql = "select * from produto order by nome";

		List<Produto> lista = jdbcTemplate.query(sql, new RowMapper<Produto>() {

			@Override
			public Produto mapRow(ResultSet rs, int rowNum) throws SQLException {
				return getProduto(rs);
			}

		});

		return lista;
	}

	@Override
	public Produto findById(Integer id) throws Exception {

		String sql = "select * from produto where idproduto = ?";

		Object[] params = { id };

		List<Produto> lista = jdbcTemplate.query(sql, params, new RowMapper<Produto>() {

			@Override
			public Produto mapRow(ResultSet rs, int rowNum) throws SQLException {
				return getProduto(rs);
			}

		});

		if (lista.size() == 1) { // verificando se o funcionario foi encontrado..
			return lista.get(0); // retornando o primeiro resultado obtido..
		}

		return null;
	}

	private Produto getProduto(ResultSet rs) throws SQLException {

		Produto produto = new Produto();

		produto.setIdProduto(rs.getInt("idproduto"));
		produto.setNome(rs.getString("nome"));
		produto.setQuantidade(rs.getInt("quantidade"));
		produto.setPreco(rs.getDouble("preco"));
		produto.setDescricao(rs.getString("descricao"));

		return produto;
	}

	@Override
	public List<Produto> findByPrecoRef(double prec) throws Exception {
		String sql = "select * from produto where preco <= ?";

		Object[] params = { prec };

		List<Produto> lista = jdbcTemplate.query(sql, params, new RowMapper<Produto>() {

			@Override
			public Produto mapRow(ResultSet rs, int rowNum) throws SQLException {
				return getProduto(rs);
			}

		});

		return lista;

	}
}

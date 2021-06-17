<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Produto Consultar</title>
<!-- Referencia para arquivos CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/jquery.dataTables.min.css" />
<!-- estilo CSS para o jquery validate -->
<style>
label.error { /* formatar as mensagens de erro do jquery validate */
	color: #d9534f;
}

select.error { /* formatar os campos com erro do jquery validate */
	border: 1px solid #d9534f;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Exercício Web 01</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown ">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/exercicioMVC01/home">Home</a></li>

					<li class="nav-item"><a class="nav-link"
						href="/exercicioMVC01/produto-consultar">Consutar</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/exercicioMVC01/produto-cadastrar">Cadastrar produto</a></li>

				</ul>
				
			</div>
			<form class="d-flex">
					<span class="text-white mt-3" style="margin-right: 20px;">
						${usuario_autenticado.nome} (${usuario_autenticado.email}) </span> <a
						href="/projetoSpringMVC01/logout"
						class="btn btn-outline-secondary mt-2"
						onclick="return confirm('Deseja realmente sair do sistema?')">
						Sair do Sistema </a>
				</form>
		</div>
	</nav>
	<div class="nav-scroller bg-body shadow-sm">
		<nav class="nav nav-underline">
			<p class="mt-3 ml-4">&nbsp;&nbsp;&nbsp;Exercício 01 Web - Sistema
				desenvolvido em Spring MVC com Spring JDBC, Bootstrap e JQuery</p>
		</nav>
	</div>

	<c:if test="${not empty mensagem_sucesso}">
		<!-- mensagem de sucesso -->
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<strong>Sucesso!</strong> ${mensagem_sucesso}
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</c:if>

	<c:if test="${not empty mensagem_erro}">
		<!-- mensagem de erro -->
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">
			<strong>Erro!</strong> ${mensagem_erro}
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</c:if>

	<div class="container-mt4">
		<br>
		<h5>Consulta de Produtos</h5>
		<hr>
		<form id="formconsulta" action="consultarProdutos" method="post">

			<label>Produtos a baixo de:</label>
			<div class="row">
				<div class="col-2">
					<input id="precoref" name="precoref" type="text"
						class="form-control" placeholder="Ex: 30,00" />
				</div>
				<div class="col-md-4">
					<input type="submit" value="Realizar Pesquisa"
						class="btn btn-success" />
				</div>
			</div>
		</form>
		<table id="tabelaprodutos" class="table table-striped">
			<thead>
				<tr>
					<th>Nome do Produto</th>
					<th>Quantidade</th>
					<th>Preço</th>
					<th>Descrição</th>
					<th>Operações</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listagem_produtos}" var="produto">
					<tr>
						<td>${produto.nome}</td>
						<td>${produto.quantidade}</td>
						<td><fmt:formatNumber value="${produto.preco}"
								type="currency" /></td>
						<td>${produto.descricao}</td>
						<td><a href="#" class="btn btn-primary btn-sm"> Editar </a> <a
							href="/exercicioMVC01/excluirProdutos?id=${produto.idProduto}"
							onclick="return confirm('Deseja realmente excluir o produto ${produto.nome}?');"
							class="btn btn-danger btn-sm"> Excluir </a>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">Quantidade de Produtos:
						${listagem_produtos.size()}</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<!-- Referencia para arquivos JS -->
	<script src="resources/js/bootstrap.min.js"></script>
	<!-- Referencia para o JQuery -->
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	<!-- Referencias para o JQuery validate -->
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/messages_pt_BR.min.js"></script>
	<!-- Referencia para o JQuery datatable -->
	<script src="resources/js/jquery.dataTables.min.js"></script>
	<script>
		//quando a página for carregada, faça..
		$(document)
				.ready(
						function() { //page load, start..

							//aplicando validação ao formulário..
							$("#formconsulta").validate({
								//regras de validação..
								rules : {
									"precoref" : {
										required : true
									},

								}
							});

							//aplicando a formatação do datatable
							$("#tabelaprodutos")
									.DataTable(
											{
												language : {
													url : '//cdn.datatables.net/plug-ins/1.10.24/i18n/Portuguese-Brasil.json'
												}
											});

						})
	</script>
</body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastrar Produto</title>
<!-- Referencia para arquivos CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />


<!-- estilo CSS para o jquery validate -->
<style>
label.error { /* formatar as mensagens de erro do jquery validate */
	color: #d9534f;
}

input.error { /* formatar os campos com erro do jquery validate */
	border: 1px solid #d9534f;
}

textarea.error { /* formatar os campos com erro do jquery validate */
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
			<p class="mt-3 ml-4">&nbsp;&nbsp;&nbsp;Cadastro de Produtos</p>
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


	<div class="container mt-4">
		<form id="formcadastro" action="cadastrarProduto" method="post">

			<div class="col-md-4">
				<div class="row">
					<label>Nome do Produto:</label>
					<form:input path="dto.nomeProduto" id="nomeProduto"
						name="nomeProduto" type="text" class="form-control"
						placeholder="Ex: produto xyz" />
					<br /> <label>Quantidade:</label>
					<form:input path="dto.quantidadeProduto" id="quantidadeProduto"
						name="quantidadeProduto" type="text" class="form-control"
						placeholder="Ex: 30" />
					<br /> <label>Preço:</label>
					<form:input path="dto.precoProduto" id="precoProduto"
						name="precoProduto" type="text" class="form-control"
						placeholder="Ex: 30,00" />
					<br /> <label>Descrição:</label>
					<form:textarea path="dto.descricaoProduto" id="descricaoProduto"
						name="descricaoProduto" class="form-control"
						aria-label="Descrição:"
						placeholder="Ex: produto contém xyz e faz abc"></form:textarea>
					<br />
				</div>

			</div>
			<br />
			<div class="row">
				<div class="col-md-4">

					<div class="d-grid gap-2">
						<button class="btn btn-success" type="submit">Realizar
							Cadastro</button>
					</div>

				</div>
			</div>

		</form>
	</div>
	<!-- Referencia para arquivos JS -->
	<script src="resources/js/bootstrap.min.js"></script>

	<!-- Referencia para o JQuery -->
	<script src="resources/js/jquery-3.6.0.min.js"></script>

	<!-- Referencia para o JQuery Masked Input -->
	<script src="resources/js/jquery.maskedinput.min.js"></script>

	<!-- Referencias para o JQuery validate -->
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/messages_pt_BR.min.js"></script>


	<script>
		//quando a página for carregada, faça..
		$(document).ready(function() { //page load, start..
			//aplicando máscara nos campos do formulário..
			$("#preco").mask("99.99");
			//aplicando validação ao formulário..
			$("#formcadastro").validate({
				//regras de validação..
				rules : {
					"nomeProduto" : {
						required : true,
						minlength : 6,
						maxlength : 150
					},
					"precoProduto" : {
						required : true
					},
					"quantidadeProduto" : {
						required : true
					},
					"descricaoProduto" : {
						required : true,
						minlength : 6,
						maxlength : 150
					}
				}
			});

		})
	</script>
</body>
</html>
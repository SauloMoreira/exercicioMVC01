<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Exercício Web 01</title>

<!-- Referencia para arquivos CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
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
						aria-current="page" href="/exercicioMVC01/">Home</a></li>

					<li class="nav-item"><a class="nav-link"
						href="/exercicioMVC01/produto-consultar">Consutar</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/exercicioMVC01/produto-cadastrar">Cadastrar produto</a></li>	
					
				</ul>
			</div>
		</div>
	</nav>
	<div class="nav-scroller bg-body shadow-sm">
		<nav class="nav nav-underline">
			<p class="mt-3 ml-4">&nbsp;&nbsp;&nbsp;Exercício 01 Web - Sistema
				desenvolvido em Spring MVC com Spring JDBC, Bootstrap e JQuery</p>
		</nav>
	</div>
	<div class="container mt-4">
		<h3>Seja bem vindo ao Exercício 01 Web!</h3>
	</div>


	<!-- Referencia para arquivos JS -->
	<script src="resources/js/bootstrap.min.js"></script>

</body>
</html>

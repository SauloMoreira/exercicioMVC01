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
			<p class="mt-3 ml-4">&nbsp;&nbsp;&nbsp;Sistema desenvolvido em
				Spring MVC com Spring JDBC, Bootstrap e JQuery</p>
		</nav>
	</div>



	<!-- Referencia para arquivos JS -->
	<script src="resources/js/bootstrap.min.js"></script>

	<!-- Referencia do JQuery -->
	<script src="resources/js/jquery-3.6.0.min.js"></script>

	<!-- Referencia dos arquivos do Highcharts -->
	<script src="resources/js/highcharts.js"></script>
	<script src="resources/js/highcharts-3d.js"></script>
	<script src="resources/js/exporting.js"></script>
	<script src="resources/js/export-data.js"></script>

	

</body>
</html>

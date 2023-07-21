<%--
  Created by IntelliJ IDEA.
  User: gande
  Date: 16/06/2023
  Time: 04:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Livros</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/akasha/funcionario/principal">Akasha Livraria</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/akasha/funcionario/principal">Inicio</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/akasha/livro/listaLivros">Livros</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/akasha/cliente/listaUsuarios">Clientes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/akasha/compra/historicoFuncionario">Vendas</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${usuario.nome}
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/akasha/usuario/editarPerfil">Editar Perfil</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/akasha/login/sair">Sair</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
<h1 class="text-center mb-3">Bem vindo a Akasha Livraria</h1>
<div class="container">
    <div class="row">
        <c:forEach var="l" items="${livros}">
            <div class="col">
                <div class="card">
                    <img class="card-img-top" style="height: 15vw;" src="${l.urlimg}" alt="Livro">
                    <div class="card-body text-center">
                        <h5 class="card-title">${l.titulo}</h5>
                        <p class="card-text">Autor: ${l.autor}<br>Categoria: ${l.categoria}<br>Editora: ${l.editora}<br>Preço: ${l.valor}</p>
                        <a class="btn btn-danger" href="/akasha/livro/excluir/${l.codlivro}">Excluir<i class="m-1 fas fa-trash-alt"></i></a>
                        <a class="btn btn-primary" href="/akasha/livro/editar/${l.codlivro}">Editar<i class="m-1 fas fa-edit"></i></a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

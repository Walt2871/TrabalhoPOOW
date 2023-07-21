<%--
  Created by IntelliJ IDEA.
  User: gande
  Date: 23/06/2023
  Time: 02:35
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
    <a class="navbar-brand" href="/akasha/cliente/principal">Akasha Livraria</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/akasha/cliente/principal">Inicio</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/akasha/compra/carrinho"><i class="fas fa-shopping-cart"></i></a>
            </li>
        </ul>
        <ul class="navbar-nav">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${usuario.nome}
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/akasha/cliente/editarPerfil">Editar Perfil</a>
                    <a class="dropdown-item" href="/akasha/compra/historicoCliente">Histórico de Compras</a>
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
                    <img class="card-img-top" style="width: 100%;height: 15vw;object-fit: cover;" src="${l.urlimg}" alt="Livro">
                    <div class="card-body text-center">
                        <h5 class="card-title">${l.titulo}</h5>
                        <p class="card-text">Autor: ${l.autor}<br>Categoria: ${l.categoria}<br>Editora: ${l.editora}<br>Preço: R$${l.valor}</p>
                        <a href="/akasha/compra/adicionar/${l.codlivro}" class="btn btn-primary">Adicionar ao carrinho</a>
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

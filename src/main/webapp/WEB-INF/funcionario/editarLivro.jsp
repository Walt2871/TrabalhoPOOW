<%--
  Created by IntelliJ IDEA.
  User: gande
  Date: 16/07/2023
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<html>
<head>
  <title>Editar Livro</title>
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
      <li class="nav-item active">
        <a class="nav-link" href="/akasha/funcionario/principal">Inicio</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/akasha/livro/listaLivros">Livros</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/akasha/cliente/listaUsuarios">Clientes</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/akasha/compra/historicoFuncionario">Vendas</a>
      </li>
    </ul>
    <ul class="navbar-nav">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ${usuario.nome}
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/akasha/login/sair">Sair</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
<h1 class="text-center mb-3">Editar livro</h1>
<div class="container">
  <div class="row justify-content-center">
      <div class="col-4 text-center">
          <img style="height: 15vw" src="${livro.urlimg}" alt="Livro"><br>
            <form:form action="/akasha/livro/confirmarEdicao" method="post" modelAttribute="livro">
              <div class="form-group">
                <form:label path="titulo" for="titulo">Titulo: </form:label>
                <form:input class="form-control" path="titulo" id="titulo" name="titulo" type="text" value="${livro.titulo}"/>
              </div>
              <div class="form-group">
                <form:label path="valor" for="valor">Valor: </form:label>
                <form:input class="form-control" path="valor" id="valor" name="valor" type="number" value="${livro.valor}"/>
              </div>
              <div class="form-group">
                <form:label path="autor" for="autor">Autor: </form:label>
                <form:input class="form-control" path="autor" id="autor" name="autor" type="text" value="${livro.autor}"/>
              </div>
              <div class="form-group">
                <form:label path="editora" for="editora">Editora: </form:label>
                <form:input class="form-control" path="editora" id="editora" name="editora" type="text" value="${livro.editora}"/>
              </div>
              <div class="form-group">
                <form:label path="categoria" for="categoria">Categoria: </form:label>
                <form:input class="form-control" path="categoria" id="categoria" name="categoria" type="text" value="${livro.categoria}"/>
              </div>
              <div class="form-group">
                <form:label path="urlimg" for="urlimg">URL da imagem: </form:label>
                <form:input class="form-control" path="urlimg" id="urlimg" name="urlimg" type="text" value="${livro.urlimg}"/>
              </div>
              <form:input path="codlivro" value="${livro.codlivro}" type="hidden"></form:input>
              <button class="btn btn-primary" type="submit">Editar Livro</button>
            </form:form>
      </div>
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

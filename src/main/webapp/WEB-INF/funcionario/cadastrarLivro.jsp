<%--
  Created by IntelliJ IDEA.
  User: gande
  Date: 20/07/2023
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro de Livro</title>
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
    </ul>
  </div>
</nav>
<div class="container text-center">
  <h1 class="m-3">Cadastro de Livro</h1>
  <div class="row justify-content-center">
    <div class="col-3 bg-light shadow mb-2">
      <form:form action="/akasha/livro/confirmaCadastro" method="post" modelAttribute="livro">
        <div class="form-group mt-2">
          <form:label path="titulo" for="titulo">Titulo: </form:label>
          <form:input class="form-control" path="titulo" id="titulo" name="titulo" type="text"/> <br>
        </div>
        <div class="form-group">
          <form:label path="valor" for="valor">Valor: </form:label>
          <form:input class="form-control" path="valor" id="valor" name="valor" type="number"/> <br>
        </div>
        <div class="form-group">
          <form:label path="autor" for="autor">Autor: </form:label>
          <form:input class="form-control" path="autor" id="autor" name="autor" type="text"/> <br>
        </div>
        <div class="form-group">
          <form:label path="categoria" for="categoria">Categoria: </form:label>
          <form:input class="form-control" path="categoria" id="categoria" name="categoria" type="text"/> <br>
        </div>
        <div class="form-group">
          <form:label path="editora" for="editora">Editora: </form:label>
          <form:input class="form-control" path="editora" id="editora" name="editora" type="text"/> <br>
        </div>
        <div class="form-group">
          <form:label path="urlimg" for="urlimg">URL da imagem: </form:label>
          <form:input class="form-control" path="urlimg" id="urlimg" name="urlimg" type="text"/> <br>
        </div>
        <button class="btn btn-primary" type="submit">Cadastrar</button>
      </form:form>
    </div>
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

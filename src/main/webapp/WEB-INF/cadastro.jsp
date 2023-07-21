<%--
  Created by IntelliJ IDEA.
  User: gande
  Date: 19/07/2023
  Time: 21:38
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
  <title>Cadastro</title>
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
  <h1 class="m-3">Cadastro</h1>
  <div class="row justify-content-center">
    <div class="col-3 bg-light shadow mb-2">
      <form:form action="/akasha/cliente/confirmarCadastro" method="post" modelAttribute="usuario">
        <div class="form-group mt-2">
          <form:label path="nome" for="nome">Nome: </form:label>
          <form:input class="form-control" path="nome" id="nome" name="nome" type="text"/> <br>
        </div>
        <div class="form-group">
          <form:label path="cpf" for="cpf">CPF: </form:label>
          <form:input class="form-control" path="cpf" id="cpf" name="cpf" type="text"/> <br>
        </div>
        <div class="form-group">
          <form:label path="senha" for="senha">Senha: </form:label>
          <form:input class="form-control" path="senha" id="senha" name="senha" type="password"/> <br>
        </div>
        <div class="form-group">
          <form:label path="email" for="email">Email: </form:label>
          <form:input class="form-control" path="email" id="email" name="email" type="text"/> <br>
        </div>
        <div class="form-group">
          <form:label path="celular" for="celular">Celular: </form:label>
          <form:input class="form-control" path="celular" id="celular" name="celular" type="text"/> <br>
        </div>
        <form:input path="funcionario" value="FALSE" type="hidden"></form:input>
        <button class="btn btn-primary" type="submit">Cadastrar-se</button>
      </form:form>
    </div>
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

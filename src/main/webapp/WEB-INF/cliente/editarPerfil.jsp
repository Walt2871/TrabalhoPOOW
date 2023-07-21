<%--
  Created by IntelliJ IDEA.
  User: gande
  Date: 20/07/2023
  Time: 01:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<html>
<head>
  <title>Editar Perfil</title>
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
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="/akasha/compra/carrinho"><i class="fas fa-shopping-cart"></i></a>
      </li>
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
<h1 class="text-center mb-3">Editar Perfil</h1>
<div class="container">
  <div class="row justify-content-center">
    <div class="col-4 text-center">
      <form:form action="/akasha/cliente/confirmarEdicao" method="post" modelAttribute="usuario">
        <div class="form-group">
          <form:label path="nome" for="nome">Nome: </form:label>
          <form:input class="form-control" path="nome" id="nome" name="nome" type="text" value="${usuario.nome}"/>
        </div>
        <div class="form-group">
          <form:label path="email" for="email">Email: </form:label>
          <form:input class="form-control" path="email" id="email" name="email" type="text" value="${usuario.email}"/>
        </div>
        <div class="form-group">
          <form:label path="celular" for="celular">Celular: </form:label>
          <form:input class="form-control" path="celular" id="celular" name="celular" type="text" value="${usuario.celular}"/>
        </div>
        <div class="form-group">
          <form:label path="senha" for="senha">Senha: </form:label>
          <form:input class="form-control" path="senha" id="celular" name="senha" type="password" value="${usuario.senha}"></form:input>
        </div>
        <form:input path="cpf" value="${usuario.cpf}" type="hidden"></form:input>
        <form:input path="codusuario" value="${usuario.codusuario}" type="hidden"></form:input>
        <button class="btn btn-primary" type="submit">Editar Perfil</button>
      </form:form>
    </div>
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

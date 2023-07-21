<%--
  Created by IntelliJ IDEA.
  User: gande
  Date: 20/07/2023
  Time: 03:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<html>
<head>
  <title>Detalhes da Compra</title>
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
<div class="container">
  <h1 class="text-center my-4">Produtos da Compra</h1>
      <div class="row">
        <div class="col text-center">
            <table class="table text-center">
              <thead class="table-dark">
              <tr>
                <th scope="col">Foto</th>
                <th scope="col">Titulo</th>
                <th scope="col">Quantidade</th>
                <th scope="col">Preço</th>
                <th scope="col">Autor</th>
                <th scope="col">Editora</th>
                <th scope="col">Categoria</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="l" items="${compra.livros}">
                <tr>
                  <th scope="row"><img class="m-0" src="${l.urlimg}" style="height: 6vw" alt="Livro"></th>
                  <td class="align-middle">${l.titulo}</td>
                  <td class="align-middle">${l.quantidade}</td>
                  <td class="align-middle">${l.valor*l.quantidade}</td>
                  <td class="align-middle">${l.autor}</td>
                  <td class="align-middle">${l.editora}</td>
                  <td class="align-middle">${l.categoria}</td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          <a href="/akasha/compra/historicoFuncionario" class="btn btn-primary text-center">Voltar</a>
        </div>
      </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

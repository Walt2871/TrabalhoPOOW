<%--
  Created by IntelliJ IDEA.
  User: gande
  Date: 16/07/2023
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<html>
<head>
  <title>Carrinho de Compras</title>
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
        <c:choose>
          <c:when test="${empty carrinho.livros}">
          <div class="row h-75">
            <div class="col align-self-center text-center">
              <div class="bg-light shadow p-4">
                <h2 class="text-center">Nenhum item no carrinho</h2>
                <a href="/akasha/cliente/principal" class="btn btn-primary m-3">Voltar à pagina inicial</a>
              </div>
            </div>
          </div>
          </c:when>
          <c:otherwise>
          <div class="row">
            <div class="col">
              <table class="table text-center">
                <thead class="table-dark">
                <tr>
                  <th scope="col">Foto</th>
                  <th scope="col">Titulo</th>
                  <th scope="col">Quantidade</th>
                  <th scope="col">Preço</th>
                  <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="l" items="${carrinho.livros}">
                  <tr>
                    <th scope="row"><img class="m-0" src="${l.urlimg}" style="height: 6vw" alt="Livro"></th>
                    <td class="align-middle">${l.titulo}</td>
                    <td class="align-middle">${l.quantidade}</td>
                    <td class="align-middle">R$${l.valor*l.quantidade}</td>
                    <td class="align-middle"><a class="btn btn-outline-secondary p-1 mr-1" href="/akasha/compra/remover/${l.codlivro}"><i class="fa fa-minus-square"></i></a><a class="btn btn-outline-secondary p-1" href="/akasha/compra/adicionar/${l.codlivro}"><i class="fa fa-plus-square"></i></a></td>
                  </tr>
                </c:forEach>
                </tbody>
                <tfoot class="table-dark">
                <tr>
                  <th class="text-right" colspan="4">Valor total:</th>
                  <th>R$${carrinho.total}</th>
                </tr>
                </tfoot>
              </table>
              <div class="row text-center">
                <div class="col">
                  <a href="/akasha/compra/finalizarCompra" class="btn btn-success mb-2">Finalizar Compra</a>
                </div>
              </div>
            </div>
          </div>
          </c:otherwise>
        </c:choose>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

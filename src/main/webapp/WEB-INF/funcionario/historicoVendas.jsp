<%--
  Created by IntelliJ IDEA.
  User: gande
  Date: 20/07/2023
  Time: 02:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<html>
<head>
  <title>Historico de Vendas</title>
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
      <li class="nav-item active">
        <a class="nav-link" href="/akasha/compra/historicoFuncionario">Vendas</a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
    </ul>
    <ul class="navbar-nav">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ${usuario.nome}
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/akasha/funcionario/editarPerfil">Editar Perfil</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="/akasha/login/sair">Sair</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
<div class="container">
  <c:choose>
    <c:when test="${empty historico}">
      <div class="row h-75">
        <div class="col align-self-center text-center">
          <div class="bg-light shadow p-4">
            <h2 class="text-center">Nenhuma compra realizada</h2>
            <a href="/akasha/funcionario/principal" class="btn btn-primary m-3">Voltar à pagina inicial</a>
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
                <th scope="col">Cliente</th>
                <th scope="col">Total</th>
                <th scope="col">Mais informações</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="c" items="${historico}">
                <tr>
                  <td class="align-middle">${c.cliente.nome}</td>
                  <td class="align-middle">${c.total}</td>
                  <td class="align-middle"><a class="btn btn-outline-secondary p-1 mr-1" href="/akasha/compra/detalhes/${c.codCompra}"><i class="fa fa-plus-square"></i></a></td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
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

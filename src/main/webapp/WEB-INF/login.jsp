<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/akasha/">Akasha Livraria</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/akasha/">Inicio</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container text-center">
    <h1 class="m-3">Faça login</h1>
    <div class="row justify-content-center">
        <div class="col-3 bg-light shadow">
            <form:form action="/akasha/login/logar" method="post" modelAttribute="usuario">
                <div class="form-group mt-2">
                    <form:label path="cpf" for="cpf">CPF: </form:label>
                    <form:input class="form-control" path="cpf" id="cpf" name="cpf" type="text"/> <br>
                </div>
                <div class="form-group">
                    <form:label path="senha" for="senha">Senha: </form:label>
                    <form:input class="form-control" path="senha" id="senha" name="senha" type="password"/> <br>
                </div>
                <input  class="btn btn-primary" type="submit" value="Entrar"> <br> <br>
                <a href="/akasha/cliente/cadastro">Cadastrar-se</a>
            </form:form>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

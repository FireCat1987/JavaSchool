<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Деканат итис</title>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/tether/1.2.0/tether.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
          crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"
            crossorigin="anonymous"></script>

    <style>
        body {
            background-color: #eceeef;
        }
        .form-signin {
            max-width: 530px;
            padding: 15px;
            margin: 0 auto;
        }
        .form-signin {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-light">

        <a href="/students" class="btn btn-outline-danger float-lg-right">Список студентов</a>
        <a href="/registration" class="btn btn-outline-danger float-lg-right">Регистрация</a>

</nav>
<div class="container">
    <c:if test="${error != null}">
        <div class="alert alert-danger" role="alert">
            <p>Вы что-то ввели не так!</p>
        </div>

    </c:if>
<%--    <form class="login-form" action="j_spring_security_check" method="post">
        <label for="j_username">Username: </label>
        <input id="j_username" name="j_username" size="20" maxlength="50" type="text" />

        <label for="j_password">Password: </label>
        <input id="j_password" name="j_password" size="20" maxlength="50" type="password" />

        <input type="submit" value="Login" />
    </form>--%>


    <form:form action="/login" method="post" modelAttribute="users" cssClass="form-signin">
        <h2 class="form-signin-heading">Введите логин и пароль!</h2>

        <table>
            <tr>
                <td><form:label path="login">Логин</form:label></td>
                <td><form:input path="login"/></td>
                <td><form:errors path="login"/></td>
            </tr>
            <tr>
                <td><form:label path="password">Пароль</form:label></td>
                <td><form:password path="password" /></td>
                <td><form:errors path="password"/></td>
            </tr>

        </table>
        <input type="submit" value="save"/>
    </form:form>

</div>
</body>
</html>

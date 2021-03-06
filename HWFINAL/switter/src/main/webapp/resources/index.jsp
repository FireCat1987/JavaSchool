<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Деканат итис</title>
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/tether/1.2.0/tether.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
          crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"
            crossorigin="anonymous"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-colorpicker/2.3.6/css/bootstrap-colorpicker.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-colorpicker/2.3.6/js/bootstrap-colorpicker.min.js"></script>
    <%--<script src="<c:url value="/resources/js/main.js"/>"></script>--%>

    <style>
        body {
            background-color: #eceeef;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-light">

</nav>

<h1> HELLO WORLD </h1>
<input type="text" id="data"/>
<a id="post" href="#">POST</a>
<a id="get" href="#">GET</a>

<div id="container"></div>
<script>
    $('#get').click(function () {
        $.ajax({
            type: "GET",
            cache: false,
            url: '/getRandomData',
            data: "",
            success: function (response) {
                var html = "";
                $.each(response.data, function (i) {
                    html = html + response.data[i] + "<br/>";
                });
                $('#container').html(html);
            }
        });
    });

    $('#post').click(function () {
        if (!$("#data").val()) {
            alert("Enter your data!");
        } else {
            $.ajax({
                type: "POST",
                cache: false,
                url: '/persist',
                data: {
                    'data': $("#data").val()
                },
                success: function (response) {
                    $('#get').click();
                }
            });
        }

    });

</script>

<%--<div class="container">
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-3">Управление студентами итис!</h1>
            <p class="lead">Здесь вы можете увидеть список всех студентов с возможностью добавления и удаления студентам оценок.</p>
            <p class="lead">
                <a class="btn btn-primary btn-lg" href="/students" role="button">К списку студентов.</a>
            </p>
        </div>
    </div>

</div>--%>
</body>
</html>

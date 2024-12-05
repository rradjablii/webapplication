<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <h1>Registration</h1>
    <form action="/registration" method="post" enctype="multipart/form-data">
        name: <input type="text" name="name"><br><br>
        email: <input type="email" name="email"><br><br>
        phone number: <input type="text" name="phoneNumber"><br><br>
        password: <input type="password" name="password"><br><br>
        avatar: <input type="file" name="avatar">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="register">
    </form>

<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>

</body>
</html>
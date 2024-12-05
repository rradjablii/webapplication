<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Products-detailed</title>
</head>
<body>
    <h3>Detailed information about products</h3>

    <#list images as image>
        <img src="/images/${image.id}" height="60px" alt=""><br><br>
    </#list>
    <b>Title:</b>${product.title}<br><br>
    <b>description:</b>${product.description}<br><br>
    <b>price:</b>${product.price}<br><br>
    <b>author:</b><a href="/user/${product.user.id}">${product.user.name}</a><br><br>
    <b>city:</b>${product.city}<br><br>
</body>
</html>
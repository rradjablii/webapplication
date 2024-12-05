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
<h1>User Info</h1>
<b>Phone Number:</b> ${user.phoneNumber}<br>
<b>email:</b> ${user.email}<br>
<b>products of: </b>${user.username}
<#list products as product>
    <div>
        <p><b>${product.title}</b${product.price}$ | <a href="/product/${product.id}"></a></p>
    </div>
<#else>
    <h3>No Products</h3>
</#list>
</body>
</html>
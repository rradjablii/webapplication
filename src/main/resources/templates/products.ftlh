<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Products</title>
</head>
<body>
<h1>WebShop</h1>
<hr>
<#if user.email??>
    <h3>username: ${user.name}</h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="logout">
    </form>
<#else>
    <a href="/login">Login</a>
</#if>
<hr>

<form action="/" method="get">
    Search by title: <input type="text" name="title"><br>
    <input type="submit" , value="search">
</form>

<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} | <a href="/product/${product.id}">More...</a></p>
    </div>
</#list>
<hr>
<#if user.email??>
    <h3>Create new Product</h3>
    <form action="/product/create" method="post" enctype="multipart/form-data">
        advertisement name: <input type="text" name="title"/><br><br>
        description: <input type="text" name="description"/><br><br>
        price: <input type="text" name="price"/><br><br>
        city: <input type="text" name="city"/><br><br>
        preview image: <input type="file" name="file1">
        second photo: <input type="file" name="file2">
        third photo: <input type="file" name="file3">

        <input type="hidden" name="_csrf" value="_csrf.token">
        <input type="submit" value="Add Product">
    </form>
</#if>

</body>
</html>
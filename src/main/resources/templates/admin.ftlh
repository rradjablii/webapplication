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
    <h1>Admin panel</h1>
    <table>
        <tr>
            <th>Email</th>
            <th>Phone Number</th>
            <th>Roles</th>
            <th>Ban</th>
            <th>editing</th>
            <th>Detailed information</th>
        </tr>
        <#list users as user>
            <tr>
                <th>${user.email}</th>
                <th>${user.phoneNumber}</th>
                <th><#list user.roles as role>${role}<#sep>, </#list></th>
                <th>
                    <form action="/admin/user/ban/${user.id}">
                        <input type="_csrf" value="_csrf.token">
                        <input type="submit" value="ban">
                    </form>
                </th>
                <th><a href="/admin/user/edit/${user.id}">Editing</a></th>
                <th><a href="/user/${user.id}">Detailed</a></th>
            </tr>
        </#list>
    </table>
</body>
</html>
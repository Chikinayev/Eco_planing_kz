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
    <h1>Web market </h1> <hr>

    <#if user.email??>
        <h3> Имя пользавателя <i>${user.name}</i></h3>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Выйти" />
        </form>
        <#if user.isAdmin()>
            <a href="/admin">Панель администратора</a>
        </#if>
    <#else >
        <a href="/login"> Enter </a>
    </#if>

    <h4>Facilities and products from Kazakhstan</h4>
    <form action="/" method="get">
        Search by title advert:<input type="text" name="title"><br>
        <input type="submit" value="search" />
    </form>

    <#list products as product>
        <div>
            <p>
                <b>
                    ${product.title}
                </b>
                ${product.price} тенге | <a href="/product/${product.id}">Подробнее ...</a>
            </p>
        </div>
        <#else >
            <h4>No products</h4>
    </#list>
    <#if user.email??>
        <hr>
        <h3>Создать новый товар</h3>
        <form action="product/create" method="post" enctype="multipart/form-data">
            Название объявления: <input type="text" name="title"><br><br>
            Описание объявления: <input type="text" name="description"/><br><br>
            Цена: <input type="number" name="price"/><br><br>
            Город: <input type="text" name="city"/><br><br>
            Имя: <input type="text" name="author"/><br><br>
            Первая фотография: <input type="file" name="file1"/><br><br>
            Вторая фотография: <input type="file" name="file2"/><br><br>
            Третья фотографи: <input type="file" name="file3"/><br><br>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="добавить товар" />

        </form>
    </#if>
</body>
</html>
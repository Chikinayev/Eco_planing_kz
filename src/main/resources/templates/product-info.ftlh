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
<h1>Web market</h1>
<h4>Full description about product</h4>
<b>Product's name:</b>${product.title}<br>
<b>Product's description:</b>${product.description}<br>
<b>Price:</b>${product.price}<br>
<b>City:</b>${product.city}<br>
<b>Author:</b>${product.author}<br>

<hr>
<h3>Создать новый товар</h3>
<form action="/delete/${product.id}" method="post">

    <input type="submit" value="delete a product" />
</form>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HashPassword</title>
</head>
<body>
<p><strong>Пароль:</strong>
    <input type="password" id="Password" maxlength="25" size="40" name="password"></p>
<p><strong>"Соль":</strong>
    <input id="Salt" maxlength="25" size="40" name="login"></p>
<p><strong>Алгоритм:</strong>
    <select id="Algorithm">
        <option>MD5</option>
        <option>SHA-1</option>
        <option>SHA-256</option>
    </select>
</p>
<p style="text-align: left">
    <button id="generation">Генерация</button>
</p>
<p><strong>Хэш:</strong>
    <input id="Hash" maxlength="25" size="40" name="login"></p>

<script src="js\jquery-2.2.0.js"></script>
<script>
    $(document).ready(function () {
        $('#generation').click(function () {
            var alg = $('#Algorithm').val();
            var password = $('#Password').val();
            var salt = $('#Salt').val();
            $.ajax({
                type: 'POST',
                data: {
                    password: password,
                    salt: salt,
                    alg: alg
                },
                url: 'getHash',
                success: function (result) {
                    var hash = result ? result : "";
                    $('#Hash').val(hash);
                }
            })
        });
    });
</script>

</body>
</html>

<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    %{--<link rel="stylesheet" type="text/css" href="css/styles.css">--}%
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/stylesheets', file: 'login_styles.css')}">
</head>

<body>
<div class="htmleaf-container">
    <div class="wrapper" style="height: 100%;margin-top: -320px;">
        <div class="container" style="margin-top: 100px;">
            <h1 id="login_info">Welcome</h1>

            <form class="form" id="login_form">
                <input type="text" id="login_username" placeholder="Username">
                <input type="password" id="login_password" placeholder="Password">
                <button type="submit" id="login-button" onclick="loginAction()">Login</button>
            </form>
        </div>

        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>

%{--<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>--}%
<script src="${resource(dir: 'assets/javascripts', file: 'jquery-2.2.0.min.js')}" type="text/javascript"></script>
<script>

    //TODO 动画优化
    $('#login-button').click(function (event) {
            console.log("button click");
            event.preventDefault();
            $('form').fadeOut(500);
            $('.wrapper').addClass('form-success');

    });

    function loginAction() {
        console.log("loginAction");

        var name = $("#login_username").val();
        var pwd = $("#login_password").val();

        if (name == "" || name == null || pwd == "" || pwd == null) {
            //用户名密码为空 显示警告 置空name pwd
            document.getElementById("login_info").innerHTML = "用户名密码为空！";
        } else {
            $.post("/adminUser/login", {username: name, password: pwd}, function (dData) {
                console.log(dData.backCode);
                console.log(dData.backMessage);

                var start=Date.now();
                if (dData.backCode == 1 || dData.backCode == "1") {
//                    document.getElementById("login_form").style.display="none";
//                    while(Date.now() - start <= 3000);//休眠1秒 跳转新页面
                    window.location.href="webTwo";
                }else {
                    document.getElementById("login_info").innerHTML = dData.backMessage;
                    $("#login_username").val("");
                    $("#login_password").val("");
//                    while(Date.now() - start <= 500);//休眠1秒 重新刷新
//                    location.reload();
                }
            }, "json");
        }

    }


</script>

</body>
</html>
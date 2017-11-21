--${firstName}

<script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>

<br/>
<input type="text" id="login_username"/>
<br/>
<input type="password" id="login_password"/>
<br/>
<button id="loginBtn" onclick="login();">登录</button>

<script>

    function login() {

        console.log("aaaa");

        var name=$("#login_username").val();
        var pwd=$("#login_password").val();

        $.post("/adminUser/login", {username: name, password: pwd}, function (dData) {
            console.log(dData.backCode);
            console.log(dData.backMessage);
        }, "json");

    }

</script>
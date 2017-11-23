package grails.second

import grails.converters.JSON

class AdminUserController {
    static namespace = "login"

    def adminUserService

    def index() {
        println("login-index")
    }

    /**
     *  Method Name : login
     *  Description : 登录处理
     *  Parameter   : username password
     *  Return      : backCode 是否成功  BackMessage 返回的信息
     *  Date        : 2017/11/20 17:08
     */
    def login() {
        //todo 密码加密
        println("login params:" + params.username + " " + params.password)

        def backCode        // 是否成功登录
        def backMessage     // 返回的信息

        if (params.username == "" || params.username == null || params.password == "" || params.password == null) {
            backCode=0
            backMessage="用户名密码为空！"
        }else {
            def user=AdminUser.findByAd_username(params.username)

            if (user == null){
                backCode=0
                backMessage="用户不存在！"
            }else if (user.ad_password==params.password){
                backCode=1
                backMessage="登录成功"

                //session记录
                session.setAttribute("username",params.username)
                session.setAttribute("userID",user.id)
                session.setAttribute("userNumber",user.ad_number)

            }else {
                backCode=0
                backMessage="密码错误！"
            }
        }

        // 返回处理
//        render(contentType: "application/json") {
//            def result = ["backCode":backCode,"backMessage":backMessage]
//            render result as JSON
//        }

        def result=["backCode":backCode,"backMessage":backMessage]

        render result as JSON

    }

    def aa(){
        println("dashboard")
    }

    def webTwo(){
        println("webTwo")
    }

    def addNew() {
        def one = new AdminUser()

        one.ad_username = "mazhen619"
        one.ad_password = "10335a"
        one.ad_number = "007"
        one.ad_status = 1

        adminUserService.save(one)

    }

    def editUser() {
        def one = AdminUser.last()
        one.ad_password = "1033516561"

        adminUserService.save(one)
    }
}

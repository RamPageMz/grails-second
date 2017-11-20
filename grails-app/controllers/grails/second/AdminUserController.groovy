package grails.second

class AdminUserController {
    static namespace = "login"

    def adminUserService

    def index() {
        def one = AdminUser.first()

        [firstName:one.ad_username]
    }

    def addNew(){
        def one = new AdminUser()

        one.ad_username= "mazhen619"
        one.ad_password="10335a"
        one.ad_number="007"
        one.ad_status=1

        adminUserService.save(one)

    }

    def editUser(){
        def one = AdminUser.last()
        one.ad_password="1033516561"

        adminUserService.save(one)
    }
}

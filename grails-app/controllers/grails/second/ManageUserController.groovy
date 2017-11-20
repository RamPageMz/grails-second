package grails.second

class ManageUserController {
    def manageUserService

    static namespace = "login"

    def index() {
        def one =ManageUser.first()

        [name:one?.mz_username]
    }

    def addNewUser(){
        def user = new ManageUser()

        user.mz_username = "mazhen"
        user.mz_password = "123456"
        user.mz_status = 1
        user.mz_number = "001"

        manageUserService.save(user)
    }
}

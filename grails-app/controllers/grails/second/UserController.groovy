package grails.second

import org.apache.commons.codec.binary.Base64

class UserController {
    //static layout = ""
    static namespace = "login"

    def userService

    def index() {
        println("user index")

        def testCode="123abcABC!"
        def encode=Base64.encodeBase64(testCode.getBytes("UTF-8"))

        println("encode "+String.valueOf(encode))

        def decode =Base64.decodeBase64(encode)

        println("decode "+String.valueOf(decode))

    }



    def addNewUser() {
        def user = new User()
        user.username = "mazhen"
        user.password = "123456"
        user.status = 1
        user.number = "001"

        userService.save(user)
    }

    def addUser(params) {
        println("params:" + params.username + " " + params.password + " " + params.status + " " + params.number)

        def user=new User(params)

        userService.save(user)
    }
}

package grails.second

class TestuserController {
    def testuserService

    def index() {
        println("index")

        def one=Testuser.last()

        println(one)

        [hello:"hello",one:one]
    }

    def editUser(){
        println("editUser")

        def one=Testuser.last()

        println("before:"+one.username+" "+one.age)

        one.username="马镇plus"
        one.age=34

//        one.save()
        testuserService.save(one)

        def two=Testuser.last()

        println("after:"+two.username+" "+two.age)

    }

    def addNewUser(){

        println("addNewUser")

        def one=new Testuser()
        one.username="new 用户"
        one.password="123密码"
        one.age=10
        one.dateCreated=new Date()
        one.lastUpdated=new Date()

        println("one.id: "+one.id)

//        one.save()
        testuserService.save(one)

    }

    def deleteUser(){
        def one=Testuser.findById("6")

        //one.delete()

        println("111")

        testuserService.delete(one)

    }

}

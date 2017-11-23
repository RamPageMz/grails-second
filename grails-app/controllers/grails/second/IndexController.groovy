package grails.second

class IndexController {
    static namespace = "dashboard"

    def index() {
        println("dashboard index ${session.getAttribute("username")}")

    }
}

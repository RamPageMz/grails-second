package grails.second

class StaffContract {//员工合同信息

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    static constraints = {
    }
}

package grails.second

class Picture {

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String staffNumber
    String pictureUrl
    Integer priority    // 1-首位 0-非首位
    String status

    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

        staffNumber nullable: true
        pictureUrl nullable: true
        priority nullable: true
        status nullable: true
    }
}

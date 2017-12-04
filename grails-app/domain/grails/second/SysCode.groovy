package grails.second

class SysCode {
    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    Integer codeKey
    String codeValue
    String type
    String tip

    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

        codeKey nullable: true
        codeValue nullable: true
        type nullable: true
        tip nullable: true
    }
}

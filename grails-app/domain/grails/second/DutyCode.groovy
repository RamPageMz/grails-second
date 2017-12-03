package grails.second

class DutyCode {
    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String codeKey
    String codeValue
    String tip

    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

        codeKey nullable: true
        codeValue nullable: true
        tip nullable: true
    }
}

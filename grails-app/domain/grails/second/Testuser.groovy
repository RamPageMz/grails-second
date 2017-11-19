package grails.second

class Testuser {

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String username
    String password
    Integer age

    static constraints = {

        username nullable: true
        password nullable: true
        age nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true
    }

    static mapping = {
        id genetaor: 'uuid.hex'
    }
}

package grails.second

class Contract {

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String contractType
    String contractNumber
    Date beginTime
    Date endTime
    String profileAddress

    static belongsTo = [staff:Staff]

    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

        contractType nullable: true
        contractNumber nullable: true
        beginTime nullable: true
        endTime nullable: true
        profileAddress nullable: true

        staff nullable: true
    }
}

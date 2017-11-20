package grails.second

class AdminUser {

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String ad_username  // 非空
    String ad_password  // 非空
    String ad_mail
    String ad_role
    String ad_phone
    String ad_number    // 员工编号 非空
    Integer ad_status   // 用户状态 非空  1-正常 0-离职


    static constraints = {
        ad_username nullable: false
        ad_password nullable: false
        ad_number nullable: false
        ad_status nullable: false

        ad_mail nullable: true
        ad_role nullable: true
        ad_phone nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true
    }
}

package grails.second

class ManageUser {

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String mz_username
    String mz_password
    String mz_mail         // 邮箱
    String mz_role         // 用户的角色
    String mz_phone        // 用户的联系方式
    String mz_number       // 用户的员工编号
    Integer mz_status      // 该用户数据库状态 1-正常 0-已离职

    //用户名 密码 员工编号 状态 不能为空
    static constraints = {
        mz_username nullable: false
        mz_password nullable: false
        mz_number  nullable: false
        mz_status nullable: false

        mz_mail nullable: true
        mz_role nullable: true
        mz_phone nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

    }

    static mapping = {
        //id generator: 'uuid.hex'
    }
}

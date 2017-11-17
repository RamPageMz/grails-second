package grails.second

class User {
    String id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String username
    String password
    String mail         // 邮箱
    String role         // 用户的角色
    String phone        // 用户的联系方式
    String number       // 用户的员工编号
    Integer status      // 该用户数据库状态 1-正常 0-已离职

    //用户名 密码 员工编号 状态 不能为空
    static constraints = {
        username nullable: false
        password nullable: false
        number  nullable: false
        status nullable: false

        mail nullable: true
        role nullable: true
        phone nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

    }

    static mapping = {
       // id generator: 'uuid.hex'
    }
}

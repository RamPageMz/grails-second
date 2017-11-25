package grails.second

class StaffHome {//员工家庭信息

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String stage

    String name
    String birthday
    String origin       //籍贯
    String race
    Integer degree      //学位
    Integer politic     //政治面貌 0-群众 1-团员 2-党员 3-其他
    String workUnit     //工作单位
    String duty         //职务
    String phone        //联系电话
    String appellation  //称谓
    Integer lover       //配偶 1-是配偶的记录 0-非配偶的记录

    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

        name nullable: false
        birthday nullable: true
        origin nullable: true
        race nullable: false
        degree nullable: true
        politic nullable: false
        workUnit nullable: true
        duty nullable: true
        phone nullable: false
        appellation nullable: true
        lover nullable: false
    }
}

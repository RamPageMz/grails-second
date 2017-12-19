package grails.second

class StaffWork {//员工工作信息

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String timeInterval
    String workUnit         //工作单位
    String department       //部门
    String duty             //职务
    String reference        //证明人

    Integer stage

    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

        timeInterval nullable: true
        workUnit nullable: true
        department nullable: true
        duty nullable: true
        reference nullable: true
        stage nullable: true
    }
}

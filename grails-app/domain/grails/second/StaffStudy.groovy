package grails.second

class StaffStudy {//员工学习经历

    //同一个员工的每一行学习经历都单独存一条记录

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String timeInterval     //起止时间      todo 前端做的时候写成日期选择器 转换成string
    String school
    String major
    String duty             //职务
    String reference        //证明人

    Integer stage           //记录学习经历是第几阶段 1,2，3...


    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

        timeInterval nullable: false
        school nullable: true
        major nullable: true
        duty nullable: false
        reference nullable: true
        stage nullable: false
    }
}

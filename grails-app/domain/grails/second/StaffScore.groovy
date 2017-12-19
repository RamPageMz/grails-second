package grails.second

class StaffScore {//员工业绩信息

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    Date scoreTime          //业绩时间
    String scoreInfo        //奖惩情况
    String scoreLevel       //奖惩登记
    String workUnit         //奖惩单位

    Integer stage

    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

        scoreTime nullable: true
        scoreInfo nullable: true
        scoreLevel nullable: true
        workUnit nullable: true
        stage nullable: true
    }
}

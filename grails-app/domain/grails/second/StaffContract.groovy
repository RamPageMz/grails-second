package grails.second

class StaffContract {//员工合同信息

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    Integer s_status

    Integer contractType
    Date startTime
    Date endTime
    String fileAddress          //档案所在地
    String laoDongShouCe        //劳动手册
    Date addmissionTime         //办理录取手续时间
    Date insuranceTime          //办理保险时间
    Date accumulationFundTime   //办理公积金时间

//    static belongsTo = [staff:Staff]

    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

        s_status nullable: true
        contractType nullable: false
        startTime nullable: true
        endTime nullable: true
        fileAddress nullable: true
        laoDongShouCe nullable: true
        addmissionTime nullable: true
        insuranceTime nullable: true
        accumulationFundTime nullable: true
    }
}

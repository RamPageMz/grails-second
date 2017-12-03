package grails.second

class Staff {//员工总表 链接到各个模块

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    Integer s_status      //状态 1-正常 0-不正常 2-休假

    String staff_number     //员工工号
    String department_number   //部门编号
    String duty             //职务

    Integer laoDongShouCe   // 1- 有劳动手册 0- 没有
    String laoDongShouCeTip
    Integer sheBaoJiJin
    String sheBaoJiJinTip
    Integer gongJiJin
    String gongJiJinTip
    Integer zongHeBaoXian
    String zongHeBaoXianTip
    Integer tuiGong
    String tuiGongTip



    // staff 与 staffBasic staffAttach staffContract staffHome 一对一

//    static hasOne = [staffAttach:StaffAttach,staffBasic:StaffBasic,staffContract:StaffContract]

    static hasMany = [staffHome:StaffHome,staffScore:StaffScore,staffStudy:StaffStudy,staffWork:StaffWork,salary:SalaryInfo]

    static belongsTo = [department:Department,staffAttach:StaffAttach,staffBasic:StaffBasic,staffContract:StaffContract]

    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

        s_status nullable: true
        staff_number nullable: true
        department_number nullable: true
        duty nullable: true
        laoDongShouCe nullable: true
        laoDongShouCeTip nullable: true
        sheBaoJiJin nullable: true
        sheBaoJiJinTip nullable: true
        gongJiJin nullable: true
        gongJiJinTip nullable: true
        zongHeBaoXian nullable: true
        zongHeBaoXianTip nullable: true
        tuiGong nullable: true
        tuiGongTip nullable: true

        staffBasic nullable: true
        staffAttach nullable: true
        staffContract nullable: true
        staffHome nullable: true
        staffScore nullable:  true
        staffStudy nullable: true
        staffWork nullable: true
        salary nullable: true
        department nullable: true
    }
}

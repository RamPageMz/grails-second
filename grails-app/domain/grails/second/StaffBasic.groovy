package grails.second

class StaffBasic {//员工基本信息

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String name
    Integer sex         //1-男 0-女
    String origin       //籍贯
    String birthday     //出生年月
    String race         //民族
    Integer marriage    //0-未婚 1-已婚 2-离婚  3-其他
    Integer politic     //政治面貌 0-群众 1-团员 2-党员 3-其他
    Integer health      //健康状况 0-不健康 1-健康 2-其他
    Integer education   //最高教育程度 0-未教育 1-小学 2-初中 3-高中 4-大学专科 5-大学本科 6-硕士 7-博士 8-其他
    Date graduationTime //毕业时间
    Integer degree      //学位划分 0-学士学位 1-硕士学位 2-博士学位 3-其他
    String graduationSchool     //毕业学校 todo 你nb可以去做个地区-学校级联搜索
    String major        //专业
    String proTitle     //职称
    String household    //户籍
    String identityCard //身份证
    Integer householdType    //户籍类别 0-上海户口 1-外省市城镇 2-外省市非城镇户口
    Integer havaShang   //是否持有上海市居民居住证  0-没有 1-有
    String validityTime //有效期
    String localAddress   //本地住址
    String zipCode      //邮编
    String mobilePhone  //手机
    String homePhone    //家庭电话
    Date hireTime       //入职时间

//    static belongsTo = [staff:Staff]
    static hasOne = [staff:Staff]

    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

        name nullable: false
        sex nullable: false
        origin nullable: false
        birthday nullable: false
        race nullable: false
        marriage nullable: false
        politic nullable: true
        health nullable: true
        education nullable: false
        graduationTime nullable: true
        degree nullable: false
        graduationSchool nullable: false
        major nullable: false
        proTitle nullable: true
        household nullable: true
        identityCard nullable: true
        householdType nullable: true
        havaShang nullable: true
        validityTime nullable: true
        localAddress nullable: true
        zipCode nullable: true
        mobilePhone nullable: true
        homePhone nullable: true
        hireTime nullable: true
        staff nullable: true
    }
}

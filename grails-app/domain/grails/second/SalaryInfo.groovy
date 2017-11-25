package grails.second

class SalaryInfo {

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String staffNumber          //员工工号
    String departmentCode       //部门编码
    String departmentName       //部门名称
    Date salaryTime             //薪水发放时间
    String salaryYear           //薪水年份
    String salaryMonth          //薪水月份
    Integer salaryStatus         //薪水状态 1-正常 0-失效

    String staff_name
    String salary_base         //基本工资
    String salary_post         //岗位工资
    String salary_compensation //补差
    String salary_seniority    //司龄
    String salary_singleton    //独子
    String salary_otherItem        //其他

    String salary_bonus        //奖励
    String salary_minus        //扣减
    String salary_shouldPay    //应发数
    String salary_pension      //养老金
    String salary_medical      //医疗金
    String salary_unemployment //失业金
    String salary_accumulationFund     //公积金
    String salary_supplementaryPayment //补缴
    String salary_taxbaleOay           //应税工资
    String salary_taxAdjustment        //个调税
    String salary_union        //工会费

    String salary_actualPay    //实发金额

    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

        staffNumber nullable: true
        departmentCode nullable: true
        departmentName nullable: true
        salaryTime nullable: true
        salaryYear nullable: true
        salaryMonth nullable: true
        salaryStatus nullable: true
        salary_name nullable: true
        salary_base nullable: true
        salary_post nullable: true
        salary_compensation nullable: true
        salary_seniority nullable: true
        salary_singleton nullable: true
        salary_otherItem nullable: true
        salary_bonus nullable: true
        salary_minus nullable: true
        salary_shouldPay nullable: true
        salary_pension nullable: true
        salary_medical nullable: true
        salary_unemployment nullable: true
        salary_accumulationFund nullable: true
        salary_supplementaryPayment nullable: true
        salary_taxbaleOay nullable: true
        salary_taxAdjustment nullable: true
        salary_union nullable: true
        salary_actualPay nullable: true

    }
}

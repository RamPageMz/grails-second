package grails.second

class TestDomainActionController {
    def staffService
    def staffBasicService
    def staffHomeService

    def index() {
        println("test Domain action ...")

        //createStaff()

        //createBasic()

        //createHome()

        //staffWithHome()

        showStaffWithBasic()

    }

    def createStaff(){
        println("createStaff...")
        def staff=new Staff()
        staff.s_status=1
        staff.staff_number="001"
        staff.department_number=1
        staff.duty="CEO"
        staff.laoDongShouCe=1
        staff.laoDongShouCeTip="手册tip"
        staff.sheBaoJiJin=1
        staff.sheBaoJiJinTip="社保基金tip"
        staff.gongJiJin=1
        staff.gongJiJinTip="公积金tip"
        staff.zongHeBaoXian=1
        staff.zongHeBaoXianTip="综合保险tip"
        staff.tuiGong=1
        staff.tuiGongTip="退工tip"

        staffService.save(staff)

        println("--------------")
    }

    def createBasic(){
        println("createBasic...")
        def basic=new StaffBasic()
        basic.name="马镇"
        basic.sex=1
        basic.origin="江苏"
        basic.birthday="1995.01.07"
        basic.race="汉族"
        basic.marriage=0
        basic.politic=2
        basic.health=1
        basic.education=6
        basic.graduationTime=new Date()
        basic.degree=1
        basic.graduationSchool="东华大学"
        basic.major="软件工程"
        basic.proTitle="数据分析师"
        basic.household="上海市XXXXX"
        basic.identityCard="320682XXXXXXXX"
        basic.householdType=1
        basic.havaShang=0
        basic.validityTime="2020-01-01"
        basic.localAddress="人民北路2999号"
        basic.zipCode="201620"
        basic.mobilePhone="15000796860"
        basic.homePhone="0512-85206264"
        basic.hireTime=new Date()

        basic.staff=Staff.first()

        staffBasicService.save(basic)

        println("--------------")
    }

    def createHome(){
        println("createHome...")
        def home=new StaffHome()
        home.stage=1
        home.name="配偶姓名"
        home.birthday="1995-01-01"
        home.origin="江苏"
        home.race="汉族"
        home.degree=1
        home.politic=2
        home.workUnit="东华大学"
        home.duty="学生"
        home.phone="1XXXXXXXXXXX"
        home.appellation="beauty"
        home.lover=1

        staffHomeService.save(home)

        def home1=new StaffHome()
        home1.stage=1
        home1.name="家人姓名"
        home1.birthday="1965-01-01"
        home1.origin="江苏"
        home1.race="汉族"
        home1.degree=1
        home1.politic=2
        home1.workUnit="中铁十四局"
        home1.duty="经理"
        home1.phone="1XXXXXXXXXXX"
        home1.appellation="mountain"
        home1.lover=0

        staffHomeService.save(home1)

        println("--------------")
    }

    def staffWithHome(){
        println("connect staff with home...")

        def staff=Staff.first()
        def home1=StaffHome.first()
        def home2=StaffHome.last()

        staff.staffHome=[home1,home2]

        staffService.save(staff)
    }

    def showStaffWithBasic(){
        println("showStaffWithBasic...")
        def staff=Staff.first()
        println(staff.staffBasic.id+" "+staff.staffBasic.name)

        for(home in staff.staffHome){
            println("Home:"+home.dateCreated)
        }

    }

}

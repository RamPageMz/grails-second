package grails.second

import grails.converters.JSON
import org.apache.poi.ss.usermodel.Row
import org.apache.poi.xssf.usermodel.XSSFCell
import org.apache.poi.xssf.usermodel.XSSFSheet
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import org.springframework.web.multipart.MultipartHttpServletRequest

import java.text.DateFormat
import java.text.DecimalFormat
import java.text.SimpleDateFormat

class StaffController {
    static namespace = "dashboard"
    def webRootDir = "I:\\file"

    def staffService
    def staffBasicService
    def contractService
    def staffHomeService
    def staffStudyService
    def staffWorkService
    def staffScoreService
    def pictureService

    def staffNumberSave

    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd")

    def index() {
        def dutyList = DutyCode.all
        def departmentList = Department.all

        [dutyList: dutyList, departmentList: departmentList]
//        def staff=Staff.first()
//        println(staff.department.name)
//        println(staff.staffBasic.name)
//        for(home in staff.staffHome){
//            println("Home:"+home.dateCreated)
//        }
//
//        def ss=Staff.createCriteria().list {
//            staffBasic{
//                like('proTitle','%数据%')
//            }
//            like('tuiGongTip','%退工tip%')
//        }
//
//        println(ss)
    }

    def searchPage() {
        println("searchPage..." + params)

        Date startDate
        Date endDate

        if (params.hireTime1 && params.hireTime2) {
            DateFormat format = new SimpleDateFormat("YYYY-MM-DD")
            startDate = format.parse(params.hireTime1)
            endDate = format.parse(params.hireTime2)
        }

        def staffList = Staff.createCriteria().list {
            if (params.departmentCode) {
                eq('department_number', params.departmentCode)
            }
            if (params.staffNumber) {
                like('staff_number', "%${params.staffNumber}%")
            }
            if (params.duty) {
                eq('duty', params.duty)
            }
            if (params.name) {
                staffBasic {
                    like('name', "%${params.name}%")
                }
            }
            if (params.hireTime1 && params.hireTime2) {
                staffBasic {
                    between('hireTime', startDate, endDate)
                }
            }
        }

        render(template: "/${namespace}/${params.controller}/searchList", model: [searchList: staffList])
    }

    def showStaffDetail() {
        println("showStaffDetail:" + params)

        def staff = Staff.findByStaff_number(params.staffNumber)

        def staffBasic = staff?.staffBasic
        def staffAttach = staff?.staffAttach
        def staffContract = staff?.staffContract
        def staffHome = staff?.staffHome.sort { a, b ->
            if (a.lover < b.lover)
                return 1
            else
                return -1

        }
        def staffWork = staff?.staffWork.sort { a, b ->
            if (a.timeInterval < b.timeInterval)
                return 1
            else
                return -1

        }
        def staffStudy = staff?.staffStudy.sort { a, b ->
            if (a.timeInterval < b.timeInterval)
                return 1
            else
                return -1
        }

        def staffScore = staff?.staffScore.sort { a, b ->
            if (a.scoreTime < b.scoreTime)
                return 1
            else
                return -1
        }

        println("attach:" + staffAttach)
        println("basic:" + staffBasic)
        println("contract:" + staffContract)
        println("home:" + staffHome)
        println("score:" + staffScore)
        println("study:" + staffStudy)
        println("work:" + staffWork)

        render(template: "/${namespace}/${params.controller}/detail",
                model: [staff      : staff, staffDuty: DutyCode?.findByCodeKey(staff?.duty)?.codeValue , headImage:Picture?.findByStaffNumberAndPriority(staff.staff_number,1)?.pictureUrl,
                        staffAttach: staffAttach, staffBasic: staffBasic, staffContract: staffContract,
                        staffHome  : staffHome, staffScore: staffScore, staffStudy: staffStudy, staffWork: staffWork])
    }

    def createStaff() {
        println("createStaff:")

        [photo:"photo1.png","filename":params.filename]
    }

    def saveFile() {
        def url = params.myFile
        println(url)

        def f = request.getFile('myFile')
        if (!f.empty) {
            def webRootDir = servletContext.getRealPath("/")
            println webRootDir
            def userDir = new File(webRootDir, "/payload/")
            userDir.mkdirs()
            f.transferTo(new File(userDir, f.originalFilename))
        }

        def result = ["backCode": "1", "backMessage": "ok!"]

        render result as JSON
    }

    def uploadFile() {
        def url = params.myFile
        println(url)

        def f = request.getFile('myFile')
        if (!f.empty) {
            def userDir = new File(webRootDir, "/excel/")
            userDir.mkdirs()
            f.transferTo(new File(userDir, f.originalFilename))
        }

        println("uploadFile success!")

        redirect(action: "excelInformation", params: [filename: f.originalFilename])

    }

    def excelImport() {
        println("excelImport page:")
    }

    def excelInformation() {
        println("excelInformation page: file:${params.filename}")

        def searchList = []
        def entryList = [:]

        def filePath = webRootDir + "\\excel\\" + params.filename

        File file = new File(filePath)
        FileInputStream inputStream = new FileInputStream(file)
        XSSFWorkbook workbook = new XSSFWorkbook(inputStream)

        XSSFSheet sheet = workbook.getSheetAt(0)

        sheet.eachWithIndex { Row entry, int i ->
            if (i > 0) {
                entryList = ['key': 'value']
//                def cells = entry.physicalNumberOfCells

                def name = getCellVal(entry.getCell(0))      //姓名
                def department = getCellVal(entry.getCell(1))
                def duty = getCellVal(entry.getCell(2))
                def card = getCellVal(entry.getCell(3))
                def sex = getCellVal(entry.getCell(4))
                def politic = getCellVal(entry.getCell(5))
                def birth = getCellVal(entry.getCell(6))
                def education = getCellVal(entry.getCell(7))  //学历
                def degree = getCellVal(entry.getCell(8))    //学位
                def graduationDate = getCellVal(entry.getCell(9))
                def graduationSchool = getCellVal(entry.getCell(10))
                def major = getCellVal(entry.getCell(11))
                def title = getCellVal(entry.getCell(12))
                def origin = getCellVal(entry.getCell(13))
                def originAddress = getCellVal(entry.getCell(14))
                def contackAddress = getCellVal(entry.getCell(15))
                def zipCode = getCellVal(entry.getCell(16))
                def phone = getCellVal(entry.getCell(17))
                def homePhone = getCellVal(entry.getCell(18))
                def hireTime = getCellVal(entry.getCell(19))
                def contactType = getCellVal(entry.getCell(20))
                def contactNo = getCellVal(entry.getCell(21))
                def contactBegin = getCellVal(entry.getCell(22))
                def contactEnd = getCellVal(entry.getCell(23))
                def profileAddress = getCellVal(entry.getCell(24))
                def laoDongShouCe = getCellVal(entry.getCell(25))
                def luYongShouXuTime = getCellVal(entry.getCell(26))
                def ensuranceTime = getCellVal(entry.getCell(27))
                def gongJiJinTime = getCellVal(entry.getCell(28))
                def fireTime = getCellVal(entry.getCell(29))

                def staff = new Staff()
                def staffBasic = new StaffBasic()
                def contract = new Contract()
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd")

                staffBasic.name = name

                def departmentDomain = Department.findByNameOrSimpleName(department, department)
                staff.department_number = departmentDomain.departmentCode
                staff.department = departmentDomain

                staff.duty = duty

                staffBasic.identityCard = card

                if (sex == '男')
                    staffBasic.sex = 1
                else
                    staffBasic.sex = 0

                def politicInt = SysCode.findByTypeAndCodeValue('politic', politic)?.codeKey
                if (politicInt != null)
                    staffBasic.politic = politicInt
                else
                    staffBasic.politic = 2//其他

                staffBasic.birthday = birth

                def educationInt = SysCode.findByTypeAndCodeValue('education', education)?.codeKey
                if (educationInt != null)
                    staffBasic.education = educationInt
                else
                    staffBasic.education = 8//其他

                def degreeInt = SysCode.findByTypeAndCodeValue('degree', degree)?.codeKey
                if (degreeInt != null)
                    staffBasic.degree = degreeInt
                else
                    staffBasic.degree = 3//其他

                staffBasic.graduationTime = sdf.parse(graduationDate)
                staffBasic.graduationSchool = graduationSchool
                staffBasic.major = major
                staffBasic.proTitle = title
                staffBasic.origin = origin
                staffBasic.zipCode = zipCode
                staffBasic.mobilePhone = phone
                staffBasic.homePhone = homePhone
                staffBasic.hireTime = sdf.parse(hireTime)
                contract.contractType = contactType
                contract.contractNumber = contactNo
                contract.beginTime = sdf.parse(contactBegin)
                contract.endTime = sdf.parse(contactEnd)
                contract.profileAddress = profileAddress
                staff.laoDongShouCe = 1
                staff.laoDongShouCeTip = laoDongShouCe
                staff.zongHeBaoXian = 1
                staff.zongHeBaoXianTip = ensuranceTime
                staff.gongJiJin = 1
                staff.gongJiJinTip = gongJiJinTime

                def staff_number = departmentDomain.departmentCode + (new Random().nextInt(1000)).toString()
                staff.staff_number = staff_number

                staff.staffBasic = staffBasic
                contract.staff = staff

                staffBasicService.save(staffBasic)
                staffService.save(staff)
                contractService.save(contract)

                entryList.put("name", name)
                entryList.put("department", department)
                entryList.put("duty", duty)
                entryList.put("card", card)
                entryList.put("birth", birth)
                entryList.put("hire", hireTime)

                println(entryList)

                searchList.add(entryList)
            }
            println("**********")
        }
        println("searchList")
        println(searchList)
        [searchList: searchList]
    }

    def getCellVal(cell) {
        if (cell.getCellType() == XSSFCell.CELL_TYPE_BLANK) {
            return ""
        } else if (cell.getCellType() == XSSFCell.CELL_TYPE_BOOLEAN) {
            return cell.getBooleanCellValue()
        } else if (cell.getCellType() == XSSFCell.CELL_TYPE_ERROR) {
            return cell.getErrorCellValue()
        } else if (cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC) {
            DecimalFormat decimalFormat = new DecimalFormat("#.#")
            return decimalFormat.format(cell.getNumericCellValue())
        } else if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING) {
            return cell.getStringCellValue()
        } else {
            return cell.getStringCellValue()
        }
    }

    def getDateCell(cell) {
        Date date = cell.getDateCellValue()
        def format = new SimpleDateFormat("yyyy-MM-dd")
        return format.format(date)
    }

    def createBasic() {
        println("createBasic:${params}")

        def staff = new Staff()
        def staffBasic = new StaffBasic()

        def staffNumber = params.basic_departmentCode + (new Random().nextInt(1000)).toString()
        println("staffNumber:${staffNumber}")

        staff.staff_number = staffNumber
        staffBasic.name = params.basic_name
        if (params?.basic_sex!="")
            staffBasic.sex = Integer.parseInt(params?.basic_sex)

        staffBasic.birthday = params.basic_birth
        staffBasic.identityCard = params.basic_card
        staffBasic.mobilePhone = params.basic_mobilePhone
        staffBasic.race = params.basic_race
        staffBasic.origin = params.basic_origin
        if (params.basic_householdType!="")
            staffBasic.householdType = Integer.parseInt(params.basic_householdType)

        if (params.basic_haveShang!="")
            staffBasic.havaShang = Integer.parseInt(params.basic_haveShang)

        staffBasic.validityTime = params.basic_validityTime
        if (params.basic_politic!="")
            staffBasic.politic = Integer.parseInt(params.basic_politic)

        if (params.basic_education!="")
            staffBasic.education = Integer.parseInt(params.basic_education)

        if (params.basic_health!="")
            staffBasic.health = Integer.parseInt(params.basic_health)

        if (params.basic_marriage!="")
            staffBasic.marriage = Integer.parseInt(params.basic_marriage)

        staffBasic.major = params.basic_major
        if (params.basic_graduationTime!="")
            staffBasic.graduationTime = sdf.parse(params.basic_graduationTime)

        staffBasic.proTitle = params.basic_proTitle
        staff.department_number = params.basic_departmentCode
        staff.department = Department.findByDepartmentCode(params.basic_departmentCode)
        staff.duty = params.basic_duty
        if (params.basic_hireTime!="")
            staffBasic.hireTime = sdf.parse(params.basic_hireTime)

        staffBasic.localAddress = params.basic_localAddress
        staffBasic.zipCode = params.basic_zipCode
        staffBasic.homePhone = params.basic_homePhone

        staffBasicService.save(staffBasic)
        staff.staffBasic = staffBasic
        staffService.save(staff)

        staffNumberSave=staffNumber

        def result = ["backCode": "1", "backMessage": "保存成功!", "staffNumber": staffNumber]

        render result as JSON
    }

    def createHome() {
        println("createHome:${params}")

        def staff = Staff.findByStaff_number(staffNumberSave)

        if (staff!=null){
            if (params.family_lover_name!=""){
                def home=new StaffHome()
                home.lover=1
                home.appellation="爱人"
                home.name=params.family_lover_name
                home.birthday=params.family_lover_birth
                home.origin=params.family_lover_origin
                home.race=params.family_lover_race
                home.workUnit=params.family_lover_workUnit
                home.duty=params.family_lover_duty
                if (params.family_lover_politic!="")
                    home.politic=Integer.parseInt(params.family_lover_politic)

                if (params.family_lover_degree!="")
                    home.degree=Integer.parseInt(params.family_lover_degree)

                home.phone=params.family_lover_phone

                staffHomeService.save(home)
                staff.staffHome.add(home)
                staffService.save(staff)
                println("save lover over")
            }
            if (params.family_name1!=""){
                def home=new StaffHome()
                home.lover=0
                home.appellation="父亲"
                home.name=params.family_name1
                home.birthday=params.family_birth1
                home.workUnit=params.family_workUnit1
                home.duty=params.family_duty1
                if (params.family_politic1!="")
                    home.politic=Integer.parseInt(params.family_politic1)

                home.phone=params.family_phone1

                staffHomeService.save(home)
                staff.staffHome.add(home)
                staffService.save(staff)
                println("save father over")
            }
            if (params.family_name2!=""){
                def home=new StaffHome()
                home.lover=0
                home.appellation="母亲"
                home.name=params.family_name2
                home.birthday=params.family_birth2
                home.workUnit=params.family_workUnit2
                home.duty=params.family_duty2
                if (params.family_politic2!="")
                    home.politic=Integer.parseInt(params.family_politic2)

                home.phone=params.family_phone2

                staffHomeService.save(home)
                staff.staffHome.add(home)
                staffService.save(staff)
                println("save mother over")
            }
            println("all over")
        }


        def result = ["backCode": "1", "backMessage": "保存成功!"]

        render result as JSON
    }

    def saveStudy(){
        println("saveStudy:${params}")

        def staff = Staff.findByStaff_number(staffNumberSave)

        if (staff!=null){
            if (params.study_school1!=""){
                def study=new StaffStudy()
                study.timeInterval=params.study1_start+"至"+params.study1_end
                study.school=params.study_school1
                study.major=params.study_major1
                study.duty=params.study_duty1
                study.reference=params.study_man1

                staffStudyService.save(study)
                staff.staffStudy.add(study)
                staffService.save(staff)
                println("save 1 over")
            }
            if (params.study_school2!=""){
                def study=new StaffStudy()
                study.timeInterval=params.study2_start+"至"+params.study2_end
                study.school=params.study_school2
                study.major=params.study_major2
                study.duty=params.study_duty2
                study.reference=params.study_man2

                staffStudyService.save(study)
                staff.staffStudy.add(study)
                staffService.save(staff)
                println("save 2 over")
            }
            if (params.study_school3!=""){
                def study=new StaffStudy()
                study.timeInterval=params.study3_start+"至"+params.study3_end
                study.school=params.study_school3
                study.major=params.study_major3
                study.duty=params.study_duty3
                study.reference=params.study_man3

                staffStudyService.save(study)
                staff.staffStudy.add(study)
                staffService.save(staff)
                println("save 3 over")
            }
        }


        def result = ["backCode": "1", "backMessage": "保存成功!"]

        render result as JSON
    }

    def saveWork(){
        println("saveWork:${params}")

        def staff=Staff.findByStaff_number(staffNumberSave)

        if (staff!=null){
            if (params.work_unit1!=""){
                def work=new StaffWork()
                work.timeInterval=params.work1_start+"至"+params.work1_end
                work.workUnit=params.work_unit1
                work.department=params.work_department1
                work.duty=params.work_duty1
                work.reference=params.work_man1

                staffWorkService.save(work)
                staff.staffWork.add(work)
                staffService.save(staff)
            }
            if (params.work_unit2!=""){
                def work=new StaffWork()
                work.timeInterval=params.work2_start+"至"+params.work2_end
                work.workUnit=params.work_unit2
                work.department=params.work_department2
                work.duty=params.work_duty2
                work.reference=params.work_man2

                staffWorkService.save(work)
                staff.staffWork.add(work)
                staffService.save(staff)
            }
            if (params.work_unit3!=""){
                def work=new StaffWork()
                work.timeInterval=params.work3_start+"至"+params.work3_end
                work.workUnit=params.work_unit3
                work.department=params.work_department3
                work.duty=params.work_duty3
                work.reference=params.work_man3

                staffWorkService.save(work)
                staff.staffWork.add(work)
                staffService.save(staff)
            }
        }


        def result = ["backCode": "1", "backMessage": "保存成功!"]

        render result as JSON
    }

    def saveScore(){
        println("saveScore:${params}")

        def staff=Staff.findByStaff_number(staffNumberSave)

        if (staff!=null){
            if (params.score_info1!=""){
                def score=new StaffScore()
                score.scoreTime=sdf.parse(params.score_date1)
                score.scoreInfo=params.score_info1
                score.scoreLevel=params.score_level1
                score.workUnit=params.score_unit1

                staffScoreService.save(score)
                staff.staffScore.add(score)
                staffService.save(staff)
            }
            if (params.score_info2!=""){
                def score=new StaffScore()
                score.scoreTime=sdf.parse(params.score_date2)
                score.scoreInfo=params.score_info2
                score.scoreLevel=params.score_level2
                score.workUnit=params.score_unit2

                staffScoreService.save(score)
                staff.staffScore.add(score)
                staffService.save(staff)
            }
            if (params.score_info3!=""){
                def score=new StaffScore()
                score.scoreTime=sdf.parse(params.score_date3)
                score.scoreInfo=params.score_info3
                score.scoreLevel=params.score_level3
                score.workUnit=params.score_unit3

                staffScoreService.save(score)
                staff.staffScore.add(score)
                staffService.save(staff)
            }
        }

        def result = ["backCode": "1", "backMessage": "保存成功!"]

        render result as JSON
    }

    def savePicture(){
        println("savePicture:")

        def url = params.myFile
        println(url)

        def f = request.getFile('myFile')
        if (!f.empty) {
            def myDir = servletContext.getRealPath("/")
            def userDir = new File(myDir, "/image/")
            userDir.mkdirs()
            f.transferTo(new File(userDir, f.originalFilename))

            def picture=new Picture()
            picture.pictureUrl=f.originalFilename
            picture.staffNumber=params.staffNumber

            pictureService.save(picture)
        }

        println("uploadFile success!")

        redirect(action: "update", params: [staffNumber: params.staffNumber])

    }

    def update(){
        println("update:${params}")

        def staff=Staff.findByStaff_number(params.staffNumber)

        println("staff:${staff.id}")

        [staff:staff,pictureList:Picture.findAllByStaffNumber(params.staffNumber)]
    }

    def setPicture(){
        println("setPicture:${params}")

        def picture=Picture.get(params.pictureID)
        picture.priority=1
        pictureService.save(picture)

        def result = ["backCode": "1", "backMessage": "已设置成头像!"]

        render result as JSON
    }

    def updateBasic(){
        println("updateBasic:${params}")

        def staff = Staff.findByStaff_number(params.staffNumber)
        def staffBasic = staff.staffBasic

        staffBasic.name = params.basic_name
        if (params?.basic_sex!="")
            staffBasic.sex = Integer.parseInt(params?.basic_sex)

        staffBasic.birthday = params.basic_birth
        staffBasic.identityCard = params.basic_card
        staffBasic.mobilePhone = params.basic_mobilePhone
        staffBasic.race = params.basic_race
        staffBasic.origin = params.basic_origin
        if (params.basic_householdType!="")
            staffBasic.householdType = Integer.parseInt(params.basic_householdType)

        if (params.basic_haveShang!="")
            staffBasic.havaShang = Integer.parseInt(params.basic_haveShang)

        staffBasic.validityTime = params.basic_validityTime
        if (params.basic_politic!="")
            staffBasic.politic = Integer.parseInt(params.basic_politic)

        if (params.basic_education!="")
            staffBasic.education = Integer.parseInt(params.basic_education)

        if (params.basic_health!="")
            staffBasic.health = Integer.parseInt(params.basic_health)

        if (params.basic_marriage!="")
            staffBasic.marriage = Integer.parseInt(params.basic_marriage)

        staffBasic.major = params.basic_major
        if (params.basic_graduationTime!="")
            staffBasic.graduationTime = sdf.parse(params.basic_graduationTime)

        staffBasic.proTitle = params.basic_proTitle
        staff.department_number = params.basic_departmentCode
        staff.department = Department.findByDepartmentCode(params.basic_departmentCode)
        staff.duty = params.basic_duty
        if (params.basic_hireTime!="")
            staffBasic.hireTime = sdf.parse(params.basic_hireTime)

        staffBasic.localAddress = params.basic_localAddress
        staffBasic.zipCode = params.basic_zipCode
        staffBasic.homePhone = params.basic_homePhone

        staffBasicService.save(staffBasic)
        staff.staffBasic = staffBasic
        staffService.save(staff)

        def result = ["backCode": "1", "backMessage": "更新成功!"]

        render result as JSON
    }

    /**
     *  Method Name : showAllStaffList
     *  Description : 显示所有的员工  暂定为员工编号排序
     *  Parameter   :
     *  Return      :
     *  Date        : 2017/11/30 14:51
     */
    def showAllStaffList() {
        println("Staff List:")

        def staffList = Staff.createCriteria().list {
            order("staff_number", "asc")
        }

        [staffList: staffList]
    }

    /**
     *  Method Name : searchStaffList
     *  Description : 根据条件搜索员工信息
     *  Parameter   : departmentCode  staffNumber duty name hireTime1 hireTime2
     *  Return      :
     *  Date        : 2017/11/30 14:56
     */
    def searchStaffList() {
        println("searchStaffList: params:" + params)

        def staffList = Staff.createCriteria().list {
            if (params.departmentCode) {
                eq('department_number', params.departmentCode)
            }
            if (params.staffNumber) {
                eq('staff_number', params.staffNumber)
            }
            if (params.duty) {
                eq('duty', params.duty)
            }
            if (params.name) {
                eq('staffBasic.name', params.name)
            }
            if (params.hireTime1 && params.hireTime2) {
                between('hireTime', params.hireTime1, params.hireTime2)
            }
        }

        //[searchList:staffList]
        return staffList
    }

    /**
     *  Method Name : showStaffAllInfo
     *  Description : 查看某个staff的所有信息
     *  Parameter   : staff.id / staff.staffNumber
     *  Return      :
     *  Date        : 2017/11/30 15:16
     */
    def showStaffAllInfo() {
        println('showStaffAllInfo: params:' + params)

        def staffInfo = Staff.findByStaff_number(params.staffNumber)

        [staff: staffInfo]
    }


}

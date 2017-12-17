package grails.second

import grails.converters.JSON
import org.apache.poi.ss.usermodel.Row
import org.apache.poi.xssf.usermodel.XSSFCell
import org.apache.poi.xssf.usermodel.XSSFSheet
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import org.springframework.web.multipart.MultipartHttpServletRequest

import java.text.DateFormat
import java.text.SimpleDateFormat

class StaffController {
    static namespace = "dashboard"
    def webRootDir = "I:\\file"

    def staffService
    def staffBasicService
    def contractService

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
                model: [staff      : staff, staffDuty: DutyCode.findByCodeKey(staff.duty).codeValue,
                        staffAttach: staffAttach, staffBasic: staffBasic, staffContract: staffContract,
                        staffHome  : staffHome, staffScore: staffScore, staffStudy: staffStudy, staffWork: staffWork])
    }

    def createStaff() {
        println("createStaff:")
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

        def searchList=[]
        def entryList=[:]

        def filePath = webRootDir + "\\excel\\" + params.filename

        File file = new File(filePath)
        FileInputStream inputStream = new FileInputStream(file)
        XSSFWorkbook workbook = new XSSFWorkbook(inputStream)

        XSSFSheet sheet = workbook.getSheetAt(0)

        sheet.eachWithIndex { Row entry, int i ->
            if (i > 0) {
                entryList=['key':'value']
//                def cells = entry.physicalNumberOfCells

                def name=getCellVal(entry.getCell(0)).toString()       //姓名
                def department=getCellVal(entry.getCell(1)).toString()
                def duty=getCellVal(entry.getCell(2)).toString()
                def card=getCellVal(entry.getCell(3)).toString()
                def sex=getCellVal(entry.getCell(4)).toString()
                def politic=getCellVal(entry.getCell(5)).toString()
                def birth=getCellVal(entry.getCell(6)).toString()
                def education=getCellVal(entry.getCell(7)).toString()  //学历
                def degree=getCellVal(entry.getCell(8)).toString()     //学位
                def graduationDate=getCellVal(entry.getCell(9)).toString()
                def graduationSchool=getCellVal(entry.getCell(10)).toString()
                def major=getCellVal(entry.getCell(11)).toString()
                def title=getCellVal(entry.getCell(12)).toString()
                def origin=getCellVal(entry.getCell(13)).toString()
                def originAddress=getCellVal(entry.getCell(14)).toString()
                def contackAddress=getCellVal(entry.getCell(15)).toString()
                def zipCode=getCellVal(entry.getCell(16)).toString()
                def phone=getCellVal(entry.getCell(17)).toString()
                def homePhone=getCellVal(entry.getCell(18)).toString()
                def hireTime=getCellVal(entry.getCell(19)).toString()
                def contactType=getCellVal(entry.getCell(20)).toString()
                def contactNo=getCellVal(entry.getCell(21)).toString()
                def contactBegin=getCellVal(entry.getCell(22)).toString()
                def contactEnd=getCellVal(entry.getCell(23)).toString()
                def profileAddress=getCellVal(entry.getCell(24)).toString()
                def laoDongShouCe=getCellVal(entry.getCell(25)).toString()
                def luYongShouXuTime=getCellVal(entry.getCell(26)).toString()
                def ensuranceTime=getCellVal(entry.getCell(27)).toString()
                def gongJiJinTime=getCellVal(entry.getCell(28)).toString()
                def fireTime=getCellVal(entry.getCell(29)).toString()

                def staff=new Staff()
                def staffBasic=new StaffBasic()
                def contract=new Contract()
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd")

                staffBasic.name=name

                def departmentDomain=Department.findByNameOrSimpleName(department,department)
                staff.department_number=departmentDomain.departmentCode
                staff.department=departmentDomain

                staff.duty=duty

                staffBasic.identityCard=card

                if (sex=='男')
                    staffBasic.sex=1
                else
                    staffBasic.sex=0

                def politicInt=SysCode.findByTypeAndCodeValue('politic',politic)?.codeKey
                if (politicInt!=null)
                    staffBasic.politic=politicInt
                else
                    staffBasic.politic=2//其他

                staffBasic.birthday=birth

                def educationInt=SysCode.findByTypeAndCodeValue('education',education)?.codeKey
                if (educationInt!=null)
                    staffBasic.education=educationInt
                else
                    staffBasic.education=8//其他

                def degreeInt=SysCode.findByTypeAndCodeValue('degree',degree)?.codeKey
                if (degreeInt!=null)
                    staffBasic.degree=degreeInt
                else
                    staffBasic.degree=3//其他

                staffBasic.graduationTime=sdf.parse(graduationDate)
                staffBasic.graduationSchool=graduationSchool
                staffBasic.major=major
                staffBasic.proTitle=title
                staffBasic.origin=origin
                staffBasic.zipCode=zipCode
                staffBasic.mobilePhone=phone
                staffBasic.homePhone=homePhone
                staffBasic.hireTime=sdf.parse(hireTime)
                contract.contractType=contactType
                contract.contractNumber=contactNo
                contract.beginTime=sdf.parse(contactBegin)
                contract.endTime=sdf.parse(contactEnd)
                contract.profileAddress=profileAddress
                staff.laoDongShouCe=1
                staff.laoDongShouCeTip=laoDongShouCe
                staff.zongHeBaoXian=1
                staff.zongHeBaoXianTip=ensuranceTime
                staff.gongJiJin=1
                staff.gongJiJinTip=gongJiJinTime

                def staff_number=departmentDomain.departmentCode+(new Random().nextInt(1000)).toString()
                staff.staff_number=staff_number

                staff.staffBasic=staffBasic
                contract.staff=staff

                staffBasicService.save(staffBasic)
                staffService.save(staff)
                contractService.save(contract)

                entryList.put("name",name)
                entryList.put("department",department)
                entryList.put("duty",duty)
                entryList.put("card",card)
                entryList.put("birth",birth)
                entryList.put("hire",hireTime)

                println(entryList)

                searchList.add(entryList)
            }
            println("**********")
        }
        println("searchList")
        println(searchList)
        [searchList: searchList]
    }

    def getCellVal(cell){
        if (cell.getCellType() == XSSFCell.CELL_TYPE_BLANK) {
            return ""
        } else if (cell.getCellType() == XSSFCell.CELL_TYPE_BOOLEAN) {
            return cell.getBooleanCellValue()
        } else if (cell.getCellType() == XSSFCell.CELL_TYPE_ERROR) {
            return cell.getErrorCellValue()
        } else if (cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC) {
            return cell.getNumericCellValue()
        } else if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING) {
            return cell.getStringCellValue()
        } else {
            return cell.getStringCellValue()
        }
    }

    def getDateCell(cell){
        Date date = cell.getDateCellValue()
        def format = new SimpleDateFormat("yyyy-MM-dd")
        return format.format(date)
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

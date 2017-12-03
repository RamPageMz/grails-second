package grails.second

import java.text.DateFormat
import java.text.SimpleDateFormat

class StaffController {
    static namespace = "dashboard"

    def index() {
        def dutyList=DutyCode.all
        def departmentList=Department.all

        [dutyList:dutyList,departmentList:departmentList]
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

    def searchPage(){
        println("searchPage..."+params)

        Date startDate
        Date endDate

        if (params.hireTime1&&params.hireTime2) {
            DateFormat format = new SimpleDateFormat("YYYY-MM-DD")
            startDate = format.parse(params.hireTime1)
            endDate = format.parse(params.hireTime2)
        }

        def staffList=Staff.createCriteria().list {
            if (params.departmentCode){
                eq('department_number',params.departmentCode)
            }
            if (params.staffNumber){
                eq('staff_number',params.staffNumber)
            }
            if (params.duty){
                eq('duty',params.duty)
            }
            if (params.name){
                staffBasic{
                    like('name',"%${params.name}%")
                }
            }
            if (params.hireTime1&&params.hireTime2){
                staffBasic{
                    between('hireTime',startDate,endDate)
                }
            }
        }

        render(template: "/${namespace}/${params.controller}/searchList", model:[searchList:staffList])
    }

    /**
     *  Method Name : showAllStaffList
     *  Description : 显示所有的员工  暂定为员工编号排序
     *  Parameter   :
     *  Return      :
     *  Date        : 2017/11/30 14:51
     */
    def showAllStaffList(){
        println("Staff List:")

        def staffList=Staff.createCriteria().list {
            order("staff_number","asc")
        }

        [staffList:staffList]
    }

    /**
     *  Method Name : searchStaffList
     *  Description : 根据条件搜索员工信息
     *  Parameter   : departmentCode  staffNumber duty name hireTime1 hireTime2
     *  Return      :
     *  Date        : 2017/11/30 14:56
     */
    def searchStaffList(){
        println("searchStaffList: params:"+params)

        def staffList=Staff.createCriteria().list {
            if (params.departmentCode){
                eq('department_number',params.departmentCode)
            }
            if (params.staffNumber){
                eq('staff_number',params.staffNumber)
            }
            if (params.duty){
                eq('duty',params.duty)
            }
            if (params.name){
                eq('staffBasic.name',params.name)
            }
            if (params.hireTime1&&params.hireTime2){
                between('hireTime',params.hireTime1,params.hireTime2)
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
    def showStaffAllInfo(){
        println('showStaffAllInfo: params:'+params)

        def staffInfo=Staff.findByStaff_number(params.staffNumber)

        [staff:staffInfo]
    }



}

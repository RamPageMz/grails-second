package grails.second

import grails.converters.JSON

class DepartmentController {
    static namespace = "dashboard"

    def departmentService

    def index() {
        println("department page:")

        def backgroundList=["#438AAA","#438ACC","#6699CC","#688FBB","#7A99CA","#88ACDD","#A7AAAC","#A7B1BE"]
        def iconList=["ion ion-person","fa fa-files-o","ion ion-bag","ion ion-person-add","ion ion-pie-graph","fa fa-star-o","ion ion-stats-bars","fa fa-comments"]

        def departmentList=Department.all.sort { a, b ->
            if (a.dateCreated < b.dateCreated)  //默认升序 即董事会在第一个
                return -1
            else
                return 1
        }
        println("departmentList:${departmentList}")

        def departmentAnswer=[]
        def departmentMap=[:]
        int index=0

        departmentList.each {
            departmentMap=[:]
            departmentMap.put("department",it)
            departmentMap.put("background",backgroundList[index])
            departmentMap.put("icon",iconList[index])
            departmentMap.put("index",index)
            index++

            departmentMap.put("staffCount",Staff.countByDepartment(it))

            departmentAnswer.add(departmentMap)

            println("Map:${departmentMap}")
        }

        [deparments:departmentAnswer]
    }

    def editPage(){
        println("editPage:${params.code}")

        def department=Department.findByDepartmentCode(params.code)

        [department:department,departmentList:Department.all]
    }

    def saveDepartment(){
        println("saveDepartment:${params}")

        def department=Department.get(params.departmentID)

        department.name=params.name
        department.simpleName=params.simpleName
        department.upperDepartment=Department.findByDepartmentCode(params.upperCode)

        departmentService.save(department)

        def result = ["backCode": "1", "message": "保存成功"]

        render result as JSON
    }

    def searchPage(){
        println("searchPage:${params}")

        def staffList=Staff.createCriteria().list {
            if (params.departmentCode) {
                eq('department_number', params.departmentCode)
            }
            if (params.staffNumber) {
                like('staff_number', "%${params.staffNumber}%")
            }
            if (params.name) {
                staffBasic {
                    like('name', "%${params.name}%")
                }
            }
        }

        render(template: "/${namespace}/${params.controller}/searchList", model: [searchList: staffList])
    }

    def saveCharge(){
        println("saveCharge:${params}")

        def staff=Staff.get(params.staffID)
        def department=Department.get(params.departmentID)

        department.staffInCharge=staff

        departmentService.save(department)

        def result = ["backCode": "1", "message": "设置成功"]

        render result as JSON
    }

    /**
     *  Method Name : showAllList
     *  Description : 显示所有的部门信息 包括上级信息
     *  Parameter   :
     *  Return      :
     *  Date        : 2017/11/30 17:44
     */
    def showAllDepartment(){
        def departments=Department.createCriteria().list {
            order('departmentCode','asc')
        }

        [departmentList:departments]
    }

}

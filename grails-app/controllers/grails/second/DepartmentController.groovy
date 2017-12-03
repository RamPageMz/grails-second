package grails.second

class DepartmentController {
    static namespace = "dashboard"

    def index() { }

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

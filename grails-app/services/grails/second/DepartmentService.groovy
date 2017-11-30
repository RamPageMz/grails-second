package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class DepartmentService {

    def allDepartment(){
        Department.list()
    }

    def listdata(params){
        Department.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(department){
        if(!department.validate()) {
            throw new ValidationException("保存失败", department.errors)
        }else {
            department.save()
        }
    }

    def delete(department){
        if(!department.validate()) {
            throw new ValidationException("删除失败", department.errors)
        }else {
            department.delete()
        }
    }
}

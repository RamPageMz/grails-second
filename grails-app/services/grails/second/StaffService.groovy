package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class StaffService {

    def allStaff(){
        Staff.list()
    }

    def listdata(params){
        Staff.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(staff){
        if(!staff.validate()) {
            throw new ValidationException("保存失败", staff.errors)
        }else {
            staff.save()
        }
    }

    def delete(staff){
        if(!staff.validate()) {
            throw new ValidationException("删除失败", staff.errors)
        }else {
            staff.delete()
        }
    }
}

package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class StaffHomeService {

    def allStaffHome(){
        StaffHome.list()
    }

    def listdata(params){
        StaffHome.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(staffHome){
        if(!staffHome.validate()) {
            throw new ValidationException("保存失败", staffHome.errors)
        }else {
            staffHome.save()
        }
    }

    def delete(staffHome){
        if(!staffHome.validate()) {
            throw new ValidationException("删除失败", staffHome.errors)
        }else {
            staffHome.delete()
        }
    }
}

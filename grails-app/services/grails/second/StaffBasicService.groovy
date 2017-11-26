package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class StaffBasicService {

    def allStaffBasic(){
        StaffBasic.list()
    }

    def listdata(params){
        StaffBasic.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(staffBasic){
        if(!staffBasic.validate()) {
            throw new ValidationException("保存失败", staffBasic.errors)
        }else {
            staffBasic.save()
        }
    }

    def delete(staffBasic){
        if(!staffBasic.validate()) {
            throw new ValidationException("删除失败", staffBasic.errors)
        }else {
            staffBasic.delete()
        }
    }
}

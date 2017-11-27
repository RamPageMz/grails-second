package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class StaffAttachService {

    def allStaffAttach(){
        StaffAttach.list()
    }

    def listdata(params){
        StaffAttach.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(staffAttach){
        if(!staffAttach.validate()) {
            throw new ValidationException("保存失败", staffAttach.errors)
        }else {
            staffAttach.save()
        }
    }

    def delete(staffAttach){
        if(!staffAttach.validate()) {
            throw new ValidationException("删除失败", staffAttach.errors)
        }else {
            staffAttach.delete()
        }
    }
}

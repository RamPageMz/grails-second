package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class StaffWorkService {

    def allStaffWork(){
        StaffWork.list()
    }

    def listdata(params){
        StaffWork.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(staffWork){
        if(!staffWork.validate()) {
            throw new ValidationException("保存失败", staffWork.errors)
        }else {
            staffWork.save()
        }
    }

    def delete(staffWork){
        if(!staffWork.validate()) {
            throw new ValidationException("删除失败", staffWork.errors)
        }else {
            staffWork.delete()
        }
    }
}

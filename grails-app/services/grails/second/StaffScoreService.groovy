package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class StaffScoreService {

    def allStaffScore(){
        StaffScore.list()
    }

    def listdata(params){
        StaffScore.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(staffScore){
        if(!staffScore.validate()) {
            throw new ValidationException("保存失败", staffScore.errors)
        }else {
            staffScore.save()
        }
    }

    def delete(staffScore){
        if(!staffScore.validate()) {
            throw new ValidationException("删除失败", staffScore.errors)
        }else {
            staffScore.delete()
        }
    }
}

package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class StaffStudyService {

    def allStaffStudy(){
        StaffStudy.list()
    }

    def listdata(params){
        StaffStudy.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(staffStudy){
        if(!staffStudy.validate()) {
            throw new ValidationException("保存失败", staffStudy.errors)
        }else {
            staffStudy.save()
        }
    }

    def delete(staffStudy){
        if(!staffStudy.validate()) {
            throw new ValidationException("删除失败", staffStudy.errors)
        }else {
            staffStudy.delete()
        }
    }
}

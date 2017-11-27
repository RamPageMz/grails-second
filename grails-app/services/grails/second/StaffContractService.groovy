package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class StaffContractService {

    def allStaffContract(){
        StaffContract.list()
    }

    def listdata(params){
        StaffContract.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(staffContract){
        if(!staffContract.validate()) {
            throw new ValidationException("保存失败", staffContract.errors)
        }else {
            staffContract.save()
        }
    }

    def delete(staffContract){
        if(!staffContract.validate()) {
            throw new ValidationException("删除失败", staffContract.errors)
        }else {
            staffContract.delete()
        }
    }
}

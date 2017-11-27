package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class SalaryInfoService {

    def allSalaryInfo(){
        SalaryInfo.list()
    }

    def listdata(params){
        SalaryInfo.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(salaryInfo){
        if(!salaryInfo.validate()) {
            throw new ValidationException("保存失败", salaryInfo.errors)
        }else {
            salaryInfo.save()
        }
    }

    def delete(salaryInfo){
        if(!salaryInfo.validate()) {
            throw new ValidationException("删除失败", salaryInfo.errors)
        }else {
            salaryInfo.delete()
        }
    }
}

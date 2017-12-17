package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class ContractService {

    def allContract(){
        Contract.list()
    }

    def listdata(params){
        Contract.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(contract){
        if(!contract.validate()) {
            throw new ValidationException("保存失败", contract.errors)
        }else {
            contract.save()
        }
    }

    def delete(contract){
        if(!contract.validate()) {
            throw new ValidationException("删除失败", contract.errors)
        }else {
            contract.delete()
        }
    }
}

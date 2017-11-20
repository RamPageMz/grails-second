package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class AdminUserService {

    def allTestuser(){
        AdminUser.list()
    }

    def listdata(params){
        AdminUser.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(adminUser){
        if(!adminUser.validate()) {
            throw new ValidationException("保存失败", adminUser.errors)
        }else {
            adminUser.save()
        }
    }

    def delete(adminUser){
        if(!adminUser.validate()) {
            throw new ValidationException("删除失败", adminUser.errors)
        }else {
            adminUser.delete()
        }
    }
}

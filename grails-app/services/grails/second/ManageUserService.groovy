package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class ManageUserService {

    def allTestuser(){
        ManageUser.list()
    }

    def listdata(params){
        ManageUser.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(manageUser){
        if(!manageUser.validate()) {
            throw new ValidationException("保存失败", manageUser.errors)
        }else {
            manageUser.save()
        }
    }

    def delete(manageUser){
        if(!manageUser.validate()) {
            throw new ValidationException("删除失败", manageUser.errors)
        }else {
            manageUser.delete()
        }
    }
}

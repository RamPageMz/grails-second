package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class UserService {

    def allUser(){
        User.list()
    }

    def listdata(params){
        User.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(user){
        if(!user.validate()) {
            throw new ValidationException("保存失败", user.errors)
        }else {
            user.save()
        }
    }

    def delete(user){
        if(!user.validate()) {
            throw new ValidationException("删除失败", user.errors)
        }else {
            user.delete()
        }
    }
}

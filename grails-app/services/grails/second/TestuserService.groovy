package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class TestuserService {

    def allTestuser(){
        Testuser.list()
    }

    def listdata(params){
        Testuser.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(testuser){
        if(!testuser.validate()) {
            throw new ValidationException("保存失败", testuser.errors)
        }else {
            testuser.save()
        }
    }

    def delete(testuser){
        if(!testuser.validate()) {
            throw new ValidationException("删除失败", testuser.errors)
        }else {
            testuser.delete()
        }
    }

}

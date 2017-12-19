package grails.second

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class PictureService {

    def allPicture(){
        Picture.list()
    }

    def listdata(params){
        Picture.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(picture){
        if(!picture.validate()) {
            throw new ValidationException("保存失败", picture.errors)
        }else {
            picture.save()
        }
    }

    def delete(picture){
        if(!picture.validate()) {
            throw new ValidationException("删除失败", picture.errors)
        }else {
            picture.delete()
        }
    }
}

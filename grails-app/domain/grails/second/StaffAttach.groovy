package grails.second

class StaffAttach {//员工附件资料

    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    Integer s_status      //状态

    Integer attachType      //附件类型 文档 图片 音频 视频
    String fileType         //文件后缀名
    String attachName
    String fileName
    String attachContent
    String tip

    static belongsTo = [staff:Staff]

    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

        s_status nullable: true
        attachType nullable: true
        fileType nullable: true
        attachName nullable: true
        fileName nullable: true
        attachContent nullable: true
        tip nullable: true
    }
}

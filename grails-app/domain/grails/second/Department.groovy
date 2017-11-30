package grails.second

class Department {
    Integer id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String departmentCode
    String name
    String simpleName               //简称
    String description
    //String personInChargeNumber     //负责人工号
    //String personInChargeName       //负责人姓名
    //String personInContactNumber    //联系人工号
    //String personInContactName      //联系人姓名

    static belongsTo = [upperDepartment:Department,staffInCharge:Staff,staffInConnnect:Staff]

    static constraints = {
        dateCreated nullable: true
        lastUpdated nullable: true
        createUser nullable: true
        updateUser nullable: true

        departmentCode nullable: true
        name nullable: true
        simpleName nullable: true
        description nullable: true
        staffInCharge nullable: true
        staffInConnnect nullable: true
        upperDepartment nullable: true
    }
}

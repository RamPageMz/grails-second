package grails.second

import grails.converters.JSON

import java.text.DateFormat
import java.text.SimpleDateFormat

class SalaryInfoController {
    static namespace = "dashboard"

    def salaryInfoService
    def staffService

    def staffSaveList=[]

    def index() {
        println("index:")

        [departmentList: Department.all, dutyList: DutyCode.all]
    }

    def searchPage() {
        println("searchPage..." + params)

        Date startDate
        Date endDate

        if (params.hireTime1 && params.hireTime2) {
            DateFormat format = new SimpleDateFormat("YYYY-MM-DD")
            startDate = format.parse(params.hireTime1)
            endDate = format.parse(params.hireTime2)
        }

        def staffList = Staff.createCriteria().list {
            if (params.departmentCode) {
                eq('department_number', params.departmentCode)
            }
            if (params.staffNumber) {
                like('staff_number', "%${params.staffNumber}%")
            }
            if (params.duty) {
                eq('duty', params.duty)
            }
            if (params.name) {
                staffBasic {
                    like('name', "%${params.name}%")
                }
            }
            if (params.hireTime1 && params.hireTime2) {
                staffBasic {
                    between('hireTime', startDate, endDate)
                }
            }
        }

        staffSaveList=staffList

        render(template: "/${namespace}/${params.controller}/searchList", model: [searchList: staffList])
    }

    def setSalary() {
        println("setSalary:${params}")

        println(params.staffList)

        staffSaveList.each {
            println("staff:${it}")

            //def staffIt=Staff.get(it)

            def salary=new SalaryInfo()
            salary.staffNumber=it?.staff_number
            salary.departmentCode=it?.department_number
            salary.departmentName=it?.department?.name
            salary.salaryTime=new Date()
            salary.salaryStatus=1

            salary.staff_name=it?.staffBasic?.name

            salary.salary_base=params.salary_base
            salary.salary_post=params.salary_post
            salary.salary_compensation=params.salary_compensation
            salary.salary_seniority=params.salary_seniority
            salary.salary_singleton=params.salary_singleton
            salary.salary_otherItem=params.salary_otherItem
            salary.salary_bonus=params.salary_bonus
            salary.salary_minus=params.salary_minus
            salary.salary_shouldPay=params.allGet

            salary.salary_pension=params.salary_pension
            salary.salary_medical=params.salary_medical
            salary.salary_unemployment=params.salary_unemployment
            salary.salary_accumulationFund=params.salary_accumulationFund
            salary.salary_supplementaryPayment=params.salary_supplementaryPayment
            salary.salary_taxbaleOay=params.salary_taxbaleOay
            salary.salary_taxAdjustment=params.salary_taxAdjustment
            salary.salary_union=params.salary_union

            salary.salary_actualPay=params.allGet-params.allMinus

            salaryInfoService.save(salary)

            /*it.salary.add(salary)

            staffService.save(it)*/
        }

        def result = ["backCode": "1", "message": "发放成功"]
        render result as JSON
    }
}

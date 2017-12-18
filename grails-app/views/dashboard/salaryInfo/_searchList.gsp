<div class="box-body">
    %{--<div class="alert alert-info alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-info"></i> Alert!</h4>
        Info alert preview. This alert is dismissable.${hello}
    </div>--}%
    <asset:stylesheet src="bootstrap/dist/css/bootstrap.min.css" />
    <asset:stylesheet src="font-awesome/css/font-awesome.min.css" />
    <asset:stylesheet src="Ionicons/css/ionicons.min.css" />
    <asset:stylesheet src="datatables.net-bs/css/dataTables.bootstrap.min.css" />
    <asset:stylesheet src="dist/css/AdminLTE.min.css" />
    <asset:stylesheet src="dist/css/skins/_all-skins.min.css" />

    <table id="example1" class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>员工编号</th>
            <th>姓名</th>
            <th>部门编码</th>
            <th>部门名称</th>
            <th>职务</th>
            <th>入职时间</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${searchList}">
            <tr onclick="">
                <td>${it?.staff_number}</td>
                <td>${it?.staffBasic?.name}</td>
                <td>${it?.department_number}</td>
                <td>${it?.department?.name}</td>
                <td>${grails.second.DutyCode.findByCodeKey(it?.duty).codeValue}</td>
                <td><g:formatDate format="yyyy-MM-dd" date="${it?.staffBasic?.hireTime}"/></td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div hidden>
        <g:each in="${searchList}">

        </g:each>
    </div>
    <asset:javascript src="jquery/dist/jquery.min.js" />
    <asset:javascript src="bootstrap/dist/js/bootstrap.min.js" />
    <asset:javascript src="datatables.net/js/jquery.dataTables.min.js" />
    <asset:javascript src="datatables.net-bs/js/dataTables.bootstrap.min.js" />
    <asset:javascript src="jquery-slimscroll/jquery.slimscroll.min.js" />
    <asset:javascript src="fastclick/lib/fastclick.js" />
    <asset:javascript src="dist/js/adminlte.min.js" />
    <asset:javascript src="dist/js/demo.js" />

    <script>
        $(function () {
            $('#example1').DataTable()
            $('#example2').DataTable({
                'paging'      : true,
                'lengthChange': false,
                'searching'   : false,
                'ordering'    : true,
                'info'        : true,
                'autoWidth'   : false
            })
        });

        function setSalary() {
            var staffList=[];
            <g:each in="${searchList}" >
                staffList.push('${it?.id}')
            </g:each>

            console.log(staffList)

            var salary_base = parseFloat($("#salary_base").val());
            var salary_post = parseFloat($("#salary_post").val());
            var salary_compensation = parseFloat($("#salary_compensation").val());
            var salary_seniority = parseFloat($("#salary_seniority").val());
            var salary_singleton = parseFloat($("#salary_singleton").val());
            var salary_otherItem = parseFloat($("#salary_otherItem").val());
            var salary_bonus = parseFloat($("#salary_bonus").val());
            var salary_minus = parseFloat($("#salary_minus").val());

            var salary_pension = parseFloat($("#salary_pension").val());
            var salary_medical = parseFloat($("#salary_medical").val());
            var salary_unemployment = parseFloat($("#salary_unemployment").val());
            var salary_accumulationFund = parseFloat($("#salary_accumulationFund").val());
            var salary_supplementaryPayment = parseFloat($("#salary_supplementaryPayment").val());
            var salary_taxbaleOay = parseFloat($("#salary_taxbaleOay").val());
            var salary_taxAdjustment = parseFloat($("#salary_taxAdjustment").val());
            var salary_union = parseFloat($("#salary_union").val());

            var allGet=salary_base + salary_post + salary_compensation + salary_seniority + salary_singleton + salary_otherItem + salary_bonus + salary_minus;
            var allMinus=salary_pension + salary_medical + salary_unemployment + salary_accumulationFund + salary_supplementaryPayment + salary_taxbaleOay + salary_taxAdjustment + salary_union;

            $.post("/salaryInfo/setSalary",{
                staffList:staffList,
                salary_base:salary_base,salary_post:salary_post,salary_compensation:salary_compensation,
                salary_seniority:salary_seniority,salary_singleton:salary_singleton,salary_otherItem:salary_otherItem,
                salary_bonus:salary_bonus,salary_minus:salary_minus,allGet:allGet,
                salary_pension:salary_pension,salary_medical:salary_medical,salary_unemployment:salary_unemployment,
                salary_accumulationFund:salary_accumulationFund,salary_supplementaryPayment:salary_supplementaryPayment,salary_taxbaleOay:salary_taxbaleOay,
                salary_taxAdjustment:salary_taxAdjustment,salary_union:salary_union,allMinus:allMinus
            }, function(data) {
                alert(data.message);
            }, "json");
        }

    </script>
</div>
<div class="box-footer">
    <button class="btn btn-danger" onclick="setSalary()">向以上员工发放工资</button>
</div>

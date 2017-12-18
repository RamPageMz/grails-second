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
            <th>部门名称</th>
            <th>职务</th>
            <th>入职时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${searchList}">
            <tr>
                <td>${it?.staff_number}</td>
                <td>${it?.staffBasic?.name}</td>
                <td>${it?.department?.name}</td>
                <td>${it?.duty}</td>
                <td><g:formatDate format="yyyy-MM-dd" date="${it?.staffBasic?.hireTime}"/></td>
                <td><button type="button" class="btn btn-block btn-info" onclick="saveCharge('${it?.id}')">设为负责人</button></td>
            </tr>
        </g:each>
        </tbody>
    </table>

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

        function saveCharge(staffID) {
            var departmentID=$("#hiddenID").val();
            console.log('choose ID:'+staffID+" "+departmentID);
            $.post("/department/saveCharge",{staffID:staffID,departmentID:'${departID}'}, function(data) {
                alert(data.message);
            }, "json");
        }
    </script>
</div>
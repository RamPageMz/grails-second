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
                <tr>
                    <td>${it?.staff_number}</td>
                    <td>${it?.staffBasic?.name}</td>
                    <td>${it?.department_number}</td>
                    <td>${it?.department?.name}</td>
                    <td>${it?.duty}</td>
                    <td><g:formatDate format="yyyy-MM-dd" date="${it?.staffBasic?.hireTime}"/></td>
                </tr>
            </g:each>
        </tbody>
        %{--<tfoot>
        <tr>
            <th>Rendering engine</th>
            <th>Browser</th>
            <th>Platform(s)</th>
            <th>Engine version</th>
            <th>CSS grade</th>
        </tr>
        </tfoot>--}%
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
        })
    </script>
</div>
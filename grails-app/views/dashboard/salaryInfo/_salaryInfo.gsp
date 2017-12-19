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

    <table id="example3" class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>发放时间</th>
            <th>部门</th>
            <th>薪酬应发</th>
            <th>实发金额</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${searchList}">
            <tr onclick="">
                <td><g:formatDate format="yyyy-MM-dd" date="${it?.salaryTime}"/></td>
                <td>${it?.departmentName}</td>
                <td>${it?.salary_shouldPay}</td>
                <td>${it?.salary_actualPay}</td>
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
            $('#example3').DataTable({
                'paging'      : true,
                'lengthChange': false,
                'searching'   : false,
                'ordering'    : true,
                'info'        : true,
                'autoWidth'   : false
            })
        });

    </script>
</div>
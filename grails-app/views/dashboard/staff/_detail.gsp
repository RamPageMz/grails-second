<div class="row">
    <div class="col-md-3">

        <!-- Profile Image -->
        <div class="box box-primary">
            <div class="box-body box-profile">
                <g:if test="${headImage==null||headImage==""}">
                    <img class="profile-user-img img-responsive img-circle" src="${resource(dir: 'assets/images' ,file: 'user4-128x128.jpg')}" alt="User profile picture">
                </g:if>
                <g:else>
                    <img class="profile-user-img img-responsive img-circle" src="${resource(dir: 'image' ,file: headImage)}" alt="User profile picture">
                </g:else>

                <h3 class="profile-username text-center">${staffBasic?.name}</h3>

                <p class="text-muted text-center">${staffDuty}</p>

                <ul class="list-group list-group-unbordered">
                    <li class="list-group-item">
                        <b>员工工号</b> <a class="pull-right">${staff?.staff_number}</a>
                    </li>
                    <li class="list-group-item">
                        <b>所属部门</b> <a class="pull-right">${staff?.department?.name}</a>
                    </li>
                    <li class="list-group-item">
                        <b>私人手机</b> <a class="pull-right">${staffBasic?.mobilePhone}</a>
                    </li>
                    <li class="list-group-item">
                        <b>入职时间</b> <a class="pull-right"><g:formatDate format="yyyy-MM-dd" date="${staffBasic?.hireTime}"/></a>
                    </li>
                </ul>

                <a href="#" class="btn btn-primary btn-block" onclick="window.location.href='../staff/update?staffNumber='+'${staff?.staff_number}'"><b>修改基本资料</b></a>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->

        <!-- About Me Box -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">附件</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <strong><i class="fa fa-book margin-r-5"></i> 合同信息</strong>

                <p class="text-muted">
                    B.S. in Computer Science from the University of Tennessee at Knoxville
                </p>

                <hr>

                <strong><i class="fa fa-file-word-o margin-r-5"></i> 附件信息</strong>

                <p class="text-muted">Malibu, California</p>

                <hr>

            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>
    <!-- /.col -->
    <div class="col-md-9">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#activity" data-toggle="tab">家庭信息</a></li>
                <li><a href="#scoreTab" data-toggle="tab">业绩信息</a></li>
                <li><a href="#studyTab" data-toggle="tab">学习经历</a></li>
                <li><a href="#workTab" data-toggle="tab">工作经历</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="activity">
                    <!-- Post -->
                    <g:each in="${staffHome}">
                        <div class="post">
                            <div class="user-block">
                                <img class="img-circle img-bordered-sm" src="${resource(dir: 'assets/images' ,file: 'user4-128x128.jpg')}" alt="user image">
                                <span class="username">
                                    <a href="#">${it?.name}</a>
                                    <a href="#" class="pull-right btn-box-tool">
                                        <g:if test="${it?.lover==1}">%{--是配偶的记录--}%
                                            <span class="label label-danger">配偶</span>
                                        </g:if>
                                        <g:else>
                                            <span class="label label-success">${it?.appellation}</span>
                                        </g:else>
                                    </a>
                                </span>
                                <span class="description">${it?.birthday}</span>
                            </div>
                            <!-- /.user-block -->
                            <p>
                                ${it?.workUnit}--${it?.duty}
                            </p>
                            <ul class="list-inline">
                                <li><a href="#" class="link-black text-sm"><i class="fa fa-user margin-r-5"></i>
                                    ${grails.second.SysCode.findByTypeAndCodeKey("politic",it?.politic).codeValue}
                                </a></li>
                            </ul>

                        </div>
                    </g:each>
                    <!-- /.post -->
                </div>
                <!-- /.tab-pane -->

                %{--
                    timeLine
                --}%
                <div class="tab-pane" id="scoreTab">
                    <!-- The timeline -->
                    <ul class="timeline timeline-inverse">
                        <!-- timeline time label -->
                        <g:each in="${staffScore}">
                            <li class="time-label">
                                <span class="bg-red">
                                    <g:formatDate format="yyyy-MM-dd" date="${it?.scoreTime}"/>
                                </span>
                            </li>
                            <li>
                                <i class="fa fa-envelope bg-blue"></i>

                                <div class="timeline-item">
                                    %{--<span class="time"><i class="fa fa-clock-o"></i> 12:05</span>--}%

                                    <h3 class="timeline-header"><a href="#">${it?.workUnit}</a>
                                        &nbsp;&nbsp;授予&nbsp;&nbsp; <a href="#">${it?.scoreLevel}</a> </h3>

                                    <div class="timeline-body">
                                        ${it?.scoreInfo}
                                    </div>
                                    <div class="timeline-footer">
                                        %{--<a class="btn btn-primary btn-xs">Read more</a>
                                        <a class="btn btn-danger btn-xs">Delete</a>--}%
                                    </div>
                                </div>
                            </li>
                        <!-- END timeline item -->
                        </g:each>

                        <li>
                            <i class="fa fa-clock-o bg-gray"></i>
                        </li>
                    </ul>
                </div>
                <!-- /.tab-pane -->

                <div class="tab-pane" id="studyTab">
                    <!-- The timeline -->
                    <ul class="timeline timeline-inverse">
                        <g:each in="${staffStudy}">
                            <li class="time-label">
                                <span class="bg-red">
                                    ${it?.timeInterval}
                                </span>
                            </li>
                            <li>
                                <i class="fa fa-envelope bg-blue"></i>

                                <div class="timeline-item">
                                    %{--<span class="time"><i class="fa fa-clock-o"></i> 12:05</span>--}%
                                    <h3 class="timeline-header"><a href="#">${it?.school}</a></h3>

                                    <div class="timeline-body">
                                        ${it?.major}-${it?.duty}
                                    </div>
                                    <div class="timeline-footer">
                                        %{--<a class="btn btn-primary btn-xs">Read more</a>
                                        <a class="btn btn-danger btn-xs">Delete</a>--}%
                                    </div>
                                </div>
                            </li>
                            <!-- END timeline item -->
                        </g:each>
                        <!-- timeline time label -->
                        <li class="time-label">
                            <span class="bg-red">
                                10 Feb. 2014
                            </span>
                        </li>
                        <!-- /.timeline-label -->
                        <!-- timeline item -->
                        <li>
                            <i class="fa fa-envelope bg-blue"></i>

                            <div class="timeline-item">
                                <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

                                <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                                <div class="timeline-body">
                                    Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                                    weebly ning heekya handango imeem plugg dopplr jibjab, movity
                                    jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                                    quora plaxo ideeli hulu weebly balihoo...
                                </div>
                                <div class="timeline-footer">
                                    <a class="btn btn-primary btn-xs">Read more</a>
                                    <a class="btn btn-danger btn-xs">Delete</a>
                                </div>
                            </div>
                        </li>
                        <!-- END timeline item -->
                        <!-- timeline item -->
                        <li>
                            <i class="fa fa-user bg-aqua"></i>

                            <div class="timeline-item">
                                <span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>

                                <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request
                                </h3>
                            </div>
                        </li>
                        <!-- END timeline item -->
                        <!-- timeline item -->
                        <li>
                            <i class="fa fa-comments bg-yellow"></i>

                            <div class="timeline-item">
                                <span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>

                                <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                                <div class="timeline-body">
                                    Take me to your leader!
                                    Switzerland is small and neutral!
                                    We are more like Germany, ambitious and misunderstood!
                                </div>
                                <div class="timeline-footer">
                                    <a class="btn btn-warning btn-flat btn-xs">View comment</a>
                                </div>
                            </div>
                        </li>
                        <!-- END timeline item -->
                        <!-- timeline time label -->
                        <li class="time-label">
                            <span class="bg-green">
                                3 Jan. 2014
                            </span>
                        </li>
                        <!-- /.timeline-label -->
                        <!-- timeline item -->
                        <li>
                            <i class="fa fa-camera bg-purple"></i>

                            <div class="timeline-item">
                                <span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>

                                <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                                <div class="timeline-body">
                                    <img src="http://placehold.it/150x100" alt="..." class="margin">
                                    <img src="http://placehold.it/150x100" alt="..." class="margin">
                                    <img src="http://placehold.it/150x100" alt="..." class="margin">
                                    <img src="http://placehold.it/150x100" alt="..." class="margin">
                                </div>
                            </div>
                        </li>
                        <!-- END timeline item -->
                        <li>
                            <i class="fa fa-clock-o bg-gray"></i>
                        </li>
                    </ul>
                </div>
                %{--
                    setting
                --}%
                <div class="tab-pane" id="workTab">
                    <ul class="timeline timeline-inverse">
                    <!-- timeline time label -->
                        <g:each in="${staffWork}">
                            <li class="time-label">
                                <span class="bg-red">
                                    ${it?.timeInterval}
                                </span>
                            </li>
                            <li>
                                <i class="fa fa-envelope bg-blue"></i>

                                <div class="timeline-item">
                                    %{--<span class="time"><i class="fa fa-clock-o"></i> 12:05</span>--}%
                                    <h3 class="timeline-header"><a href="#">${it?.workUnit}</a></h3>

                                    <div class="timeline-body">
                                        ${it?.department}-${it?.duty}
                                    </div>
                                    <div class="timeline-footer">
                                        %{--<a class="btn btn-primary btn-xs">Read more</a>
                                        <a class="btn btn-danger btn-xs">Delete</a>--}%
                                    </div>
                                </div>
                            </li>
                            <!-- END timeline item -->
                        </g:each>

                        <li>
                            <i class="fa fa-clock-o bg-gray"></i>
                        </li>
                    </ul>
                </div>
                <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
        </div>
        <!-- /.nav-tabs-custom -->
    </div>
    <!-- /.col -->
</div>
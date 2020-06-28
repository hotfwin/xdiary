<div class="panel box-shadow-none content-header">
    <div class="panel-body">
        <div class="col-md-12">
            <h3 class="animated fadeInLeft">文章列表</h3>
            <div class="row">
                <ol class="animated fadeInDown breadcrumb col-md-2 col-sm-12 col-xs-12">
                    <li><a href="<?= site_url() ?>">首页</a></li>
                    <li class="active">列表</li>

                    <!--按钮-->
                    <span class="hidden-md hidden-lg pull-right" id="search-btn" style="display: inline-block;cursor: pointer;">
                        搜索
                        <span class="caret"></span>
                    </span>
                </ol>
                <!--搜索内容-->
                <div class="col-md-10 col-sm-12 col-xs-12" id="search">
                    <ul class="">
                        <form method="get" class="input-group">

                            <li class="input-group">
                                <span class="input-group-addon">标题</span>
                                <input class="form-control" type="text" name="title" value="<?= $_GET['title'] ?? '' ?>" placeholder="" style="height:35px;width:130px">
                            </li>

                            <li class="input-group">
                                <span class="input-group-addon" style="height:34px;" >创建时间</span>
                                <input type="text" name="create" value="<?= $_GET['create'] ?? '' ?>" placeholder="请选择日期" id="date" class="form-control" style="height:35px;width:100px">
                            </li>

                            <li class="input-group">
                                <select name="is_original" class="form-control">
                                    <option value="">是否原创</option>
                                    <option value="0" <?= isset($_GET['is_original']) && $_GET['is_original'] == '0' ? 'selected="selected"' : '' ?>>原创</option>
                                    <option value="1" <?= isset($_GET['is_original']) && $_GET['is_original'] == '1' ? 'selected="selected"' : '' ?>>非原创</option>

                                </select>
                            </li>

                            <li>
                                <input type="submit" class="btn btn-outline btn-success" value="搜索" style="padding-right: 20px; padding-left: 20px;padding-top:5px;padding-bottom: 5px;">
                            </li>
                            <li>
                                <a href="<?= site_url('article/index') ?>" class="btn btn-outline btn-warning" style="padding-right: 20px; padding-left: 20px;padding-top:5px;padding-bottom: 5px;">重置</a>
                            </li>

                            <!-- <li>
 								<input type="submit" class="btn btn btn-gradient btn-info" value="搜索">
 							</li>
 							<li>
 								<a href="" class="btn btn-gradient btn-warning">重置</a>
 							</li> -->
                        </form>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>


<div class="col-md-12 top-20 padding-0">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-body">

                <!-- 警告(提示) start -->
                <?= view('alert/fade') ?>
                <!-- 警告(提示) end -->

                <div class="col-md-12 " style="padding-bottom:20px;">
                    <!-- <a href="javascript:history.back(-1);" class="right btn btn-gradient btn-default" style="margin-left:8px;" >后退</a> -->
                    <a href="<?= site_url('article/create/') ?>" title="新增" class="right btn btn-gradient btn-info">新增</a>
                    <h4 style="padding-left:10px;">列表（<?= $total ?>条）</h4>
                </div>

                <div class="responsive-table">
                    <form method="post" action="<?= site_url($className . '/expurgate/') ?>">
                        <table class="table table-striped table-bordered" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" class="icheck gou" name="checkbox1" />
                                    </th>
                                    <th>标题</th>
                                    <th>类型</th>
                                    <th>是否原创</th>
                                    <th>用户ID</th>
                                    <th>浏览</th>
                                    <th>创建时间</th>
                                    <th>预览</th>


                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if ($list) : ?>

                                    <?php foreach ($list as $key => $value) : ?>
                                        <tr>
                                            <td><input type="checkbox" class="icheck none" name="id" value="<?= $value->id ?>" /></td>
                                            <td><b class="hidden-md hidden-lg">标题：</b><?= $value->title ?></td>
                                            <td><b class="hidden-md hidden-lg">类型：</b><?= $value->category ?></td>
                                            <td><b class="hidden-md hidden-lg">是否原创：</b><?= $value->is_original ?></td>
                                            <td><b class="hidden-md hidden-lg">用户ID：</b><?= $value->user_id ?></td>
                                            <td><b class="hidden-md hidden-lg">浏览：</b><?= $value->visit ?></td>

                                            <td><b class="hidden-md hidden-lg">创建时间：</b><?= date('Y-m-d H:i', $value->create) ?></td>
                                            <td>
                                                <a href="//<?= $_SERVER['HTTP_HOST'] . '/article/detail/' . $value->id ?>" target="_blank">点我预览</a>
                                            </td>

                                            <td>
                                                <div class="btn-group">
                                                    <a href="<?= site_url('article/edit/' . $value->id) ?>" title="修改" class="btn btn-xs btn-info">
                                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                    </a>
                                                    <a href="<?= site_url('article/delete/' . $value->id) ?>" title="删除" class="btn btn-xs btn-danger" onclick="return confirm('是否要删除文章:<?= $value->title ?>（ID：<?= $value->id ?>）？？');">
                                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                    </a>
                                                </div>
                                            </td>



                                            <td>
                                                <a href="" style="color:#27C24C;"><i class="fa fa-cny"></i>去记账 <span class="text-muted"></span></a> |
                                                <a href="<?= site_url('article/edit/' . $value->id) ?>"><i class="fa fa-edit"></i>修改 <span class="text-muted"></span></a> |
                                                <a style="color: red;" href="<?= site_url('article/delete/' . $value->id) ?>" onclick="return confirm('是否要删除ID:<?= $value->id ?>（是否要删除文章：<?= $value->title ?>）？？');"><i class="fa fa-trash-o"></i>删除</a>
                                            </td>

                                        </tr>
                                    <?php endforeach; ?>
                                    <tr>
                                        <td colspan="999">
                                            <div class="pull-right">
                                                <?= $pager->links() ?>
                                            </div>

                                            <input type="checkbox" class="icheck pull-left gou" name="checkbox1" />

                                            <!-- <input type="button" class="btn btn-gradient btn-danger" value="删除" /> -->
                                            <input type="Submit" onclick="return confirm('是否删除选中的数据？？');" class="btn btn-gradient btn-danger" value="删除" />

                                            <!-- <input type="button" class=" btn btn-gradient btn-primary" value="修改" /> -->
                                            <a href="<?= site_url('article/create/') ?>" title="新增" class="btn  btn-gradient btn-success">新增</a>
                                            <!-- <input type="button" class="btn btn-gradient btn-default" value="返回" /> -->
                                            <input type="button" class="btn btn-gradient btn-default" value="后退" onclick="javascript:history.back(-1);" />

                                            <!-- <input type="button" class="btn btn-gradient btn-warning" value="警告" /> -->
                                            <!-- <input type="button" class="btn btn-gradient btn-info" value="通知" /> -->



                                        </td>

                                    </tr>
                                <?php else : ?>
                                    <tr>
                                        <td colspan="200" style="text-align: center;">
                                            暂无数据!! 现在<a href="<?= site_url('article/create/') ?>">新增</a>数据
                                        </td>
                                    </tr>

                                <?php endif; ?>

                            </tbody>
                        </table>
                    </form>
                </div>


            </div>
        </div>
    </div>
</div>


<script src="asset/js/plugins/icheck.min.js"></script>

<link rel="stylesheet" type="text/css" href="asset/css/datepicker.css" />
<script type="text/javascript" src="asset/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="asset/js/locales/bootstrap-datepicker.zh-CN.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        // 选项样式
        $('input').iCheck({
            checkboxClass: 'icheckbox_flat-red',
            radioClass: 'iradio_flat-red'
        });
        /*全选与反选*/
        var num = 0;
        $('.gou').next().each(function(i) {
            $(this).on('click', function() {

                if (num == 0) {
                    $('.icheck').prop('checked', true).parent().addClass('checked');
                    num += 1;
                } else {
                    $('.icheck').prop('checked', false).parent().removeClass('checked');
                    num = 0;
                }
            });
        });

        /*搜索居右设置*/
        var width = $(window).width();
        if (width > 990) {
            $('#search ul').addClass('pull-right');
        }
        $("#search-btn").click(function() {
            $('#search').toggle();
        });

        /*选择日期*/
        $("#date").datepicker({
            language: "zh-CN",
            autoclose: true, //选中之后自动隐藏日期选择框
            clearBtn: true, //清除按钮
            todayBtn: true, //今日按钮
            format: "yyyy-mm-dd" //日期格式，
        });

    });
</script>
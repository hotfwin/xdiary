<div class="panel box-shadow-none content-header">
    <div class="panel-body">
        <div class="col-md-12">
            <h3 class="animated fadeInLeft">后台用户</h3>
            <p class="animated fadeInDown">
                用户 <span class="fa-angle-right fa"></span>列表
            </p>
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
                <div class="col-md-12 padding-0" style="padding-bottom:20px;">
                    <a href="<?= site_url('admins/create/') ?>" title="新增" class="right btn btn-gradient btn-info">新增</a>
                    <h4 style="padding-left:10px;">列表</h4>
                </div>

                <div class="responsive-table">
                    <table class="table table-striped table-bordered" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>
									<input type="checkbox" class="icheck gou" name="checkbox1" />
								</th>
                                <th>ID</th>
                                <th>登录名</th>
                                <th>Email</th>
                                <th>角色组</th>
                                <th>状态</th>
                                <th>创建时间</th>
                                <th>最后登录时间</th>
                                <th>&nbsp;&nbsp;&nbsp;修改&nbsp;|&nbsp;删除</th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($list) : ?>
                                <?php foreach ($list as $key => $value) : ?>
                                    <tr>
                                        <td>
											<input type="checkbox" class="icheck none" name="id[<?= $key ?>]" value="<?= $value->id ?>" />
										</td>
                                        <td><?= $value->id ?></td>
                                        <td><?= $value->username ?></td>
                                        <td><?= $value->email ?></td>
                                        <td><?= $roles[$value->role] ?? '' ?></td>
                                        <td>
                                            <!-- 0=正常，其它（1=永久冻结，冻结时间）不可登录 -->
                                            <?php if ($value->status == 0) : ?>
                                                <span class="label label-info">正常</span>
                                            <?php elseif($value->status == 1) : ?>
                                                <span class="label  label-danger">永久冻结</span>
                                            <?php else: ?>
                                                <span class="label  label-warning">解冻:<?=date('Y-m-d H:i:s',$value->status)?></span>
                                            <?php endif; ?>
                                        </td>
                                        <td><?= $value->create_time ?></td>
                                        <td>
											<b class="hidden-md hidden-lg">最后登录时间：</b>
											<?= date('Y-m-d H:i:s', $value->last_login) ?>
										</td>
                                        <td>
                                            <div class="btn-group">
                                                <a href="<?= site_url('admins/edit/' . $value->id) ?>" class="btn btn-xs btn-info" title="修改">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </a>
                                                <a href="<?= site_url('admins/delete/' . $value->id) ?>" onclick="return confirm('是否删除-<?= $value->username ?>（ID:<?= $value->id ?>）？？');" class="btn btn-xs btn-danger" title="删除">
                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                </a>
                                            </div>
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

										<input type="button" class=" btn btn-gradient btn-primary" value="修改" />
										<a href="<?= site_url('menus/create/') ?>" title="新增" class="btn  btn-gradient btn-success">新增</a>
										<!-- <input type="button" class="btn btn-gradient btn-default" value="返回" /> -->
										<input type="button" class="btn btn-gradient btn-default" value="返回" onclick="javascript:history.back(-1);" />

										<input type="button" class="btn btn-gradient btn-warning" value="警告" />
										<input type="button" class="btn btn-gradient btn-info" value="通知" />

									</td>

								</tr>
                            <?php else : ?>
                                <tr>
                                    <td colspan="200" style="text-align: center;">
                                        暂无数据!! 现在<a href="<?= site_url('admins/create/') ?>">新增</a>数据
                                    </td>
                                </tr>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>


            </div>

        </div>
    </div>
</div>

<script src="asset/js/plugins/icheck.min.js"></script>

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

	});
</script>
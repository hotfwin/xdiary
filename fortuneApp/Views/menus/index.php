 <div class="panel box-shadow-none content-header">
 	<div class="panel-body">
 		<div class="col-md-12">
 			<h3 class="animated fadeInLeft">菜单管理</h3>
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
 							<!-- <li>
 								<label>开票日期：</label>
 								<input type="text" name="year" value="<?= $_GET['year'] ?? '' ?>" placeholder="年" style="height:35px;width:100px">
							 </li> -->
 							<li class="input-group">
 								<span class="input-group-addon">名字</span>
 								<input class="form-control" type="text" name="year" placeholder="名" style="height:35px;width:100px">
 							</li>
 							<li class="input-group">
 								<span class="input-group-addon">开票日期</span>
 								<input class="form-control" type="text" name="year" placeholder="年" style="height:35px;width:100px">
 							</li>

 							<li class="input-group">
 								<select name="category" class="form-control">
 									<option value="">类别</option>
 									<option value="增值税专用发票">增值税专用发票</option>
 									<option value="增值税普通发票">增值税普通发票</option>
 									<option value="增值税电子普通发票">增值税电子普通发票</option>
 									<option value="定额发票">定额发票</option>
 									<option value="其它">其它</option>
 								</select>
 							</li>

 							<li>
 								<input type="submit" class="btn btn-outline btn-success" value="搜索" style="padding-right: 20px; padding-left: 20px;padding-top:5px;padding-bottom: 5px;">
 							</li>
 							<li>
 								<a href="<?= site_url('order/index?status=3') ?>" class="btn btn-outline btn-warning" style="padding-right: 20px; padding-left: 20px;padding-top:5px;padding-bottom: 5px;">重置</a>
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
 				<div class="col-md-12 padding-0" style="padding-bottom:20px;">
 					<?php if ($parent) : ?>
 						<a href="javascript:history.back(-1);" class="right btn btn-gradient btn-default" style="margin-left:8px;">后退</a>
 					<?php endif; ?>
 					<a href="<?= site_url('menus/create/' . $parent) ?>" class="right btn btn-gradient btn-success">新增</a>
 					<h4 style="padding-left:10px;">
 						<?php if ($parent != 0) : ?>
 							<span class="text-info">
 								<?php $model = new \App\Models\MenusModel();
									echo $model->find($parent)->name ?? ''; ?>
 							</span> -
 						<?php endif; ?>
 						列表（<?= $total ?>条）
 					</h4>
 				</div>

 				<div class="responsive-table">

 					<table class="table table-striped table-bordered" width="100%" cellspacing="0">
 						<thead>
 							<tr>
 								<th>
 									<input type="checkbox" class="icheck gou" name="checkbox1" />
 								</th>
 								<th>排序</th>
 								<th>菜单名称</th>
 								<th>对应类</th>
 								<th>对应方法</th>
 								<th>层级</th>
 								<th>是否显示</th>
 								<th>所属顶级</th>
 								<th>进入下级</th>
 								<th></th>
 							</tr>
 						</thead>
 						<tbody>
 							<?php if ($list) : ?>
 								<?php foreach ($list as $key => $value) : ?>
 									<tr>
 										<td>
 											<input type="checkbox" class="icheck none" name="id[<?= $key ?>]" value="<?= $value->id ?>" />
 										</td>
 										<td><?= $value->order_by ?></td>
 										<td><?= $value->name ?></td>
 										<td><?= $value->class ?></td>
 										<td><?= $value->method ?></td>
 										<td><?= $value->level ?></td>
 										<td>
 											<?php if ($value->is_show) : ?>
 												<span class="label label-success">显示</span>
 											<?php else : ?>
 												<span class="label label-danger">不显示</span>
 											<?php endif; ?>
 										</td>
 										<td><?= $value->department ?></td>
 										<td>
 											<a href="<?= site_url('menus/index/' . $value->id) ?>" style="color: green;">进入下级</a>
 										</td>
 										<td style="text-align: center;">
 											<a href="<?= site_url('menus/edit/' . $value->id) ?>"><i class="fa fa-edit"></i> 修改 <span class="text-muted"></span></a> |
 											<a style="color: red;" href="<?= site_url('menus/delete/' . $value->id) ?>" onclick="return confirm('是否删除-<?= $value->name ?>（ID:<?= $value->id ?>）？？');"><i class="fa fa-trash-o"></i> 删除</a>
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
 										暂无数据!! 现在<a href="<?= site_url('menus/create/') ?>">新增</a>数据
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
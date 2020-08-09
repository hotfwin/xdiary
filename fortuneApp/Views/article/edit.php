<div class="panel box-shadow-none content-header">
    <div class="panel-body">
        <div class="col-md-12">
            <h3 class="animated fadeInLeft">修改文章</h3>
            <p class="animated fadeInDown">
                <a href="<?= site_url() ?>">首页</a>
                <span class="fa-angle-right fa"></span>
                <a href="<?= site_url('article/index/') ?>">列表</a>
                <span class="fa-angle-right fa"></span> 修改
            </p>
        </div>
    </div>
</div>

<div class="col-md-12 padding-0">
    <div class="col-md-12">
        <div class="col-md-12 panel">
            <div class="col-md-12 panel-heading">
                <a href="javascript:history.back(-1);" class="btn btn-default right">返回</a>
                <h4>文章修改</h4>
            </div>

            <div class="col-md-12 panel-body">
                <form method="post" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">文章标题：</label>
                        <div class="col-sm-10">
                            <input type="text" name="title" value="<?= $edit->title ?>" class="form-control">
                            <span class="bar"><?= \Config\Services::validation()->showError('title'); ?></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">展示文章发表人：</label>
                        <div class="col-sm-10">
                            <input type="text" name="username" value="<?= $edit->username ?>" class="form-control">
                        </div>
                    </div>

                    <?php if (isset($nav)) : ?>
                        <div class="form-group">
                            <label class="col-sm-2 control-label text-right">所属导航栏 </label>
                            <div class="col-sm-10">

                                <select name="nav_id" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                                    <option value="">请选择</option>
                                    <?php foreach ($nav as $key => $value) : ?>
                                        <option value="<?= $value->id ?>" <?= $edit->nav_id == $value->id ? 'selected="selected"' : '' ?>><?= $value->display ?></option>
                                    <?php endforeach; ?>
                                </select>

                            </div>
                        </div>
                    <?php endif; ?>

                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">文章分类：</label>
                        <div class="col-sm-10">
                            <div class="input-group col-sm-10">

                                <select name="category_id" class="form-control" id="c_id" aria-describedby="basic-addon3">
                                    <option value="">请选择</option>
                                    <?php
                                    $articleCategoryModel = new \App\Models\ArticleCategoryModel();
                                    $categoryAll = $articleCategoryModel->findAll();
                                    if (isset($categoryAll)) : ?>
                                        <?php foreach ($categoryAll as $key => $value) : ?>
                                            <option value="<?= $value->id ?>" <?= $edit->category_id == $value->id ? 'selected="selected"' : '' ?>><?= $value->category ?></option>
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </select>
                                <span class="input-group-addon" id="basic-addon3"><a href="<?= site_url('articleCategory/create') ?>">新增分类</a></span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">所属专栏：</label>
                        <div class="col-sm-10">
                            <div class="input-group col-sm-10">

                                <select name="columns_id" class="form-control" id="c_id" aria-describedby="basic-addon3">
                                    <option value="">请选择</option>
                                    <?php
                                    $columnModel = new \App\Models\ColumnModel();
                                    $columnAll = $columnModel->findAll();
                                    if (isset($columnAll)) : ?>
                                        <?php foreach ($columnAll as $key => $value) : ?>
                                            <option value="<?= $value->id ?>" <?= $edit->columns_id == $value->id ? 'selected="selected"' : '' ?> ><?= $value->title ?></option>
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </select>
                                <span class="input-group-addon" id="basic-addon3"><a href="<?= site_url('column/create') ?>">新增专栏</a></span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">阅读权限：</label>
                        <div class="col-sm-10">
                            <select name="available" class="form-control" aria-describedby="basic-addon3">
                                <option >请选择</option>
                                <option value="0" <?= $edit->available == '0' ? 'selected="selected"' : '' ?>>免费</option>
                                <option value="1" <?= $edit->available == '1' ? 'selected="selected"' : '' ?>>登录</option>
                                <option value="2" <?= $edit->available == '2' ? 'selected="selected"' : '' ?>>私密</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">SEO标题</label>
                        <div class="col-sm-10">
                            <input name="seo_title" value="<?= $edit->seo_title ?>" id="form-field-11" class="autosize-transition form-control" placeholder="SEO标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">SEO关键词</label>
                        <div class="col-sm-10">
                            <input name="seo_keywords" value="<?= $edit->seo_keywords ?>" id="form-field-11" class="autosize-transition form-control" placeholder="SEO关键词">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">SEO描述</label>
                        <div class="col-sm-10">
                            <textarea name="seo_description" id="form-field-11" class="autosize-transition form-control" placeholder="SEO描述"><?= $edit->seo_description ?></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">文章摘要</label>
                        <div class="col-sm-10">
                            <textarea name="summary" id="form-field-11" class="autosize-transition form-control" placeholder="请输入文章摘要"><?= $edit->summary ?> </textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">文章内容</label>
                        <div class="col-sm-10">
                            <textarea class="summernote" name="content" placeholder="请输入文章内容">
                                <?php
                                $articleContentModel = new \App\Models\ArticleContentModel();
                                echo $articleContentModel->find($edit->content_id)->content ?? '';
                                ?>
                            </textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right"> </label>
                        <div class="col-sm-10">
                            <input type="hidden" name="category" id="category" value="<?= $edit->category ?>">
                            <input type="hidden" name="content_id" id="content_id" value="<?= $edit->content_id ?>">

                            <button class="btn btn-info btn-success" type="Submit">
                                <i class="ace-icon fa fa-check bigger-110"></i>
                                提交
                            </button>

                            &nbsp; &nbsp; &nbsp;
                            <button class="btn" type="reset" onclick="javascript:history.back(-1);">
                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                取消
                            </button>

                        </div>
                    </div>


                </form>

            </div>
        </div>
    </div>
</div>




<link rel="stylesheet" href="summernote/summernote.css">
<script type="text/javascript" src="summernote/summernote.js"></script>


<script type="text/javascript">
	$(document).ready(function() {

		/*设置分类名称*/
		$("#c_id").on('change',function(){
			$("#category").val($('#c_id option:selected').text());  
		});

		$('.summernote').summernote({
			// height: 300,
			tabsize: 2,//调用图片上传
			callbacks:{
				onImageUpload:function(files){
					sendFile(files[0],'.summernote');   //第二个参数要和上面一样
				}
			}
		});

		/*summernote上传图片*/
	    function sendFile(file,summernote) {
	        var formData = new FormData();
	        formData.append("file", file);
	        $.ajax({
	            url: "<?=site_url('upload/summernote')?>",  //上传图片URL
	            data: formData,
	            cache: false,
	            contentType: false,
	            processData: false,
	            type: 'POST',
	            success: function (data) {
	            	if(data.status){
	            		$(summernote).summernote('insertImage',data.image,'img');
	            	}else{
	            		console.log(data.error);
	            		alert('图片上传出错');
	            	}
	            }
	        });
	    }
	});
</script>
<div class="panel box-shadow-none content-header">
    <div class="panel-body">
        <div class="col-md-12">
            <h3 class="animated fadeInLeft">菜单管理</h3>
            <p class="animated fadeInDown">
                菜单 <span class="fa-angle-right fa"></span> 新增
            </p>
        </div>
    </div>
</div>

<div class="col-md-12 padding-0">
    <div class="col-md-12">
        <div class="col-md-12 panel">
            <div class="col-md-12 panel-heading">
                <a href="javascript:history.back(-1);" class="btn btn-default right">返回</a>
                <h4>创建新的文章</h4>
            </div>

            <div class="col-md-12 panel-body">
                <form method="post" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">文章标题：</label>
                        <div class="col-sm-10">
                            <input type="text" name="title" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">展示文章发表人：</label>
                        <div class="col-sm-10">
                            <input type="text" name="username" value="<?= session('username') ?>" class="form-control">
                        </div>
                    </div>

                    <?php if (isset($nav)) : ?>
                        <div class="form-group">
                            <label class="col-sm-2 control-label text-right">所属导航栏 </label>
                            <div class="col-sm-10">

                                <select name="nav_id" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                                    <option value="">请选择</option>
                                    <?php foreach ($nav as $key => $value) : ?>
                                        <option value="<?= $value->id ?>"><?= $value->display ?></option>
                                    <?php endforeach; ?>
                                </select>

                            </div>
                        </div>
                    <?php endif; ?>

                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">文章分类：</label>
                        <div class="col-sm-10">
                            <div class="input-group col-sm-10">

                                <select name="c_id" class="form-control" id="c_id" aria-describedby="basic-addon3">
                                    <option value="">请选择</option>
                                    <?php if (isset($categoryAll)) : ?>
                                        <?php foreach ($categoryAll as $key => $value) : ?>
                                            <option value="<?= $value->id ?>"><?= $value->category ?></option>
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </select>
                                <span class="input-group-addon" id="basic-addon3"><a href="<?= site_url('articleCategory/create') ?>">新增分类</a></span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">是否原创：</label>
                        <div class="col-sm-10">
                            <select name="is_original" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                                <option value="">请选择</option>
                                <option value="0" selected="selected">原创</option>
                                <option value="1">转载</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">SEO标题</label>
                        <div class="col-sm-10">
                            <input name="seo_title" id="form-field-11" class="autosize-transition form-control" placeholder="SEO标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">SEO关键词</label>
                        <div class="col-sm-10">
                            <input name="seo_keywords" id="form-field-11" class="autosize-transition form-control" placeholder="SEO关键词">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">SEO描述</label>
                        <div class="col-sm-10">
                            <textarea name="seo_description" id="form-field-11" class="autosize-transition form-control" placeholder="SEO描述"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">文章摘要</label>
                        <div class="col-sm-10">
                            <textarea name="summary" id="form-field-11" class="autosize-transition form-control" placeholder="请输入文章摘要"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right">文章内容</label>
                        <div class="col-sm-10">
                            <textarea class="summernote" name="content" placeholder="请输入文章内容"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label text-right"> </label>
                        <div class="col-sm-10">
                            <input type="hidden" name="category" id="category" value="">

                            <input class="submit btn btn-danger" type="submit" value="提交">
                            &nbsp; &nbsp; &nbsp;
                            <input class="btn btn-default" type="reset" value="重置">
                        </div>
                    </div>


                </form>

            </div>
        </div>
    </div>
</div>



<link rel="stylesheet" type="text/css" href="asset/css/plugins/summernote.css" />
<link rel="stylesheet" type="text/css" href="asset/css/plugins/normalize.css" />

<script src="asset/js/plugins/icheck.min.js"></script>
<script src="asset/js/plugins/summernote.min.js"></script>


<script type="text/javascript">
    $(document).ready(function() {
        /*设置分类名称*/
        $("#c_id").on('change', function() {
            $("#category").val($('#c_id option:selected').text());
        });

        $('input').iCheck({
            checkboxClass: 'icheckbox_flat-red',
            radioClass: 'iradio_flat-red'
        });

        $('.summernote').summernote({
            lang: 'zh-CN',
            height: 300,
            //调用图片上传
            callbacks: {
                onImageUpload: function(files) {
                    sendFile(files[0], '.summernote'); //第二个参数要和上面一样
                }
            }
        });

        /*summernote上传图片*/
        function sendFile(file, summernote) {
            var formData = new FormData();
            formData.append("file", file);
            $.ajax({
                url: "<?= site_url('upload/summernote') ?>", //上传图片URL
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function(data) {
                    if (data.status) {
                        $(summernote).summernote('insertImage', data.image, 'img');
                    } else {
                        console.log(data.error);
                        alert('图片上传出错');
                    }
                }
            });
        }

        $('.mail-wrapper').find('.mail-left').css('height', $('.mail-wrapper').innerHeight());
    });
</script>
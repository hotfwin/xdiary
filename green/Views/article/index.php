<!-- Main -->
<div id="main" class="wrapper style1">
    <div class="container">
        <!-- <header class="major">
			<h2>Linux文章列表</h2>
			<p>这里做个简单的文章列表页</p>
		</header> -->

        <!-- Lists -->
        <section>
            <h3>技术派文章大全</h3>
            <div class="row">
                <div class="6u 12u(xsmall)">

                    <h4>最新发表</h4>
                    <ul>
                        <?php foreach ($list as $key => $value) : ?>
                            <a href="<?= site_url('article/detail/' . $value->id) ?>" title="<?= $value->title ?>" target="_blank" style="color:rgba(255, 255, 255, 0.75)">
                                <li><?= $value->title ?></li>
                            </a>
                        <?php endforeach; ?>
                    </ul>

                    <h4>文章列表</h4>
                    <ul class="alt">
                        <?php foreach ($list as $key => $value) : ?>
                            <li><a href="<?= site_url('article/detail/' . $value->id) ?>" title="<?= $value->title ?>" target="_blank" style="color:rgba(255, 255, 255, 0.75);border-bottom:none;"><?= $value->title ?></a></li>
                        <?php endforeach; ?>
                        <li>
                            <div class="col-md-6">
                                <div class="pull-right">
                                    <?= $pager->links() ?>
                                </div>
                            </div>
                        </li>

                    </ul>


                </div>
                <div class="6u 12u(xsmall)">

                    <h4>访问量前十</h4>
                    <ol>
                        <?php foreach ($list as $key => $value) : ?>
                            <a href="<?= site_url('article/detail/' . $value->id) ?>" title="<?= $value->title ?>" target="_blank" style="color:rgba(255, 255, 255, 0.75)">
                                <li><?= $value->title ?></li>
                            </a>
                        <?php endforeach; ?>
                    </ol>



                </div>
            </div>
        </section>

    </div>

</div>
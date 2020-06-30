<?php

/***
 *|----------------------------
 *| ArticleCategory.php
 *|----------------------------
 *|  
 *| 问题：  
 *|------------------------------------------------------------------------
 *| Author:临来笑笑生     Email:luck@gust.cn      Modify: 2020.06.30
 *|------------------------------------------------------------------------
 * ***/

namespace App\Controllers;

class ArticleCategory extends FortuneController
{
    public function index()
    {
        $category = $this->request->getGet('category');
        if ($category) {
            $this->like['category'] = $category;
        }

        $show = $this->request->getGet('show');
        if ($show != '') {
            $this->where['show'] = $show;
        }

        parent::index();
    }
    public function test()
    {
        $articleModel = new \App\Models\ArticleModel();
        echo $articleModel->test();

        exit('kkk');
    }

    protected function beforeCreate(&$post)
    {
        $this->rules = [
            'category' => 'required|min_length[2]|max_length[116]'
        ];    //校验表单

    }
}

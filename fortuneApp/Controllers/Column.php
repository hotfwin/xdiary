<?php

/***
 *|----------------------------
 *| Column.php
 *|----------------------------
 *|  
 *| 问题：  
 *|------------------------------------------------------------------------
 *| Author:临来笑笑生     Email:luck@gust.cn      Modify: 2020.06.30
 *|------------------------------------------------------------------------
 * ***/

namespace App\Controllers;

class Column extends FortuneController
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

    protected function beforeCreate(&$post)
    {
        $this->rules = [
            'title' => 'required|min_length[2]|max_length[116]'
        ];    //校验表单

        $post['create'] = time();    //创建时间
    }
}

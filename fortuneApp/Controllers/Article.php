<?php

/***
 *|----------------------------
 *| Admins.php
 *|----------------------------
 *| 后台用户
 *| 问题：  
 *|------------------------------------------------------------------------
 *| Author:临来笑笑生     Email:luck@gust.cn      Modify: 2020.06.12
 *|------------------------------------------------------------------------
 * ***/

namespace App\Controllers;

class Article extends FortuneController
{
    public function index()
    {
        $title=$this->request->getGet('title');
        if($title){
            $this->like['title']=$title;
        }

        // 处理搜索“创建日期”
        $create=$this->request->getGet('create');
        if($create){
            $start=strtotime($create.' 0:0:0');
            $end=strtotime($create.' 23:59:59');
            $this->where['create >=']=" $start";
            $this->where['create <=']=" $end";
        }

        $is_original=$this->request->getGet('is_original');
        if($is_original!=''){
            $this->where['is_original']=$is_original;
        }

        parent::index();
    }
    public function test(){
        exit('kkk');
    }

}

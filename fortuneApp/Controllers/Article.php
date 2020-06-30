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
        $title = $this->request->getGet('title');
        if ($title) {
            $this->like['title'] = $title;
        }

        $available=$this->request->getGet('available');
        if($available!=''){
            $this->where['available']=$available;
        }

        $category_id=$this->request->getGet('category_id');
        if($category_id!=''){
            $this->where['category_id']=$category_id;
        }

        // 处理搜索“创建日期”
        $create = $this->request->getGet('create');
        if ($create) {
            $start = strtotime($create . ' 0:0:0');
            $end = strtotime($create . ' 23:59:59');
            $this->where['create >='] = " $start";
            $this->where['create <='] = " $end";
        }

        parent::index();
    }

    public function beforeCreate(&$post)
    {
        //这里检验不生效，不能返回上上层
        $this->rules = [
            'title' => 'required|min_length[3]|max_length[186]',
        ];    //校验表单

        if (!isset($post['title']) || empty($post['title'])) {
            return $this->showMessage('文章标题不能为空', FALSE);
        }

        if (!isset($post['content']) || empty($post['content'])) {
            return $this->showMessage('文章内容不能为空', FALSE);
        }

        $articleContentModel = new \App\Models\ArticleContentModel();
        $contentID = $articleContentModel->insert(['content' => $post['content']]);

        if (!$contentID) {
            return $this->showMessage('插入文章内容出错', FALSE);
        }

        unset($post['content']);
        unset($post['files']);
        $post['content_id'] = $contentID;
        $post['user_id'] = session('id');
        $post['create'] = time();
    }

    public function beforeEdit(&$post)
    {
        //这里检验不生效，不能返回上上层
        $this->rules = [
            'title' => 'required|min_length[3]|max_length[186]',
        ];    //校验表单

        if (!isset($post['title']) || empty($post['title'])) {
            return $this->showMessage('文章标题不能为空', FALSE);
        }

        if (!isset($post['content']) || empty($post['content'])) {
            return $this->showMessage('文章内容不能为空', FALSE);
        }

        $articleContentModel = new \App\Models\ArticleContentModel();
        if ($post['content_id']) {
            $result=$articleContentModel->update($post['content_id'],['content' => $post['content']]);
            if (!$result) {
                return $this->showMessage('更新文章内容出错', FALSE);
            }
        } else {
            $contentID = $articleContentModel->insert(['content' => $post['content']]);
            if (!$contentID) {
                return $this->showMessage('插入文章内容出错', FALSE);
            }
            $post['content_id'] = $contentID;
        }

        unset($post['content']);
        unset($post['files']);    //去掉summernote图片上传

        // print_r($post);exit;
    }

    public function test()
    {
        $articleModel = new \App\Models\ArticleModel();
        echo $articleModel->test();

        exit('kkk');
    }
}

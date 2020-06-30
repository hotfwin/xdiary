<?php

/***
 *|----------------------------
 *| Article.php
 *|----------------------------
 *| 核心控制器
 *| 问题：  
 *|------------------------------------------------------------------------
 *| Author:临来笑笑生     Email:luck@elapse.date     Modify: 2020.05.12
 *|------------------------------------------------------------------------
 * ***/

namespace App\Controllers;

class Article extends MyController
{
	public function index()
	{

		//SELECT * FROM `article` ORDER BY `id` desc LIMIT 13

		$articleModel = new \App\Models\ArticleModel();
		$articleModel->orderBy('id desc');

		$this->data['total'] = $articleModel->countAllResults(false);
		$this->data['list'] = $articleModel->paginate(config('Pager')->perPage);
		$this->data['pager'] = $articleModel->pager;

		return $this->view('article/index');
	}

	public function detail($id)
	{
		$articleModel=new \App\Models\ArticleModel();
		$detail=$articleModel->find($id);

		//取得文章内容
		$articleContentModel=new \App\Models\ArticleContentModel();
		$content=$articleContentModel->find($detail->content_id);
		$detail->content=$content?$content->content:false;

		$this->data['detail']=$detail;
		return $this->view('article/detail');

	}

	public function indexYL()
	{

		/* 加载数据模型 */
		$modelName = '\\App\\Models\\' . ucfirst($this->className) . 'Model';
		$this->model = new $modelName();

		$this->model->select($this->select);

		// $this->model->where('parent','');
		if ($this->where) {
			$this->model->where($this->where);
		}

		if ($this->like) {
			$this->model->like($this->like);
		}

		foreach ($this->join as $key => $value) {
			$this->model->join($value['table'], $value['cond'], $value['type']);
			// $this->model->join('goods_class','goods_class.id = goods.cid','LEFT');
			//使用：
			//    $this->join[] = ['table' => 'goods_class', 'cond' => 'goods_class.id = goods.cid', 'type' => 'LEFT',];
		}

		$this->model->orderBy($this->orderBy ?: $this->model->table . '.id DESC');

		// $this->data['list'] = $this->model->findAll();
		$this->data['total'] = $this->model->countAllResults(false);
		$this->data['list'] = $this->model->paginate(config('Pager')->perPage);
		$this->data['pager'] = $this->model->pager;

		// echo $this->model->pager->links();exit('输出分页');

		// exit(strtolower($this->className).'/index');

		echo $this->view(strtolower($this->className) . '/index');
	}
}

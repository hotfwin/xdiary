<?php

/***
 *|----------------------------
 *| MyController.php
 *|----------------------------
 *| 核心控制器
 *| 问题：  
 *|------------------------------------------------------------------------
 *| Author:临来笑笑生     Email:luck@elapse.date     Modify: 2020.05.12
 *|------------------------------------------------------------------------
 * ***/

namespace App\Controllers;

use CodeIgniter\Controller;

class MyController extends Controller
{
	protected $data = [];
	protected $helpers = [];


	public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
	{
		parent::initController($request, $response, $logger);

		//--------------------------------------------------------------------
		// Preload any models, libraries, etc, here.
		//--------------------------------------------------------------------
		// E.g.:
		$this->session = \Config\Services::session();

		$this->className = $this->request->uri->getSegment(1) ?: \Config\Services::routes()->getDefaultController();
		$this->data['className'] = $this->className;
	}

	/***
	 *|----------------------------
	 *| view自动加载数据到视图，加载头和尾
	 *|----------------------------
	 *|  封装加上头和尾
	 *|------------------------------------------------------ 
	 * ***/
	public function view(string $name, array $data = [], array $options = []): string
	{
		$renderer = \Config\Services::renderer();  //CodeIgniter\View\View $renderer

		$config = new \Config\View();
		$saveData = $config->saveData;

		if (array_key_exists('saveData', $options)) {
			$saveData = (bool) $options['saveData'];
			unset($options['saveData']);
		}

		$data = $this->data + $data;
		// $data=array_merge($this->data,$data);

		$templates = $renderer->setData($data, 'raw')->render('templates/header', $options, $saveData);
		$templates .= $renderer->setData($data, 'raw')->render($name, $options, $saveData);
		$templates .= $renderer->setData($data, 'raw')->render('templates/footer', $options, $saveData);

		return $templates;
	}

	public function testView()
	{
		$viewPath = APPPATH . 'Views/';
		exit($viewPath);
		if (!file_exists(APPPATH . '/Views/luck.php')) {
			exit('不存在视图');
		}
		$data['title'] = '幸运的';

		echo view('luck', $data);
	}
}

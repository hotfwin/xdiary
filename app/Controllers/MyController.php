<?php

namespace App\Controllers;

use CodeIgniter\Controller;

class MyController extends Controller
{
	protected $data=[];

	protected $helpers = [];


	public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
	{
		parent::initController($request, $response, $logger);

		//--------------------------------------------------------------------
		// Preload any models, libraries, etc, here.
		//--------------------------------------------------------------------
		// E.g.:
		// $this->session = \Config\Services::session();
	}

	public function testView(){
		$viewPath=APPPATH.'Views/';
		exit($viewPath);
		if(!file_exists(APPPATH.'/Views/luck.php')){
            exit('不存在视图');
        }
        $data['title']='幸运的';

        echo view('luck',$data);
	}
}
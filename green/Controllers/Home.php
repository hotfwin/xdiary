<?php

namespace App\Controllers;

class Home extends MyController
{
	public function index()
	{
		
		// echo echoLuck();exit;
		return view('welcome_message');
	}

	//--------------------------------------------------------------------

}

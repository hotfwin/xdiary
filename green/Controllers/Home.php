<?php

namespace App\Controllers;

class Home extends MyController
{
	public function index()
	{
		return view('welcome_message');
	}

	//--------------------------------------------------------------------

}

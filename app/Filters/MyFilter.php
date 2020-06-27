<?php

namespace App\Filters;

use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\Filters\FilterInterface;

class MyFilter implements FilterInterface
{
    public function before(\CodeIgniter\HTTP\RequestInterface $request)
    {
        echo '前过<br>';
    }

    public function after(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response)
    {
        
    }
}

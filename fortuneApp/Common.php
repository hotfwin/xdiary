<?php

/**
 * The goal of this file is to allow developers a location
 * where they can overwrite core procedural functions and
 * replace them with their own. This file is loaded during
 * the bootstrap process and is called during the frameworks
 * execution.
 *
 * This can be looked at as a `master helper` file that is
 * loaded early on, and may also contain additional functions
 * that you'd like to use throughout your entire application
 *
 * @link: https://codeigniter4.github.io/CodeIgniter4/
 */

// exit('公用函数定在这里');

if (! function_exists('echoLuck'))
{
	function echoLuck(string $name='临来笑笑生')
	{
		return $name;
	}
}



//改造这个，使后台分页适应
if (! function_exists('current_url'))
{
	/**
	 * Current URL
	 *
	 * Returns the full URL (including segments) of the page where this
	 * function is placed
	 *
	 * @param boolean $returnObject True to return an object instead of a strong
	 *
	 * @return string|\CodeIgniter\HTTP\URI
	 */
	function current_url(bool $returnObject = false)
	{
		$uri = clone service('request')->uri;

		// echo $uri;echo '<hr>';

		$baseURL=config('App')->baseURL;
		$baseURL.=config('App')->indexPage.'/';


		// If hosted in a sub-folder, we will have additional
		// segments that show up prior to the URI path we just
		// grabbed from the request, so add it on if necessary.
		$baseUri = new \CodeIgniter\HTTP\URI($baseURL);

		// echo $baseUri;echo '<hr>';

		if (! empty($baseUri->getPath()))
		{
			$path = rtrim($baseUri->getPath(), '/ ') . '/' . $uri->getPath();

			$uri->setPath($path);
		}

 

		// Since we're basing off of the IncomingRequest URI,
		// we are guaranteed to have a host based on our own configs.
		return $returnObject
			? $uri
			: (string)$uri->setQuery('');
	}
}


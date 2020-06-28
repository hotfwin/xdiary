<?php

/***
 *|----------------------------
 *| ArticleModel.php
 *|----------------------------
 *|  
 *| 问题：  
 *|------------------------------------------------------------------------
 *| Author:临来笑笑生     Email:luck@elapse.date     Modify: 2020.06.15
 *|------------------------------------------------------------------------
 * ***/

namespace App\Models;

class ArticleModel extends \CodeIgniter\Model
{
    protected $table = 'article';
    protected $primaryKey = 'id';
    protected $returnType = 'object';     //设置返回结果为对象
    protected $allowedFields = [
        'title', 'cover', 'summary', 'seo_title','seo_keywords',
        'seo_description', 'content_id', 'c_id', 'category',
        'is_original','nav_id','visit','collect','share','user_id',
        'username','create','last_time',
    ];
}

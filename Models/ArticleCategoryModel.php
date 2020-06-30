<?php

/***
 *|----------------------------
 *| ArticleCategoryModel.php
 *|----------------------------
 *|  
 *| 问题：  
 *|------------------------------------------------------------------------
 *| Author:临来笑笑生     Email:luck@elapse.date     Modify: 2020.06.30
 *|------------------------------------------------------------------------
 * ***/

namespace App\Models;

class ArticleCategoryModel extends \CodeIgniter\Model
{
    protected $table = 'article_category';
    protected $primaryKey = 'id';
    protected $returnType = 'object';     //设置返回结果为对象
    protected $allowedFields = [
        'id', 'category', 'seo_title', 'seo_keywords', 'seo_description',
        'show', 'order_by', 'modify_id', 'modify_time',
        'create_id', 'create_time',
    ];
}

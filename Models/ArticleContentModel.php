<?php

/***
 *|----------------------------
 *| ArticleContentModel.php
 *|----------------------------
 *|  
 *| 问题：  
 *|------------------------------------------------------------------------
 *| Author:临来笑笑生     Email:luck@elapse.date     Modify: 2020.06.15
 *|------------------------------------------------------------------------
 * ***/

namespace App\Models; 

class ArticleContentModel extends \CodeIgniter\Model
{
    protected $table = 'article_content';
    protected $primaryKey = 'id';
    protected $returnType = 'object';     //设置返回结果为对象
    protected $allowedFields = [
        'id', 'content',
    ];

    public function test(){
        return 'kkk';
    }
}

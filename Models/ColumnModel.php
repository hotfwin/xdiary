<?php

/***
 *|----------------------------
 *| ColumnModel.php
 *|----------------------------
 *|  
 *| 问题：  
 *|------------------------------------------------------------------------
 *| Author:临来笑笑生     Email:luck@elapse.date     Modify: 2020.06.30
 *|------------------------------------------------------------------------
 * ***/

namespace App\Models;

class ColumnModel extends \CodeIgniter\Model
{
    protected $table = 'column';
    protected $primaryKey = 'id';
    protected $returnType = 'object';     //设置返回结果为对象
    protected $allowedFields = [
        'id', 'title', 'subhead', 'surface_plot', 'author','excerpt',
        'price', 'visit', 'collect', 'amount','complete','seo_title',
        'seo_keywords','seo_description','create_id', 'create',
    ];
}

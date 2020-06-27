<?php

namespace App\Models;

class RecordModel extends \CodeIgniter\Model
{
    protected $table = 'record';
    protected $primaryKey = 'id';
    protected $returnType = 'object';     //设置返回结果为对象
    protected $allowedFields = [
        'id', 'table_id', 'table_name', 'user_id', 'username', 'action', 'ip', 'record_time'
    ];
}

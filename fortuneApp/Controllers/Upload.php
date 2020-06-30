<?php

/***
 *|----------------------------
 *| Upload.php
 *|----------------------------
 *| 处理图片上传
 *| 问题：  
 *|------------------------------------------------------------------------
 *| Author:临来笑笑生     Email:luck@gust.cn      Modify: 2020.06.30
 *|------------------------------------------------------------------------
 * ***/

namespace App\Controllers;

class Upload extends FortuneController
{
    /*处理summernote图片上传*/
    public function summernote()
    {
        // echo 'summernotel图片上传';
        $show['status'] = FALSE;

        $file = $this->request->getFile('file');  //取得单文件

        if (!$file->isValid()) {
            $show['error'] = $file->getErrorString() . $file->getError();
            //输出json数据
            $this->response->setHeader('Access-Control-Allow-Origin', '*');
            return $this->response->setJSON($show);
        }

        $path = 'static/uploads/';      //文件上传路径

        $newName = $file->getRandomName();        //产生随机文件名
        $originalName = $file->getClientName();   //客户端上传的原文件名
        $extension = $file->getExtension();      //文件夹扩展名字(jpg)
        $type = $file->getType();     //文件的媒体类型(file)

        /**把文件从临时文件中移到上传的路径 */
        if (!$file->hasMoved()) {
            $file->move($path, $newName);
        }

        $show['status'] = TRUE;
        $show['image'] = base_url($path . $newName);

        $this->response->setHeader('Access-Control-Allow-Origin', '*');
        return $this->response->setJSON($show);
    }
}

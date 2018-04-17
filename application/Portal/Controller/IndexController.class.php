<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace Portal\Controller;
use Common\Controller\HomebaseController; 
/**
 * 首页
 */
class IndexController extends HomebaseController {
	
    //首页
	public function index() {
		$ids=4;
        $cid = sp_get_child_terms($ids);
        foreach($cid as $v){$c_id[]=$v['term_id'];}
        $cc = !empty($c_id)?($ids.','.join(',',$c_id)):$ids;
		$postss=sp_sql_posts("cid:$cc;order:listorder asc;limit:0,3");
		$this->assign("postss",$postss);
		
		//获取滚动图片
		$ids1=12;
        $cid1 = sp_get_child_terms($ids1);
        foreach($cid1 as $v){$c_ids[]=$v['term_id'];}
        $cc1 = !empty($c_ids)?($ids1.','.join(',',$c_ids)):$ids1;
		$postsss=sp_sql_posts("cid:$cc1;order:listorder asc;limit:0,10");
		$this->assign("postsss",$postsss);
		
    	$this->display(":index");
    }

}



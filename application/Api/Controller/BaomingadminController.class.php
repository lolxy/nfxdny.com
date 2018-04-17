<?php
namespace Api\Controller;
use Common\Controller\AdminbaseController;
class BaomingadminController extends AdminbaseController{
	
	protected $baoming_model;
	
	function _initialize() {
		parent::_initialize();
		$this->baoming_model=D("Common/Baoming");
	}
	
	function index(){
		$count=$this->baoming_model->where(array("status"=>1))->count();
		$page = $this->page($count, 20);
		$baomingmsgs=$this->baoming_model->where(array("status"=>1))->order(array("createtime"=>"DESC"))->limit($page->firstRow . ',' . $page->listRows)->select();
		$this->assign("Page", $page->show('Admin'));
		$this->assign("baomingmsgs",$baomingmsgs);
		$this->display();
	}

	function delete(){
		$id=intval(I("get.id"));
		$result=$this->baoming_model->where(array("id"=>$id))->delete();
		if($result!==false){
			$this->success("删除成功！", U("Baomingadmin/index"));
		}else{
			$this->error('删除失败！');
		}
	}
}
<?php
namespace Api\Controller;
use Common\Controller\AppframeController;
class BaomingController extends AppframeController{
	
	protected $baoming_model;
	
	function _initialize() {
		parent::_initialize();
		$this->baoming_model=D("Common/Baoming");
	}
	
	function index(){
		
	}
	
	function addmsg(){
		/*if(!sp_check_verify_code()){
			$this->error("验证码错误！");
		}*/
		
		if (IS_POST) {
			if ($this->baoming_model->create()) {
				$result=$this->baoming_model->add();
				if ($result!==false) {
					$this->success("报名成功！");
				} else {
					$this->error("报名失败！");
				}
			} else {
				$this->error($this->baoming_model->getError());
			}
		}
		
	}
}
<?php
namespace Common\Model;
use Common\Model\CommonModel;
class BaomingModel extends CommonModel{
	//自动验证
	protected $_validate = array(
			//array(验证字段,验证规则,错误提示,验证条件,附加规则,验证时间)
			array('bm_num', 'require', '报名人数不能为空！', 1, 'regex', CommonModel:: MODEL_BOTH ),
			array('bm_date', 'require', '入驻时间不能为空！', 1, 'regex', CommonModel:: MODEL_BOTH ),
			array('bm_tel', 'require', '联系电话不能为空！', 1, 'regex', CommonModel:: MODEL_BOTH ),
			array('bm_name', 'require', '联系人不能为空！', 1, 'regex', CommonModel:: MODEL_BOTH ),
	);
	
	protected $_auto = array (
			array('createtime','mDate',1,'callback'), // 对msg字段在新增的时候回调htmlspecialchars方法
	);
	
	function mDate(){
		return date("Y-m-d H:i:s");
	}
	
	protected function _before_write(&$data) {
		parent::_before_write($data);
	}
	
}
<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
	<html>
	<head>
<title><?php echo ($site_seo_title); ?> <?php echo ($site_name); ?></title>
<meta name="keywords" content="<?php echo ($site_seo_keywords); ?>" />
<meta name="description" content="<?php echo ($site_seo_description); ?>">
	<?php  function _sp_helloworld(){ echo "hello ThinkCMF!"; } function _sp_helloworld2(){ echo "hello ThinkCMF2!"; } function _sp_helloworld3(){ echo "hello ThinkCMF3!"; } ?>
	<?php $portal_index_lastnews="2"; $portal_hot_articles="1,2"; $portal_last_post="1,2"; $tmpl=sp_get_theme_path(); $default_home_slides=array( array( "slide_name"=>"ThinkCMFX2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/1.jpg", "slide_url"=>"", ), array( "slide_name"=>"ThinkCMFX2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/2.jpg", "slide_url"=>"", ), array( "slide_name"=>"ThinkCMFX2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/3.jpg", "slide_url"=>"", ), ); ?>
	<meta name="author" content="">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">   --> 
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">
   	<!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
	<link rel="icon" href="/themes/nfxdny/Public/images/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="/themes/nfxdny/Public/images/favicon.ico" type="image/x-icon">
    <link href="/themes/nfxdny/Public/css/text.css" rel="stylesheet" type="text/css">
	<link href="/themes/nfxdny/Public/css/anythingslider.css" rel="stylesheet" type="text/css">
	<!--[if IE 7]>
	<link rel="stylesheet" href="/themes/nfxdny/Public/simpleboot/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
	<![endif]-->
	
<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "/",
    JS_ROOT: "public/js/",
    TOKEN: ""
};
</script>
<script type="text/javascript" src="/themes/nfxdny/Public/js/jquery.js"></script>
<script type="text/javascript" src="/themes/nfxdny/Public/js/01.js"></script>

<script type="text/javascript" src="/themes/nfxdny/Public/js/Validform_v5.3.2_min.js"></script>
<script src="http://api.map.baidu.com/api?v=1.3"></script>
<style>
/*==========以下部分是Validform必须的===========*/
.Validform_checktip{
	margin-left:8px;
	line-height:20px;
	height:20px;
	overflow:hidden;
	color:#999;
	font-size:12px;
}
.Validform_right{
	color:#71b83d;
	padding-left:20px;
	background:url(../images/right.png) no-repeat left center;
}
.Validform_wrong{
	color:red;
	padding-left:20px;
	white-space:nowrap;
	background:url(../images/error.png) no-repeat left center;
}
.Validform_loading{
	padding-left:20px;
	background:url(../images/onLoad.gif) no-repeat left center;
}
.Validform_error{
	background-color:#ffe7e7;
}
#Validform_msg{color:#7d8289; font: 12px/1.5 tahoma, arial, \5b8b\4f53, sans-serif; width:280px; -webkit-box-shadow:2px 2px 3px #aaa; -moz-box-shadow:2px 2px 3px #aaa; background:#fff; position:absolute; top:0px; right:50px; z-index:99999; display:none;filter: progid:DXImageTransform.Microsoft.Shadow(Strength=3, Direction=135, Color='#999999');}
#Validform_msg .iframe{position:absolute; left:0px; top:-1px; z-index:-1;}
#Validform_msg .Validform_title{line-height:25px; height:25px; text-align:left; font-weight:bold; padding:0 8px; color:#fff; position:relative; background-color:#22AC38;}
#Validform_msg a.Validform_close:link,#Validform_msg a.Validform_close:visited{line-height:22px; position:absolute; right:8px; top:0px; color:#fff; text-decoration:none;}
#Validform_msg a.Validform_close:hover{color:#cc0;}
#Validform_msg .Validform_info{padding:8px;border:1px solid #22AC38; border-top:none; text-align:left;}
</style>
</head>

<body>
<?php echo hook('body_start');?>
<?php $home_slides=sp_getslide("inner_slider"); $home_slides=empty($home_slides)?$default_home_slides:$home_slides; ?>
<div class="top">
  <div id="navmenu">
      <?php
 $effected_id="navi1"; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label <b class='caret'></b></a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style="nav"; $showlevel=6; $dropdown='dropdown'; echo sp_get_menu("2",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
      <div style="margin-left:18px">
	  <a style="background:none" href="http://www.nfxdny.com/">
	  <img src="<?php echo sp_get_asset_upload_path($site_logo);?>" alt="" width="147" height="86"></a>
	  </div>
      <?php
 $effected_id="navi2"; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label <b class='caret'></b></a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style="nav"; $showlevel=6; $dropdown='dropdown'; echo sp_get_menu("3",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
	  </div>
</div>

<!--Banner-->
<?php foreach($home_slides as $vo){ $imgs[]=sp_get_asset_upload_path($vo['slide_pic']); } $img = join("|",$imgs); ?>
<!--flash-->
<div class="banner_n">
<script src="/themes/nfxdny/Public/js/AC_RunActiveContent.js" type="text/javascript"></script>
<embed width="100%" height="379" src="/themes/nfxdny/Public/js/bcastr.swf" quality="high" wmode="transparent" flashvars="bcastr_file=<?php echo ($img); ?>&amp;bcastr_config=0x008000:fontcolor|4:fontform|0x008000:fontbgcolor|0:fonttouming|0xffffff:anjiancolor|0xE89B00:bottoncolor|0xE89B00:nowbottoncolor|5:palytime|3:picclass|1:botton|_blank:winodws " type="application/x-shockwave-flash"> 
</div>
<!--end flash-->
<!--Banner end-->
<!-- mian-->
<div class="main_n">
      <!--side -->
     <div class="side">
         <h1><a href="<?php echo leuu('page/index',array('id'=>2));?>">关于我们</a></h1>
         <ul>
                  
  <li><a href="<?php echo leuu('page/index',array('id'=>2));?>">农庄简介</a></li>
 
  <li><a href="<?php echo leuu('page/index',array('id'=>3));?>">农庄文化</a></li>
 
  <li><a href="<?php echo leuu('list/index',array('id'=>22));?>">农庄荣誉</a></li>
 
  <li><a href="<?php echo leuu('list/index',array('id'=>3));?>">农庄摄影</a></li>
 
  <li><a href="<?php echo leuu('page/index',array('id'=>5));?>">联系我们</a></li>
 
       </ul>
         <a href="<?php echo leuu('page/index',array('id'=>5));?>"><img src="/themes/nfxdny/Public/images/about_14.jpg" alt=""></a>
<p>
	联系人：<?php echo ($lianxiren); ?><br>
	手　机：<?php echo ($shouji); ?><br>
	电　话：<?php echo ($dianhua); ?><br>
	地　址：<?php echo ($address); ?><br>
</p>
</div>
	  <!--end side -->
	  
<!--con-->
   <div class="con">
   <div class="title"><span>您当前所在位置：<a href="/">首页</a> &gt; 在线留言</span>
   <h1>在线留言</h1></div>
   <div class="con1">
<p class="xx">
　　年丰农业现有面积450余亩。水果品种：夏黑、美人指、巨峰、无核四号、美国红提、杨梅、油桃、樱桃。产品畅销全国。</p>
 <form class="form-light js-ajax-form" role="form" method="post" action="<?php echo U('api/guestbook/addmsg');?>"> 　
<table width="97%" border="0" align="left" cellpadding="0" cellspacing="0">
                                           
			  <tbody><tr>
			    <td width="20%" height="35" align="right">姓　名：</td>
			    <td width="80%" align="left"><input type="text" style="width:150px" name="full_name" id="winto_names" value="" datatype="*" nullmsg="姓名不能为空">
				<font color="red"> * </font> <span style="margin-top:5px">必填</span></td>
			  </tr>
                                              
			  <tr>
			    <td width="20%" height="35" align="right">公司名称：</td>
			    <td width="80%" align="left"><input type="text" style="width:150px" name="company_name" id="winto_company" value="" datatype="*" nullmsg="公司名称不能为空">
				<font color="red"> * </font></td>
			  </tr>
                                              
			  <tr>
			    <td width="20%" height="35" align="right">公司地址：</td>
			    <td width="80%" align="left"><input type="text" style="width:200px" name="company_address" id="winto_address" value=""></td>
			  </tr>
                                              
			  <tr>
			    <td width="20%" height="35" align="right">E-mail：</td>
			    <td width="80%" align="left"><input type="text" style="width:180px" name="email" id="winto_email" value="" datatype="e" errormsg="邮箱格式输入有误"></td>
			  </tr>
                                              
			  <tr>
			    <td width="20%" height="35" align="right">电　话：</td>
			    <td width="80%" align="left"><input type="text" style="width:150px" name="company_tel" id="winto_tel" value="" datatype="*" nullmsg="公司电话不能为空">
				<font color="red"> * </font></td>
			  </tr>
                                              
			  <tr>
			    <td width="20%" height="35" align="right">传　真：</td>
			    <td width="80%" align="left"><input type="text" style="width:150px" name="company_fax" id="winto_fax" value=""></td>
			  </tr>
                                              
			  <tr>
			    <td width="20%" height="35" align="right">主　题：</td>
			    <td width="80%" align="left"><input type="text" style="width:220px" name="title" id="title" value=""></td>
			  </tr>
                                              
			  <tr>
			    <td width="20%" height="35" align="right">内 容：</td>
			    <td width="80%"><textarea id="Content" name="msg" rows="10" cols="60" datatype="*" nullmsg="留言内容不能为空"></textarea>
				<font color="red">*</font>  
			      </td>
			 </tr>
          <tr align="center">
            <td height="30" colspan="4"><button type="submit" class="btn btn-primary js-ajax-submit" data-wait="1500">发送留言</button></td>
          </tr>
                              
      </tbody></table>
      </form>  
   </div>
   </div>
   <!--end con-->
   <div class="qc"></div>
</div>
<!--end mian-->
<?php echo hook('footer');?>
<div class="footer_bg">
   <div class="footer">
   <?php
 $effected_id="navi3"; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label <b class='caret'></b></a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style="nav"; $showlevel=6; $dropdown='dropdown'; echo sp_get_menu("5",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
   <!-- 
<a href="/" title="网站首页">网站首页</a> | 
<a href="<?php echo leuu('page/index',array('id'=>2));?>" title="农庄简介">农庄简介</a> | 
<a href="<?php echo leuu('page/index',array('id'=>3));?>" title="农庄文化">农庄文化</a> | 
<a href="<?php echo leuu('list/index',array('id'=>3));?>" title="农庄摄影">农庄摄影</a> | 
<a href="<?php echo leuu('list/index',array('id'=>4));?>" title="农庄动态">农庄动态</a> | 
<a href="<?php echo leuu('list/index',array('id'=>12));?>" title="水果品种">水果品种</a> | 
<a href="<?php echo leuu('page/index',array('id'=>5));?>" title="联系我们">联系我们</a> -->
   <br>
版权所有：<?php echo ($site_copyright); ?> 联系人：<?php echo ($lianxiren); ?> 电话：<?php echo ($shouji); ?> <br>
地址：<?php echo ($address); ?> <?php echo ($site_icp); ?>  友情链接：<?php $links=sp_getlinks(); ?>
		<?php if(is_array($links)): foreach($links as $key=>$vo): ?><a href="<?php echo ($vo["link_url"]); ?>" target="<?php echo ($vo["link_target"]); ?>" title="<?php echo ($vo["link_name"]); ?>"><?php echo ($vo["link_name"]); ?></a><?php endforeach; endif; ?>
</div>
</div>
<style>
.right-fixed{position:fixed;width: 187px;height: 160px;right:-158px;top: 50%;margin-top: -80px;}
.right-fixed .gzhbox{width:28px;height: 118px;border: 1px solid #22AC38;color:#ffffff;border-right:none;background-color: #22AC38;text-align: center; vertical-align:middle;border-radius:10px 0 0 10px;float: left;cursor:pointer;margin-top: 19px;}
.right-fixed .gzhbox p{display:inline-block;width:20px;height: auto;letter-spacing: 2px;line-height:17px;height: 140px;margin-top:9px;margin-left:8px;font-size: 12px;}
.right-fixed .gzhboxbox{width:149px;height:149px;overflow: hidden;padding:4px;border: 1px solid #22AC38;float: left;background-color: #fff;border-right: none;}
.right-fixed .gzhboxbox img{max-width:100%}

.ewmbox{width: 100%;overflow: hidden;}
.ewmbox .a,.ewmbox .b{width:46%;float: left;box-sizing:border-box;margin:2%;overflow: hidden;position:relative;}
.ewmbox p{position: absolute;left: 0;bottom:0px;height: 40px;line-height: 40px;font: 12px;text-align: center;background:rgba(0,0,0,0.4);color:#ffffff;z-index:5;width: 100%;}
.ewmbox img{max-width: 100%}
</style>
<div class="right-fixed">
	<div class="gzhbox"><p>扫一扫有惊喜</p></div>
    <div class="gzhboxbox"><img src="/themes/nfxdny/Public/images/weixin.png" alt=""></div>
</div>
<script>
$('.right-fixed .gzhbox').click(function(){
	//$('.right-fixed').animate({'right':'0px'});
	var obj=$('.right-fixed');
	if(obj.hasClass('active')){
		obj.removeClass('active');
		obj.animate({'right':'-158px'});
		}else{
			obj.addClass('active');
			obj.animate({'right':'0px'});
			}
	});
</script>
<?php echo ($site_tongji); ?>

<script>
$(".js-ajax-form").Validform();
</script>
<?php echo hook('footer_end');?>
</body></html>
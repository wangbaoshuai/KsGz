<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

<script type="text/javascript">
		
		function checkyhnc(name){
			var getyhxm=document.getElementById("name").value;
			var tsobj = document.getElementById("errorname");
			var reg=/^[\u4e00-\u9fa5]+$/;
			if(!reg.test(getyhxm)){
				tsobj.className="cw";
				tsobj.innerHTML="请输入汉字";
				return false;
			}
			else{
				$.ajax({
				type : "post",
				data : "admin.aname=" +name,
				url : "addAJAXAdmin.action",
				datatype : "html",
				success : function(resu) {
					if(resu=="该姓名已经存在，请重新填写"||resu=="都不存在"){
						tsobj.innerHTML="该姓名已经存在，请重新填写";
						tsobj.className="cw";
					}
					else{
						tsobj.innerHTML="输入正确";
						tsobj.className="cg";
					}
				},
				error : function() {
					
				}
				});	
				if(tsobj.innerHTML=="该姓名已经存在，请重新填写"){
					return false;
				}else{
					return true;
				}
			}  
		}
		
		function checkyhm(loginname){
			var tsobj=document.getElementById("errorloginname");
			var getyhm=document.getElementById("loginname").value;
			var firstchar=getyhm.charAt(0);
			var firstreg=/^\d?$/;
		if(getyhm==""){
			tsobj.className="cw";
			tsobj.innerHTML="不能为空";
			return false;
			}
		if(firstreg.test(firstchar)){
			tsobj.className="cw";
			tsobj.innerHTML="首字母不能为数字";
			return false;
			}
		var reg=/^\w+$/;
		if(!reg.test(getyhm)){
			tsobj.className="cw";
			tsobj.innerHTML="只能包含数字、字母、下划线";
			return false;
			}
		if(getyhm.length>16||getyhm.length<4){
				tsobj.className="cw";
				tsobj.innerHTML="用户名为4-16字符";
				return false;
		}
		else{
			$.ajax({
				type : "post",
				data : "admin.loginname=" +loginname,
				url : "addAJAXAdmin.action",
				datatype : "html",
				success : function(resu) {
					if(resu=="用户名重复，请重新填写"||resu=="都不存在"){
						tsobj.innerHTML="用户名重复，请重新填写";
						tsobj.className="cw";
					}
					else{
						tsobj.innerHTML="输入正确";
						tsobj.className="cg";
					}
				},
				error : function() {
					
				}
				});	
				if(tsobj.innerHTML=="用户名重复，请重新填写"){
					return false;
				}else{
					return true;
				}
			}
		}
	
		function checkemail(){
		
			var tsobj = document.getElementById("erroremail");
			var emailstr = document.getElementById("email").value;
			
			var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
 			
 			if (filter.test(emailstr)) {
 				tsobj.innerHTML = "格式正确";
 				tsobj.className = "cg";
 				return true;
 			}
 			else {
 				tsobj.className="cw";
 				tsobj.innerHTML = "输入的邮箱格式错误";
 				return false;
 			}
		}
		
		function checkpwd(){
			var tsobj=document.getElementById("errorpass");
			var pwdstr=document.getElementById("password").value;
			if(pwdstr.length>16||pwdstr.length<6){
				tsobj.className="cw";
				tsobj.innerHTML="密码长度为6-16位";
				return false;
			}else{
				tsobj.innerHTML="输入正确";
				tsobj.className="cg";
				return true;
			}
		}
		
		
		function checkphone(){
			var tsobj=document.getElementById("errorphone");
			var reg=/^1\d{10}$/;
			var phonestr=document.getElementById("phone").value;
			if(!reg.test(phonestr)){
				tsobj.className="cw";	
				tsobj.innerHTML="格式不对";
				return false;
			}
			else{
				tsobj.innerHTML="输入正确";
				tsobj.className="cg";
				return true;
			}
		}
		function checkAll(){
			zk();
			var name=document.getElementById("name").value;
			var loginname = document.getElementById("loginname").value;
			if(checkpwd()&&checkemail()&&checkphone()&&checkyhnc(name)&&checkyhm(loginname)&&checkPower()){
			return true;
			}
			else {
			alert("输入格式错误");
			return false;}
		}
		function zk(){
		var name=document.getElementById("name").value;
		var loginname = document.getElementById("loginname").value;
		checkpwd();checkemail();checkphone();checkyhnc(name);checkyhm(loginname);checkPower();
		}
		
		
		function checkPower(){
			var tsobj=document.getElementById("errorpower");
			var group = document.getElementsByName("power");
			var flage = 0;
			
			for(j=0;j<group.length;j++){
	            if(group[j].checked == true){

	                flage = 1
	                break;
	            }
        	}
			if(flage == 1){
				tsobj.innerHTML="";
				tsobj.className="cg";
				return true;
			}else{
				tsobj.innerHTML="请选择权限，谢谢";
				tsobj.className="cw";
				return false;
			}
			
		

		}

		</script>
		
	<style type="text/css">
	.cg{
		color:#55DD88;
		font-size: 15px;
		margin-left: 10px;
		margin-top: 5px;
	}
	
	.cw{
		color:red;
		font-size: 15px;
		margin-left: 10px;
		margin-top: 5px;
	}
	.gx{border:#060 1px solid;
	
	background:url(images/li_ok.gif) no-repeat #AEFBD0;
	padding-left:18px;
	
	}
	.wgx{
	border:#900 1px solid;
	background: no-repeat url(images/li_err.gif) #FCC;
	padding-left:18px;
	}
	</style>

</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加管理员</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="addAdmin.action" method="post" onsubmit="return checkAll()">  
      <div class="form-group">
        <div class="label">
          <label>用户名</label>
        </div>
        <div class="field">
          <input type="text"  class="input w50"  name="admin.loginname" id="loginname" onblur="checkyhm(this.value)"/>
          <div class="tips" id="errorloginname"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>密码</label>
        </div>
        <div class="field">
          <input type="password"  class="input w50" name="admin.loginpass" id="password" onblur="checkpwd()"/>
          <div class="tips" id="errorpass"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>姓名</label>
        </div>
        <div class="field">
          <input type="text"  class="input w50" name="admin.aname" onblur="checkyhnc(this.value)" id="name"/>
          <div class="tips" id="errorname"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>邮箱</label>
        </div>
        <div class="field">
          <input type="text"  name="admin.email" class="input w50" id="email" onblur="checkemail()"/>
          <div class="tipss" id="erroremail"></div>
        </div>
      </div>
      
       <div class="form-group">
        <div class="label">
          <label>电话</label>
        </div>
        <div class="field">
          <input type="text"  class="input w50"  name="admin.phone" id="phone" onblur="checkphone()"/>
          <div class="tips" id="errorphone"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>权限：</label>
        </div>
        <div class="field">
      	  <span>用户管理</span><input type="checkbox"  name="power" class="input w50" value="用户管理" onchange="checkPower()"/><br/>
         <span>题库管理</span><input type="checkbox"  name="power" class="input w50" value="题库管理" onchange="checkPower()"/><br/>
        	 科目管理 <input type="checkbox"  name="power" class="input w50" value="科目管理" onchange="checkPower()"/><br/>
         日期管理 <input type="checkbox"  name="power" class="input w50" value="日期管理" onchange="checkPower()"/><br/>
      知识点管理    <input type="checkbox"  name="power" class="input w50" value="知识点管理" onchange="checkPower()"/><br/>
      新闻管理    <input type="checkbox"  name="power" class="input w50" value="新闻管理" onchange="checkPower()"/><br/>
       社区管理   <input type="checkbox"  name="power" class="input w50" value="社区管理" onchange="checkPower()"/><br/>
     视频管理     <input type="checkbox"  name="power" class="input w50" value="视频管理" onchange="checkPower()"/><br/>
         <div class="tips" id="errorpower"></div>
        </div>
      </div>
      <div class="clear"></div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>
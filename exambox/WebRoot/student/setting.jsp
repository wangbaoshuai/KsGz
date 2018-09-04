<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- <%@taglib uri="spring.tld" prefix="spring"%> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    	<base href="<%=basePath%>">
    
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>试题管理</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		
		<link href="resources/css/exam.css" rel="stylesheet">
		<link href="resources/chart/morris.css" rel="stylesheet">
		<script type="text/javascript">
		
		function checkyhnc(name){
			var getyhxm=document.getElementById("yhnc").value;
			var tsobj = document.getElementById("errornc");
			var reg=/^[\u4e00-\u9fa5]+$/;
			if(getyhxm==""){
				tsobj.className="cw";
				tsobj.innerHTML="姓名不能为空";
				return false;
			}
			if(!reg.test(getyhxm)){
				tsobj.className="cw";
				tsobj.innerHTML="请输入汉字";
				return false;
			}
			else{
				tsobj.className="cg";
				tsobj.innerHTML="输入正确";
					return true;
				
			}  
		}
		

		function checkemail(){
			var tsobj = document.getElementById("erroremail");
			var emailstr = document.getElementById("email").value;
			var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
 			if(emailstr==""){
				tsobj.className="cw";	
				tsobj.innerHTML="邮箱不能为空";
				return false;
			}
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
		
			function checkphone(){
			var tsobj=document.getElementById("errorphone");
			var reg=/^1\d{10}$/;
			var phonestr=document.getElementById("phone").value;
			
			if(phonestr==""){
				tsobj.className="cw";	
				tsobj.innerHTML="电话不能为空";
				return false;
			}
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
		
		function checkpicture(){	
			var tsobj = document.getElementById("errorpicture");
			var picturestr = document.getElementById("picture").value;
			if(picturestr!=""){
				tsobj.className="cg";	
				tsobj.innerHTML="";
				
				return true;
			}else{
				tsobj.className="cw";	
				tsobj.innerHTML="文件未选择";
				return false;
			}
		}
		function checkall(){
			zk();
			var name=document.getElementById("yhnc").value;
			
			if(checkemail()&&checkphone()&&checkyhnc(name)){
				return true;
			}
			else {
				alert("输入格式错误");
			return false;}
		}
		function zk(){
			var name=document.getElementById("yhnc").value;
			
			
			checkpicture();checkemail();checkphone();checkyhnc(name);
		}
		</script>
	<style type="text/css">
		.cg{
			color:green;
			font-size: 12px;
		}
		
		.cw{
			color:red;
			font-size: 12px;
		}
	</style>
	</head>
	
	
	<body>
		<div  style="height:135px;">
		<iframe src="head.jsp"  width="100%" height="100%" scrolling="no"  frameborder="0" ></iframe>
		</div>

		<!-- Slider starts -->

		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="min-height:500px;">

				<div class="row">
					<div class="col-xs-3">
						<ul class="nav default-sidenav">
							<li >
								<a href="student/usercenter.jsp"> <i class="fa fa-dashboard"></i> 用户中心 </a>
							</li>
							<li class="active">
								<a > <i class="fa fa-cogs"></i> 基本资料 </a>
							</li>
							<li>
								<a href="student/change-password.jsp"> <i class="fa fa-wrench"></i> 修改密码 </a>
							</li>
							<li>
								<a href="findError.action?student.id=${user.id}"> <i class="fa fa-bar-chart-o"></i> 历史错题 </a>
							</li>
							<li>
								<a href="findByPageAndStudentNote.action?student.id=${user.id}&nowpage=1"> <i class="fa fa-history"></i> 我的笔记 </a>
							</li>
							<li >
								<a  href="findCollect.action"><i class="fa fa-dashboard"></i>我的收藏</a>
							</li>
							<li>
								<a href="findByUserAndPageForum.action?student.id=${user.id}&nowpage=1"> <i class="fa fa-dashboard"></i> 我的帖子</a>
							</li>
							<li>
								<a href="findGrade.action"> <i class="fa fa-history"></i> 分数管理</a>
							</li>

						</ul>

					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1><i class="fa fa-cogs"></i> 基本资料</h1>
						</div>
						<div class="page-content row">
							<form class="form-horizontal"  action="updateStudent.action" style="margin-top:40px;" enctype="multipart/form-data" method="post" onsubmit="return checkall()"> 
									
									<!-- password -->
									<input type="hidden" name="student.id" value="${user.id}"/>
									<div class="form-group ">
										<label class="control-label col-md-2" >姓名</label>
										<div class="col-md-5">
											<input type="text" id="yhnc" class="form-control"  value="${user.uname}" name="student.uname" onblur="checkyhnc(this.value)">
											<span class="form-message" id="errornc"></span>
										</div>
									</div>
									
								
									<div class="form-group ">
										<label class="control-label col-md-2" >邮箱</label>
										<div class="col-md-5">
											<input type="text"  id="email" class="form-control"  value="${user.email}" name="student.email" onblur="checkemail()">
											<span class="form-message" id="erroremail"></span>
										</div>
									</div>
									
									<!-- password-confirm -->
									<div class="form-group ">
										<label class="control-label col-md-2" >手机</label>
										<div class="col-md-5">
											<input type="text" id="phone" class="form-control"  value="${user.phone}" name="student.phone" onblur="checkphone()">
											<span class="form-message" id="errorphone"></span>
										</div>
									</div>
									
									<div class="form-group ">
										<label class="control-label col-md-2" >头像</label>
										<div class="col-md-5">
											<input type="file" id="picture" class="form-control" name="image" >
											<span class="form-message" id="errorpicture"></span>
										</div>
									</div>

									<!-- Buttons -->
									<div class="form-group">
										<!-- Buttons -->
										<div class="col-md-5 col-md-offset-2">
											<button type="submit" class="btn" id="btn-reg">
												确认修改
											</button>
										
										</div>
									</div>
								</form>
								
							
							

						</div>
					</div>
				</div>
			</div>
		</div>

		<footer>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="copy">
							<p>
								Exam++ Copyright © <a href="http://www.examxx.net/" target="_blank">Exam++</a> - <a href="." target="_blank">主页</a> | <a href="http://www.examxx.net/" target="_blank">关于我们</a> | <a href="http://www.examxx.net/" target="_blank">FAQ</a> | <a href="http://www.examxx.net/" target="_blank">联系我们</a>
							</p>
						</div>
					</div>
				</div>

			</div>

		</footer>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<script type="text/javascript" src="resources/js/all.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/chart/raphael-min.js"></script>
		<script type="text/javascript" src="resources/chart/morris.js"></script>
		<script type="text/javascript" src="resources/js/modify-user.js"></script>
	</body>
	</html>
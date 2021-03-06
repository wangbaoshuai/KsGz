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
   function showmess(){
        document.getElementById("tz").className="xianshi";
	    document.getElementById("tz").innerHTML="日期格式为:2000-01-01形式";
	   }
   function checkName(){
   var reg=/^\d{4}\-\d{2}\-\d{2}$/;
   var fff=document.getElementById("name").value;
   var tsobj =document.getElementById("tz");
   if(!reg.test(fff)){
			tsobj.innerHTML="日期格式不正确！";
			  return false;
			}
			tsobj.innerHTML="输入正确！";
			return true;
   }
	function checkall(){
			var f=document.getElementById("name").value;
			var h=document.getElementById("field-input-select").value;
			
			if(h==-1){
			    alert("请重新选择");
			    return false;
			    }
			if(f==""){
			alert("考试时间不能为空");
			return false;
			}
			var reg=/^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
			var fff=document.getElementById("name").value;
			var tsobj =document.getElementById("tz");
			if(!reg.test(fff)){
			tsobj.innerHTML="日期格式不正确！";
			  return false;
			}
			tsobj.innerHTML="输入正确！";
			return true;
		}
   </script>
	</head>
	<body>
		
		
					<div class="col-xs-9">
						<div class="page-header">
							<h1><i class="fa fa-list-ul"></i> 添加考试时间 </h1>
						</div>
						<div class="page-content row">

							<form  style="margin-top:40px;"  action="addExamdate.action" method="post" name="form1" onsubmit="return checkall()">
								<div class="form-line form-field" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>科目名：</span>
									<select id="field-input-select" class="df-input-narrow" name="examdate.subject.id">
										<option value="-1">--请选择--</option>
										<c:forEach items="${subjectList }" var="item">
											<option value="${item.id}" <c:if test="${item.id eq examdate.subject.id }" >selected='selected' </c:if>>${item.sname }</option>
										</c:forEach>
									</select>
									<span class="form-message"></span>
									<br>
								</div>
								<div class="form-line form-name" style="display: block;">
									<span class="form-label"><span class="warning-label"></span>考试时间：</span>
										<input type="text" class="df-input-narrow" id="name" name="examdate.edate" onblur="checkName()" onfocus="showmess()"><span class="form-message" id="tz"></span>
									<br>
								</div>
									
								<div class="form-line">
									<input  value="确认添加" type="submit" class="df-submit" >
								</div>
							</form>
							

						</div>
					</div>
				</div>
			</div>
		</div>

		
		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/chart/raphael-min.js"></script>
		<script type="text/javascript" src="resources/chart/morris.js"></script>
		<script type="text/javascript" src="resources/js/add-point.js"></script>
		
	</body>
</html>
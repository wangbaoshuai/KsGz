<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
		Remove this if you use the .htaccess -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Exam++</title>
		<meta name="viewport"
		content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css"
		rel="stylesheet">
		<link  rel="stylesheet" href="css/note.css" />
		<link rel="stylesheet" href="css/new.css">
		<link href="resources/css/style.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/in_out.css" />
		<style>
		
			
			.question-number{
				color: #5cb85c;
				font-weight: bolder;
				display: inline-block;
				width: 30px;
				text-align: center;
			}
			
			.question-number-2{
				color: #5bc0de;
				font-weight: bolder;
				display: inline-block;
				width: 30px;
				text-align: center;
			}
			.question-number-3{
				color: #d9534f;
				font-weight: bolder;
				display: inline-block;
				width: 30px;
				text-align: center;
			}
			
			a.join-practice-btn{
				margin:0;
				margin-left:20px;
			}
			
			.content ul.question-list-knowledge{
				padding:8px 20px;
			}
			
			.knowledge-title{
				background-color:#EEE;
				padding:2px 10px;
				margin-bottom:20px;
				cursor:pointer;
				border:1px solid #FFF;
				border-radius:4px;
			}
			
			.knowledge-title-name{
				margin-left:8px;
			}
			
			.point-name{
				width:200px;
				display:inline-block;
			}
		</style>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script>

	</head>

	<body>
		<div  style="height:135px;">
		<iframe src="head.jsp"  width="100%" height="100%" scrolling="no"  frameborder="0" ></iframe>
	</div>
		<!-- Slider starts -->

		
			<!-- Slider (Flex Slider) -->
<div id="main" class="l">
		

		<div class="main-left">
			
			<div id="art">
				<h2>当前位置：首页 > 视频</h2>
				
				<h5>${sp.vname}</h5>
				<h6 >作者：${sp.admin.aname}管理员  来源：本站整理  更新时间：${sp.time}  </h6>
				<div class="content" align="center">
				<embed src="video/${sp.vfile }" autostart="true" align="middle" width="680px" height="500" >				
				</embed>	
				<br/>
				<p align="left">
				<br/>
				<h3 align="left">简介:</h3>
				
				<p align="left" style="font-size: 16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${sp.vex}</p>
				</p>	
				</div>
				<br>
				<!-- 评论开始 -->
				<div class="wrap">
		<div class="comment">
			
			<div class="content" style="width: 100%">
			<form action="addVcomment.action" method="post">
			   <input type="hidden" name="comment.vedio.id" value="${sp.id}" />
			   <input type="hidden" name="comment.student.id" value="${user.id}"/>
				<div class="cont-box">
					<textarea class="text" placeholder="请输入..." name="comment.content"></textarea>
				</div>
				
			    <div class="submit-btn"><input type="submit"  value="提交评论" /></div>
				</form>
			</div>
		</div>
		<div id="info-show">
			<ul>
			<c:forEach var="vcom" items="${sp.vcomments}">
			
				<li>
					<div class="head-face">
					<img src="images/${vcom.student.image }" />
					</div>
					<div class="reply-cont">
					<p class="username">${vcom.student.uname }&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${user.id eq vcom.student.id }"><a href="deleteVcomment.action?comment.id=${vcom.id}">删除</a></c:if></p>
					<p class="comment-body">${vcom.content }</p>
					<p class="comment-footer">${vcom.time }　</p>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- 评论 end-->
<script type="text/javascript">
function open(){
var cont="&nbsp;&nbsp;&nbsp;&nbsp;"
cont+=document.getElementById("cont").value;

var reg =new RegExp("\n","g");
var recont =cont.replace(reg,"&nbsp;&nbsp;&nbsp;&nbsp;<p>");
document.getElementById("content").innerHTML=recont;
}
window.onload=open;
</script>
				
			</div>


	

			
		</div>

		<div class="main-right" style="padding-top: 28px">
			
			<div class="toppic" >
	        <h2 style="margin-bottom: 10px">更多精彩课程：</h2>
	        <hr>
	        <ul>
	         <c:forEach items="${videolist}" var="s" varStatus="num">
	          <li style="font-size: 18px"><a  href="findVideoByIdplay.action?vid=${s.id}"  title="${s.vname}"><img src="${pageContext.request.contextPath}/video/images/${s.image}" width="100px" height="100px">&nbsp;&nbsp;  
	          <c:if test="${num.index  lt 8 }">
	          
					<c:if test="${s.vname.length() >= 6}">
					${s.vname.substring(0,6)}...
					</c:if>
						<c:if test="${s.vname.length() < 6 }">
						${s.vname}
						</c:if>
			 
				</c:if>
		         </a>
		          <p style="font-size: 15px">简介：<c:if test="${num.index  lt 8 }">
					<c:if test="${s.vex.length() >= 30 }">
					${s.vex.substring(0,30)}...
					</c:if>
					<c:if test="${s.vex.length() < 30 }">
						${s.vex}
						</c:if>
					</c:if>
		         </p>
	           
	            </li>
	            <hr/>
	          </c:forEach>
	            <!--
	          <li><a href="/"><img src="${pageContext.request.contextPath}/images/k02.jpg">问前任，你还爱我吗？无限戳中泪点~
	            <p>感兴趣</p>
	            </a></li>
	          <li><a href="/"><img src="${pageContext.request.contextPath}/images/k03.jpg">世上所谓幸福，就是一个笨蛋遇到一个傻瓜。
	            <p>喜欢</p>
	            </a></li>
	            -->
	        </ul>
      		</div>


			<div style="width:264px;height:216px;background:#eee;">
				<!--广告图 <img src="" alt="">-->
			</div>
		</div>

		<div class="c"></div>
	</div>
			
  </body>
</html>
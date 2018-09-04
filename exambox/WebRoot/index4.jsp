<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 1.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">  
<title>exambox</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Website Template" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />




<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- <link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet' type='text/css'> -->

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS 
<script src="js/modernizr-2.6.2.min.js"></script>
-->
<!-- FOR IE9 below -->
<!--[if lt IE 9]><![endif]-->	
	<script src="js/respond.min.js"></script>


</head>
<c:if test="${not empty setting_Info }">${setting_Info }<%session.removeAttribute("setting_Info"); %></c:if>		
<body>
	<div style="height:135px;">
		<iframe src="head.jsp" width="100%" height="100%" scrolling="no"
			frameborder="0"></iframe>
	</div>
	<div class="fh5co-loader"></div>

	<div id="page">

		<header id="fh5co-header" class="fh5co-cover" role="banner"
			style="background-image:url(images/img_bg_2.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<div class="display-t" style="margin-top: -180px;">
							<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<h1>欢迎来到考试格子！</h1>
								<h2>我们这里有最全的考试信息和考试资讯</h2>
								<div class="row">
									<form class="form-inline" id="fh5co-header-subscribe" action="searchfindByPageQuestion.action" method="post">
										<div class="col-md-8 col-md-offset-2">
											<div class="form-group">
												<input type="text" name="mohu" class="form-control" id="email"
													placeholder="输入您要搜索的内容">
												<button type="submit" class="btn btn-default">搜索</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>

		<div id="fh5co-core-feature">
			<div class="container">
				<div class="row">
					<div class="features">
						<div class="col-half animate-box" data-animate-effect="fadeInLeft">
							<div class="table-c">
								<div class="desc">
									<span>最全的四级考试试题</span>
									<h3>在这里,每个人都可以学好英语！</h3>
									<p>在很久以前，我们学习英语无外乎背单词,做试题.我们一遍一遍的背,一次一次的做,
										都不是很有效果,那是因为没有真正经历过考试.当你用我们的考试系统的时候,不仅可以身临其境的
										体味做题的乐趣,并且我们的系统会自动的记录您的错题.方便您以后复习</p>
									<p>
										<a href="findoneSubject.action?sid=2" class="btn btn-lg btn-primary">开始测试！</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-half-image-holder animate-box"
							data-animate-effect="fadeInRight">
							<img class="img-responsive" src="images/samsungs6.png"
								alt="samsung">
						</div>
					</div>
				</div>
			</div>
		</div>


		
		<div id="fh5co-project">
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<span>Want Some Cool Stuff</span>
						<h2>教学视频</h2>
						<p>Dignissimos asperiores vitae velit veniam totam fuga
							molestias accusamus alias autem provident. Odit ab aliquam dolor
							eius.</p>
					</div>
				</div>
			</div>
			<div class="project-content">
				<div class="col-half">
					<div class="project animate-box"
						style="background-image:url(images/project-3.jpg);">
						<div class="desc">
							<span>Application</span>
							<h3><a href="findBySubVideo.action?sid=3" style="color: white;">计算机教学视频</a></h3>
						</div>
					</div>
				</div>
				<div class="col-half">
					<div class="project-grid animate-box"
						style="background-image:url(images/project-5.jpg);">
						<div class="desc">
							<span>Illustration</span>
							<h3><a href="findBySubVideo.action?sid=1">考研视频</a></h3>
						</div>
					</div>
					<div class="project-grid animate-box"
						style="background-image:url(images/project-2.jpg);">
						<div class="desc">
							<span>Branding</span>
							<h3><a href="findBySubVideo.action?sid=2">四级视频</a></h3>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="fh5co-testimonial" class="fh5co-bg-section">
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>Happy Clients</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<div class="row">
							<div class="col-md-12 animate-box">
								<div class="testimony">
									<div class="inner text-center">
										<img src="images/person3.jpg" alt="testimony">
									</div>
									<blockquote>
										<p>&ldquo;Facilis ipsum reprehenderit nemo molestias. Aut
											cum mollitia reprehenderit. Eos cumque dicta adipisci
											architecto culpa amet.&rdquo;</p>
										<p class="author">
											<cite>&mdash; John Doe</cite>
										</p>
									</blockquote>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div id="fh5co-started">
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>Lets Get Started</h2>
						<p>Dignissimos asperiores vitae velit veniam totam fuga
							molestias accusamus alias autem provident. Odit ab aliquam dolor
							eius.</p>
					</div>
				</div>
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2">
						<form class="form-inline">
							<div class="col-md-6 col-md-offset-3 col-sm-6">
								<button type="submit" class="btn btn-default btn-block">Get
									In Touch</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<footer id="fh5co-footer" role="contentinfo">
			<div class="container">
				<div class="row row-pb-md">
					<div class="col-md-4 fh5co-widget">
						<h3>考试格子系统.</h3>
						<p>课程格子已经完成了许多的题目的积累.帮助了一匹又一匹的学生打成了他们的梦想.现在我们正在积极的提升着自己,只为了在明天等待更好的你
						</p>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
						<ul class="fh5co-footer-links">
							<li><h3>用户中心</h3></li>
							<li><a href="student/usercenter.jsp">我的账户</a></li>
							<c:if test="${not empty user }">
							<li><a href="findError.action?student.id=${user.id}">我的错题</a></li>
							</c:if>
							<li><a href="#">联系我们</a></li>
						</ul>
					</div>

					<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
						<ul class="fh5co-footer-links">
							<li><h3>试题中心</h3></li>
							<li><a href="findoneSubject.action?sid=2">四级考试</a></li>
							<li><a href="findoneSubject.action?sid=1">考研考试</a></li>
							<li><a href="findoneSubject.action?sid=3">计算机二级考试</a></li>
						</ul>
					</div>

					
				</div>

				<div class="row copyright">
					<div class="col-md-12 text-center">
						<p>
							<small class="block">&copy; Copyright © 2016 北京格子有限公司版权所有
								京ICP备11212121212号-1</small> <small class="block">&copy;
								地址：北京市昌平区十三陵镇3号3层 电话：1234567890</small>
						</p>

					</div>
				</div>

			</div>
		</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

</body>
</html>


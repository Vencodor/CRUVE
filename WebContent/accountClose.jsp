﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>

<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>
<%
	String userID=null;
	String userPassword=null;
	
	UserDAO userDAO = new UserDAO();
	
	if(request.getParameter("pw")!=null)
		userPassword=request.getParameter("pw");
	
	if(session.getAttribute("userID")!=null) {
		userID=(String)session.getAttribute("userID");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 먼저 해주세요.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	if(userDAO.userLogin(userID,userPassword)==1) {
		userDAO.userClose(userID);
		session.setAttribute("userID", null);
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀렸습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>
	<head>
		<meta charset="utf-8">		
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">
		<title>Curve - 계정삭제</title>
		
		<!-- Favicon Icon -->
		<link rel="icon" type="image/png" href="images/fav.png">
		
		<!-- Stylesheets -->
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,500' rel='stylesheet'>
		<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
		<link href="css/vertical-responsive-menu.min.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<link href="css/responsive.css" rel="stylesheet">
		
		<!-- Vendor Stylesheets -->
		<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
		<link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
		<link href="vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
		<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="vendor/semantic/semantic.min.css">	
		
	</head> 

<body class="coming_soon_style">
	
	<!-- Body Start -->
	<div class="wrapper coming_soon_wrapper">		
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="cmtk_group">
						<div class="ct-logo">
							<a href="index.jsp"><img src="images/ct_logo.svg" alt=""></a>
						</div>
						<div class="cmtk_dt">
							<h1 class="title_404">Success</h1>
							<h4 class="thnk_title1">계정탈퇴가 성공적으로 이루어졌습니다.</h4>
						</div>
					</div> 	
				</div>	
			</div>	
		</div>		
	</div>	
	<!-- Body End -->

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/semantic/semantic.min.js"></script>
	<script src="js/custom.js"></script>	
	
</body>
</html>
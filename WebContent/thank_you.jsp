﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>

	<head>
		<meta charset="utf-8">		
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">
		<title>Cursus - Thank You</title>
		
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
							<h1 class="thnk_coming_title">Thank You</h1>
							<h4 class="thnk_title1">Your Order is Confirmed!</h4>
							<p class="thnk_des">Top Print Your Booking Order No.<span> #ABE-ME-12345678</span> (Invoice) - <a href="invoice.jsp">Click Here</a></p>
						</div>
						<div class="tc_footer_main">
							<div class="tc_footer_left">
								<ul>
									<li><a href="about_us.jsp">About</a></li>
									<li><a href="press.jsp">Press</a></li>
									<li><a href="contact_us.jsp">Contact Us</a></li>
									<li><a href="coming_soon.jsp">Advertise</a></li>
									<li><a href="coming_soon.jsp">Developers</a></li>
									<li><a href="terms_of_use.jsp">Copyright</a></li>
									<li><a href="terms_of_use.jsp">Privacy Policy</a></li>
									<li><a href="terms_of_use.jsp">Terms</a></li>
								</ul>						
							</div>
							<div class="tc_footer_right">
								<p>© 2020 <strong>Cursus</strong>. All Rights Reserved.</p>
							</div>
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
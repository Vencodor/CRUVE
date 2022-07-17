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
		<title>Cursus - Sign Up Next Step</title>
		
		<!-- Favicon Icon -->
		<link rel="icon" type="image/png" href="images/fav.png">
		
		<!-- Stylesheets -->
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,500' rel='stylesheet'>
		<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
		<link href="css/vertical-responsive-menu.min.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<link href="css/responsive.css" rel="stylesheet">
		<link href="css/night-mode.css" rel="stylesheet">
		
		<!-- Vendor Stylesheets -->
		<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
		<link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
		<link href="vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
		<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="vendor/semantic/semantic.min.css">	
		
	</head> 

<body>
	<!-- Signup Start -->
	<div class="sign_in_up_bg">
		<div class="container">
			<div class="row justify-content-lg-center justify-content-md-center">
				<div class="col-lg-12">
					<div class="main_logo25" id="logo">
						<a href="index.jsp"><img src="images/logo.svg" alt=""></a>
						<a href="index.jsp"><img class="logo-inverse" src="images/ct_logo.svg" alt=""></a>
					</div>
				</div>
			
				<div class="col-lg-6 col-md-8">
					<div class="sign_form">
						<div class="main-tabs">
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item">
									<a href="#instructor-signup-tab" id="instructor-tab" class="nav-link active" data-toggle="tab">Instructor Sign Up</a>
								</li>
								<li class="nav-item">
									<a href="#student-signup-tab" id="student-tab" class="nav-link" data-toggle="tab">Student Sign Up</a>
								</li>																				
							</ul>									
						</div>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="instructor-signup-tab" role="tabpanel" aria-labelledby="instructor-tab">
								<p>Sign Up and Create Course!</p>
								<form>
									<select class="ui hj145 dropdown cntry152 prompt srch_explore">
										<option value="">Select Category</option>
										<option value="1">Development</option>
										<option value="2">Business</option>
										<option value="3">Finance & Accounting</option>
										<option value="4">IT & Software</option>
										<option value="5">Office Productivity</option>
										<option value="6">Personal Development</option>
										<option value="7">Design</option>
										<option value="8">Marketing</option>
										<option value="9">Lifestyle</option>
										<option value="10">Photography</option>
										<option value="11">Health & Fitness</option>
										<option value="12">Music</option>
										<option value="13">Teaching & Academics</option>
									</select>
									<div class="ui search focus mt-15">																
										<div class="ui form swdh30">
											<div class="field">
												<textarea rows="3" name="description" id="id_about" placeholder="Write a little description about you..."></textarea>
											</div>
										</div>
										<div class="help-block">Your biography should have at least 12000 characters.</div>
									</div>							
									<button class="login-btn" type="submit">Instructor Sign Up Now</button>
								</form>
							</div>
							<div class="tab-pane fade" id="student-signup-tab" role="tabpanel" aria-labelledby="student-tab">
								<p>Sign Up and Start Learning!</p>
								<form>
									<div class="ui search focus mt-15">																
										<div class="ui form swdh30">
											<div class="field">
												<textarea rows="3" name="description" id="id_about1" placeholder="Write a little description about you..."></textarea>
											</div>
										</div>
										<div class="help-block">Your biography should have at least 12000 characters.</div>
									</div>
									<button class="login-btn" type="submit">Student Sign Up Now</button>
								</form>
							</div>
						</div>
						<p class="mb-0 mt-30">Already have an account? <a href="sign_in.jsp">Log In</a></p>
					</div>
					<div class="sign_footer"><img src="images/sign_logo.png" alt="">© 2020 <strong>Cursus</strong>. All Rights Reserved.</div>
				</div>				
			</div>				
		</div>				
	</div>
	<!-- Signup End -->	

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/semantic/semantic.min.js"></script>
	<script src="js/custom.js"></script>	
	<script src="js/night-mode.js"></script>	
	
</body>
</html>
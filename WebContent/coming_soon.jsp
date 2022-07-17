<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>

	<head>
		<meta charset="utf-8">		
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">
		<title>Curve - Coming Soon</title>
		
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
							<div class="col-lg-8 no-float no-padding center-block">
								<ul class="clock block clearfix">
									<li>
										<span class="remaining-days" id="days">1</span>
										<label>Days</label>
									</li>
									<li class="sep">:</li>
									<li>
										<span class="remaining-hours" id="hours">00</span>
										<label>hours</label>
									</li>
									<li class="sep">:</li>
									<li>
										<span class="remaining-minutes" id="minutes">00</span>
										<label>minutes</label>
									</li>
									<li class="sep">:</li>
									<li>
										<span class="remaining-seconds" id="seconds">00</span>
										<label>seconds</label>
									</li>
								</ul>
							</div>
							<h4 class="thnk_title1">We’ll be coming soon!</h4>
							<div class="col-lg-4 col-md-6 no-float no-padding noti-block">
								<form>
									<div class="ui search focus">
										<div class="ui left icon input swdh11 thykh19">
											<input class="prompt srch_explore" type="email" name="emailaddress" value="" id="id_email" required="" maxlength="64" placeholder="Email address">															
											<button class="noti-btn" type="submit">Notify Me</button>
										</div>									
									</div>
								</form>
							</div>
						</div>
						<div class="tc_footer_main">
							<div class="tc_footer_left">
								<p>© 2020 <strong>Curve</strong>. All Rights Reserved.</p>
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
	
	<script>
		var count = new Date("may 1,2021 00:00:00").getTime();
		var x = setInterval(function() {
			var now =  new Date().getTime();
			var d = count - now;	
			var days = Math.floor(d/(1000*60*60*24));
			var hours = Math.floor((d%(1000*60*60*24))/(1000*60*60));
			var minutes = Math.floor((d%(1000*60*60))/(1000*60));
			var seconds = Math.floor((d%(1000*60))/1000);	
			document.getElementById("days").innerHTML = days;
			document.getElementById("hours").innerHTML = hours;
			document.getElementById("minutes").innerHTML = minutes;
			document.getElementById("seconds").innerHTML = seconds;	
			if(d <=0){
				clearInterval(x);
			}
		},1000);
	</script>
	
</body>
</html>
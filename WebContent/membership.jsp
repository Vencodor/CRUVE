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
		<title>Cursus - Paid Membership</title>
		
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
	<!-- Header Start -->
	<header class="header clearfix">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="back_link">
						<a href="index.jsp" class="hde151">Home으로 돌아가기</a>
						<a href="index.jsp" class="hde152">이전</a>
					</div>
					<div class="ml_item">
						<div class="main_logo main_logo15" id="logo">
							<a href="index.jsp"><img src="images/logo.svg" alt=""></a>
							<a href="index.jsp"><img class="logo-inverse" src="images/ct_logo.svg" alt=""></a>
						</div>				
					</div>				
					<div class="header_right pr-0">
						<ul>				
							<li class="ui top right pointing dropdown">
								<a href="#" class="opts_account">
									<img src="images/hd_dp.jpg" alt="">
								</a>
								<div class="menu dropdown_account">
									<div class="channel_my">
										<div class="profile_link">
											<img src="images/hd_dp.jpg" alt="">
											<div class="pd_content">
												<div class="rhte85">
													<h6>Joginder Singh</h6>
													<div class="mef78" title="Verify">
														<i class='uil uil-check-circle'></i>
													</div>
												</div>
												<span>gambol943@gmail.com</span>
											</div>							
										</div>
										<a href="my_instructor_profile_view.jsp" class="dp_link_12">View Instructor Profile</a>
									</div>
									<div class="night_mode_switch__btn">
										<a href="#" id="night-mode" class="btn-night-mode">
											<i class="uil uil-moon"></i> Night mode
											<span class="btn-night-mode-switch">
												<span class="uk-switch-button"></span>
											</span>
										</a>
									</div>
									<a href="dashboard.jsp" class="item channel_item">Cursus Dashboard</a>						
									<a href="sign_in.jsp" class="item channel_item">Sign Out</a>
								</div>
							</li>
						</ul>
					</div>		
				</div>		
			</div>
		</div>
	</header>
	<!-- Header End -->
	<!-- Body Start -->
	<div class="wrapper _bg4586 _new89">		
		<div class="_215b15">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">						
						<div class="title125">						
							<div class="titleleft">					
								<div class="ttl121">
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
											<li class="breadcrumb-item active" aria-current="page">유료 멤버십</li>
										</ol>
									</nav>
								</div>
							</div>
						</div>
						<div class="title126">	
							<h2>유료 멤버십</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="memb4d25">
			<div class="container">			
				<div class="row">
					<div class="col-md-6">						
						<div class="membership_bg">
							<div class="membership_title">
								<div class="membership__left">
									<h2>기본 계획</h2>
									<div class="memmbership_price">₩ 4900 / 월</div>
									<div class="save_price">연간 지불시 ₩ 14,700 절약</div>
								</div>
								<div class="membership__right">
									<img src="images/membership/icon-1.svg" alt="">
								</div>							
							</div>
							<div class="membership_des">
								<p>첫 번째 제품을 출시하기 위해.</p>
							</div>
							<div class="panel-group accordion" id="accordion0">
								<div class="panel panel-default">
									<div class="panel-heading" id="headingOne">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapseOne" href="#" aria-expanded="false" aria-controls="collapseOne">
												<i class="uil uil-check chck_icon"></i>자신의 가게
											</a>
										</div>
									</div>
									<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion0">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingTwo">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapseTwo" href="#" aria-expanded="false" aria-controls="collapseTwo">
												<i class="uil uil-check chck_icon"></i>온라인 코스
											</a>
										</div>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion0">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingThree">
										 <div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapseThree" href="#" aria-expanded="false" aria-controls="collapseThree">
												<i class="uil uil-check chck_icon"></i>이메일 마케팅
											</a>
										</div>
									</div>
									<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion0">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingfour">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapsefour" href="#" aria-expanded="false" aria-controls="collapsefour">
												<i class="uil uil-check chck_icon"></i>메신저 한도 증가
											</a>
										</div>
									</div>
									<div id="collapsefour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingfour" data-parent="#accordion0">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingfive">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapsefive" href="#" aria-expanded="false" aria-controls="collapsefive">
												<i class="uil uil-check chck_icon"></i>월말정산 수수료 절감
											</a>
										</div>
									</div>
									<div id="collapsefive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingfive" data-parent="#accordion0">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingsix">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapsesix" href="#" aria-expanded="false" aria-controls="collapsesix">
												<i class="uil uil-check chck_icon"></i>주 7일 지원
											</a>
										</div>
									</div>
									<div id="collapsesix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingsix" data-parent="#accordion0">
										<div class="panel-body">멤버십 기능은 준비중입니다. </div>
									</div>
								</div>
								<div class="panel panel-default-1">
									<div class="panel-heading">
										<div class="panel-title-1">
											<a class="collapsed">
												<i class="uil uil-times chck_icon_1"></i>멤버십
											</a>
										</div>
									</div>
								</div>
								<div class="panel panel-default-1">
									<div class="panel-heading">
										<div class="panel-title-1">
											<a class="collapsed">
												<i class="uil uil-times chck_icon_1"></i>블로그
											</a>
										</div>
									</div>
								</div>
								<div class="panel panel-default-1">
									<div class="panel-heading">
										<div class="panel-title-1">
											<a class="collapsed">
												<i class="uil uil-times chck_icon_1"></i>제휴 마케팅
											</a>
										</div>
									</div>
								</div>
								<div class="panel panel-default-1">
									<div class="panel-heading">
										<div class="panel-title-1">
											<a class="collapsed">
												<i class="uil uil-times chck_icon_1"></i>타사 코드
											</a>
										</div>
									</div>
								</div>
							</div>
							<button class="prmb_btn">멤버십 구매</button>
						</div>
					</div>
					<div class="col-md-6">						
						<div class="membership_bg">
							<div class="membership_title">
								<div class="membership__left">
									<h2>사업 계획</h2>
									<div class="memmbership_price">₩ 8900 / 월</div>
									<div class="save_price">연간 지불시 ₩ 26,700 절약</div>
								</div>
								<div class="membership__right">
									<img src="images/membership/icon-2.svg" alt="">
								</div>							
							</div>
							<div class="membership_des">
								<p>비즈니스를 성장시킬 준비가 된 판매자를 위해.</p>
							</div>
							<div class="panel-group accordion" id="accordion1">
								<div class="panel panel-default">
									<div class="panel-heading" id="headingOne1">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapseOne1" href="#collapseOne1" aria-expanded="false" aria-controls="collapseOne1">
												<i class="uil uil-check chck_icon"></i>자신의 가게
											</a>
										</div>
									</div>
									<div id="collapseOne1" class="panel-collapse collapse" aria-labelledby="headingOne1" data-parent="#accordion1">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingTwo1">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapseTwo1" href="#" aria-expanded="false" aria-controls="collapseTwo1">
												<i class="uil uil-check chck_icon"></i>온라인 코스
											</a>
										</div>
									</div>
									<div id="collapseTwo1" class="panel-collapse collapse" aria-labelledby="headingTwo1" data-parent="#accordion1">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingThree1">
										 <div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapseThree1" href="#" aria-expanded="false" aria-controls="collapseThree1">
												<i class="uil uil-check chck_icon"></i>이메일 마케팅								
											</a>
										</div>
									</div>
									<div id="collapseThree1" class="panel-collapse collapse" aria-labelledby="headingThree1" data-parent="#accordion1">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingfour1">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapsefour1" href="#" aria-expanded="false" aria-controls="collapsefour1">
												<i class="uil uil-check chck_icon"></i>메신저 한도 증가
											</a>
										</div>
									</div>
									<div id="collapsefour1" class="panel-collapse collapse" aria-labelledby="headingfour1" data-parent="#accordion1">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingfive1">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapsefive1" href="#" aria-expanded="false" aria-controls="collapsefive1">
												<i class="uil uil-check chck_icon"></i>월말정산 수수료 절감				
											</a>
										</div>
									</div>
									<div id="collapsefive1" class="panel-collapse collapse" aria-labelledby="headingfive1" data-parent="#accordion1">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingsix1">
										 <div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapsesix1" href="#" aria-expanded="false" aria-controls="collapsesix1">
												<i class="uil uil-check chck_icon"></i>주 7일 지원									
											</a>
										</div>
									</div>
									<div id="collapsesix1" class="panel-collapse collapse" aria-labelledby="headingsix1" data-parent="#accordion1">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingseven1">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapseseven1" href="#" aria-expanded="false" aria-controls="collapseseven1">
												<i class="uil uil-check chck_icon"></i>멤버십
											</a>
										</div>
									</div>
									<div id="collapseseven1" class="panel-collapse collapse" aria-labelledby="headingseven1" data-parent="#accordion1">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingeight1">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapseeight1" href="#" aria-expanded="false" aria-controls="collapseeight1">
												<i class="uil uil-check chck_icon"></i>블로그
											</a>
										</div>
									</div>
									<div id="collapseeight1" class="panel-collapse collapse" aria-labelledby="headingeight1" data-parent="#accordion1">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingnine1">
										 <div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapsenine1" href="#" aria-expanded="false" aria-controls="collapsenine1">
												<i class="uil uil-check chck_icon"></i>제휴 마케팅
											</a>
										</div>
									</div>
									<div id="collapsenine1" class="panel-collapse collapse" aria-labelledby="headingnine1" data-parent="#accordion1">
										<div class="panel-body">멤버십 기능은 준비중입니다. </div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingten1">
										 <div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapseten1" href="#" aria-expanded="false" aria-controls="collapseten1">
												<i class="uil uil-check chck_icon"></i>타사 코드
											</a>
										</div>
									</div>
									<div id="collapseten1" class="panel-collapse collapse" aria-labelledby="headingten1" data-parent="#accordion1">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
							</div>
							<button class="prmb_btn">멤버십 구매</button>
						</div>
					</div>					
				</div>
				<div class="row">	
					<div class="col-lg-12">
						<div class="title589 mt-62">
							<h2>멤버십 FAQ</h2>
							<p>잠시만요...</p>
						</div>
						<div class="membership_faq_bg">
							<div class="panel-group mt-4 accordion" id="accordion2">
								<div class="panel panel-default">
									<div class="panel-heading"  id="headingOne2">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapseOne2" href="#" aria-expanded="false" aria-controls="collapseOne2">
												플랜 변경이 쉬운가요?
											</a>
										</div>
									</div>
									<div id="collapseOne2" class="panel-collapse collapse" aria-labelledby="headingOne2" data-parent="#accordion2">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingTwo2">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapseTwo2" href="#" aria-expanded="false" aria-controls="collapseTwo2">
												언제든지 취소 가능한가요?
											</a>
										</div>
									</div>
									<div id="collapseTwo2" class="panel-collapse collapse" aria-labelledby="headingTwo2" data-parent="#accordion2">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingThree2">
										 <div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapseThree2" href="#" aria-expanded="false" aria-controls="collapseThree2">
												신용카드 수수료가 있습니까?						
											</a>
										</div>
									</div>
									<div id="collapseThree2" class="panel-collapse collapse" aria-labelledby="headingThree2"  data-parent="#accordion2">
										<div class="panel-body">멤버십 기능은 준비중입니다. </div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingfour2">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapsefour2" href="#" aria-expanded="false" aria-controls="collapsefour2">
												평가판을 시작하기 전에 플랜을 선택해야 합니까?
											</a>
										</div>
									</div>
									<div id="collapsefour2" class="panel-collapse collapse" aria-labelledby="headingfour2" data-parent="#accordion2">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingfive2">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapsefive2" href="#" aria-expanded="false" aria-controls="collapsefive2">
												사업 플랜은 저를 위한게 아닙니다. 취소 가능한가요?			
											</a>
										</div>
									</div>
									<div id="collapsefive2" class="panel-collapse collapse" aria-labelledby="headingfive2" data-parent="#accordion2">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingsix2">
										 <div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapsesix2" href="#" aria-expanded="false" aria-controls="collapsesix2">
												돈은 어떻게 받나요?									
											</a>
										</div>
									</div>
									<div id="collapsesix2" class="panel-collapse collapse" aria-labelledby="headingsix2" data-parent="#accordion2">
										<div class="panel-body">멤버십 기능은 준비중입니다. </div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingseven2">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapseseven2" href="#" aria-expanded="false" aria-controls="collapseseven2">
												가입하기 위해 신용카드가 필요합니까?
											</a>
										</div>
									</div>
									<div id="collapseseven2" class="panel-collapse collapse" aria-labelledby="headingseven2" data-parent="#accordion2">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingeight2">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapseeight2" href="#" aria-expanded="false" aria-controls="collapseeight2">
												온라인 거래에 대해 안전합니까?
											</a>
										</div>
									</div>
									<div id="collapseeight2" class="panel-collapse collapse" aria-labelledby="headingeight2" data-parent="#accordion2">
										<div class="panel-body">멤버십 기능은 준비중입니다.</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="headingnine2">
										 <div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-target="#collapsenine2" href="#" aria-expanded="false" aria-controls="collapsenine2">
												아직 질문이 있습니다. 도와줘요!
											</a>
										</div>
									</div>
									<div id="collapsenine2" class="panel-collapse collapse" aria-labelledby="headingnine2" data-parent="#accordion2">
										<div class="panel-body">멤버십 기능은 준비중입니다. </div>
									</div>
								</div>								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<footer class="footer mt-30">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-6">
						<div class="item_f1">
							<a href="about_us.jsp">About</a>
							<a href="our_blog.jsp">Blog</a>
							<a href="career.jsp">Careers</a>
							<a href="press.jsp">Press</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6">
						<div class="item_f1">
							<a href="help.jsp">Help</a>
							<a href="coming_soon.jsp">Advertise</a>
							<a href="coming_soon.jsp">Developers</a>
							<a href="contact_us.jsp">Contact Us</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6">
						<div class="item_f1">
							<a href="terms_of_use.jsp">Copyright Policy</a>
							<a href="terms_of_use.jsp">Terms</a>
							<a href="terms_of_use.jsp">Privacy Policy</a>
							<a href="sitemap.jsp">Sitemap</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6">
						<div class="item_f3">
							<a href="#" class="btn1542">Teach on Cursus</a>
							<div class="lng_btn">
								<div class="ui language bottom right pointing dropdown floating" id="languages" data-content="Select Language">
									<a href="#"><i class='uil uil-globe lft'></i>Language<i class='uil uil-angle-down rgt'></i></a>
									<div class="menu">
										<div class="scrolling menu">
											<div class="item" data-percent="100" data-value="en" data-english="English">
												<span class="description">English</span>
												English
											</div>
											<div class="item" data-percent="94" data-value="da" data-english="Danish">
												<span class="description">dansk</span>
												Danish
											</div>
											<div class="item" data-percent="94" data-value="es" data-english="Spanish">
												<span class="description">Español</span>
												Spanish
											</div>
											<div class="item" data-percent="34" data-value="zh" data-english="Chinese">
												<span class="description">简体中文</span>
												Chinese
											</div>
											<div class="item" data-percent="54" data-value="zh_TW" data-english="Chinese (Taiwan)">
												<span class="description">中文 (臺灣)</span>
												Chinese (Taiwan)
											</div>
											<div class="item" data-percent="79" data-value="fa" data-english="Persian">
												<span class="description">پارسی</span>
												Persian
											</div>
											<div class="item" data-percent="41" data-value="fr" data-english="French">
												<span class="description">Français</span>
												French
											</div>
											<div class="item" data-percent="37" data-value="el" data-english="Greek">
												<span class="description">ελληνικά</span>
												Greek
											</div>
											<div class="item" data-percent="37" data-value="ru" data-english="Russian">
												<span class="description">Русский</span>
												Russian
											</div>
											<div class="item" data-percent="36" data-value="de" data-english="German">
												<span class="description">Deutsch</span>
												German
											</div>
											<div class="item" data-percent="23" data-value="it" data-english="Italian">
												<span class="description">Italiano</span>
												Italian
											</div>
											<div class="item" data-percent="21" data-value="nl" data-english="Dutch">
												<span class="description">Nederlands</span>
												Dutch
											</div>
											<div class="item" data-percent="19" data-value="pt_BR" data-english="Portuguese">
												<span class="description">Português(BR)</span>
												Portuguese
											</div>
											<div class="item" data-percent="17" data-value="id" data-english="Indonesian">
												<span class="description">Indonesian</span>
												Indonesian
											</div>
											<div class="item" data-percent="12" data-value="lt" data-english="Lithuanian">
												<span class="description">Lietuvių</span>
												Lithuanian
											</div>
											<div class="item" data-percent="11" data-value="tr" data-english="Turkish">
												<span class="description">Türkçe</span>
												Turkish
											</div>
											<div class="item" data-percent="10" data-value="kr" data-english="Korean">
												<span class="description">한국어</span>
												Korean
											</div>
											<div class="item" data-percent="7" data-value="ar" data-english="Arabic">
												<span class="description">العربية</span>
												Arabic
											</div>
											<div class="item" data-percent="6" data-value="hu" data-english="Hungarian">
												<span class="description">Magyar</span>
												Hungarian
											</div>
											<div class="item" data-percent="6" data-value="vi" data-english="Vietnamese">
												<span class="description">tiếng Việt</span>
												Vietnamese
											</div>
											<div class="item" data-percent="5" data-value="sv" data-english="Swedish">
												<span class="description">svenska</span>
												Swedish
											</div>
											<div class="item" data-precent="4" data-value="pl" data-english="Polish">
												<span class="description">polski</span>
												Polish
											</div>
											<div class="item" data-percent="6" data-value="ja" data-english="Japanese">
												<span class="description">日本語</span>
												Japanese
											</div>
											<div class="item" data-percent="0" data-value="ro" data-english="Romanian">
												<span class="description">românește</span>
												Romanian
											</div>										
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="footer_bottm">
							<div class="row">
								<div class="col-md-6">
									<ul class="fotb_left">
										<li>
											<a href="index.jsp">
												<div class="footer_logo">
													<img src="images/logo1.svg" alt="">
												</div>
											</a>
										</li>
										<li>
											<p>© 2020 <strong>Cursus</strong>. All Rights Reserved.</p>
										</li>
									</ul>
								</div>
								<div class="col-md-6">
									<div class="edu_social_links">
										<a href="#"><i class="fab fa-facebook-f"></i></a>
										<a href="#"><i class="fab fa-twitter"></i></a>
										<a href="#"><i class="fab fa-google-plus-g"></i></a>
										<a href="#"><i class="fab fa-linkedin-in"></i></a>
										<a href="#"><i class="fab fa-instagram"></i></a>
										<a href="#"><i class="fab fa-youtube"></i></a>
										<a href="#"><i class="fab fa-pinterest-p"></i></a>
									</div>
								</div>		
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<!-- Body End -->

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/semantic/semantic.min.js"></script>
	<script src="js/custom.js"></script>	
	<script src="js/night-mode.js"></script>	
	
</body>
</html>
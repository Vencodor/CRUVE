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
		<title>Cursus - Dashboard</title>
		
		<!-- Favicon Icon -->
		<link rel="icon" type="image/png" href="images/fav.png">
		
		<!-- Stylesheets -->
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,500' rel='stylesheet'>
		<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
		<link href="css/vertical-responsive-menu1.min.css" rel="stylesheet">
		<link href="css/instructor-dashboard.css" rel="stylesheet">
		<link href="css/instructor-responsive.css" rel="stylesheet">
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
		<button type="button" id="toggleMenu" class="toggle_menu">
		  <i class='uil uil-bars'></i>
		</button>
		<button id="collapse_menu" class="collapse_menu">
			<i class="uil uil-bars collapse_menu--icon "></i>
			<span class="collapse_menu--label"></span>
		</button>
		<div class="main_logo" id="logo">
			<a href="index.jsp"><img src="images/logo.svg" alt=""></a>
			<a href="index.jsp"><img class="logo-inverse" src="images/ct_logo.svg" alt=""></a>
		</div>
		<div class="top-category">
			<div class="ui compact menu cate-dpdwn">
				<div class="ui simple dropdown item">
					<a href="#" class="option_links p-0" title="categories"><i class="uil uil-apps"></i></a>
					<div class="menu dropdown_category5">
						<a href="#" class="item channel_item">Development</a>
						<a href="#" class="item channel_item">Business</a>
						<a href="#" class="item channel_item">Finance & Accounting</a>
						<a href="#" class="item channel_item">IT & Software</a>
						<a href="#" class="item channel_item">Office Productivity</a>
						<a href="#" class="item channel_item">Personal Development</a>
						<a href="#" class="item channel_item">Design</a>
						<a href="#" class="item channel_item">Marketing</a>
						<a href="#" class="item channel_item">Lifestyle</a>
						<a href="#" class="item channel_item">Photography</a>
						<a href="#" class="item channel_item">Health & Fitness</a>
						<a href="#" class="item channel_item">Music</a>
						<a href="#" class="item channel_item">Teaching & Academics</a>
					</div>
				</div>
			</div>
		</div>
		<div class="search120">
			<div class="ui search">
			  <div class="ui left icon input swdh10">
				<input class="prompt srch10" type="text" placeholder="Search for Tuts Videos, Tutors, Tests and more..">
				<i class='uil uil-search-alt icon icon1'></i>
			  </div>
			</div>
		</div>
		<div class="header_right">
			<ul>
				<li>
					<a href="create_new_course.jsp" class="upload_btn" title="Create New Course">Create New Course</a>
				</li>
				<li>
					<a href="shopping_cart.jsp" class="option_links" title="cart"><i class='uil uil-shopping-cart-alt'></i><span class="noti_count">2</span></a>
				</li>
				<li class="ui dropdown">
					<a href="#" class="option_links" title="Messages"><i class='uil uil-envelope-alt'></i><span class="noti_count">3</span></a>
					<div class="menu dropdown_ms">
						<a href="#" class="channel_my item">
							<div class="profile_link">
								<img src="images/left-imgs/img-6.jpg" alt="">
								<div class="pd_content">
									<h6>Zoena Singh</h6>
									<p>Hi! Sir, How are you. I ask you one thing please explain it this video price.</p>
									<span class="nm_time">2 min ago</span>
								</div>							
							</div>							
						</a>
						<a href="#" class="channel_my item">
							<div class="profile_link">
								<img src="images/left-imgs/img-5.jpg" alt="">
								<div class="pd_content">
									<h6>Joy Dua</h6>
									<p>Hello, I paid you video tutorial but did not play error 404.</p>
									<span class="nm_time">10 min ago</span>
								</div>							
							</div>							
						</a>
						<a href="#" class="channel_my item">
							<div class="profile_link">
								<img src="images/left-imgs/img-8.jpg" alt="">
								<div class="pd_content">
									<h6>Jass</h6>
									<p>Thanks Sir, Such a nice video.</p>
									<span class="nm_time">25 min ago</span>
								</div>							
							</div>							
						</a>
						<a class="vbm_btn" href="messages.jsp">View All <i class='uil uil-arrow-right'></i></a>
					</div>
				</li>
				<li class="ui dropdown">
					<a href="#" class="option_links" title="Notifications"><i class='uil uil-bell'></i><span class="noti_count">3</span></a>
					<div class="menu dropdown_mn">
						<a href="#" class="channel_my item">
							<div class="profile_link">
								<img src="images/left-imgs/img-1.jpg" alt="">
								<div class="pd_content">
									<h6>Rock William</h6>
									<p>Like Your Comment On Video <strong>How to create sidebar menu</strong>.</p>
									<span class="nm_time">2 min ago</span>
								</div>							
							</div>							
						</a>
						<a href="#" class="channel_my item">
							<div class="profile_link">
								<img src="images/left-imgs/img-2.jpg" alt="">
								<div class="pd_content">
									<h6>Jassica Smith</h6>
									<p>Added New Review In Video <strong>Full Stack PHP Developer</strong>.</p>
									<span class="nm_time">12 min ago</span>
								</div>							
							</div>							
						</a>
						<a href="#" class="channel_my item">
							<div class="profile_link">
								<img src="images/left-imgs/img-9.jpg" alt="">
								<div class="pd_content">
									<p> Your Membership Approved <strong>Upload Video</strong>.</p>
									<span class="nm_time">20 min ago</span>
								</div>							
							</div>							
						</a>
						<a class="vbm_btn" href="notifications.jsp">View All <i class='uil uil-arrow-right'></i></a>
					</div>
				</li>
				<li class="ui dropdown">
					<a href="#" class="opts_account" title="Account">
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
						<a href="dashboard.jsp" class="item channel_item">Cursus dashboard</a>						
						<a href="membership.jsp" class="item channel_item">Paid Memberships</a>
						<a href="setting.jsp" class="item channel_item">Setting</a>
						<a href="help.jsp" class="item channel_item">Help</a>
						<a href="feedback.jsp" class="item channel_item">Send Feedback</a>
						<a href="sign_in.jsp" class="item channel_item">Sign Out</a>
					</div>
				</li>
			</ul>
		</div>
	</header>
	<!-- Header End -->
	<!-- Left Sidebar Start -->
	<nav class="vertical_nav">
		<div class="left_section menu_left" id="js-menu" >
			<div class="left_section">
				<ul>
					<li class="menu--item">
						<a href="dashboard.jsp" class="menu--link active" title="Dashboard">
							<i class="uil uil-apps menu--icon"></i>
							<span class="menu--label">대시보드</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="courses.jsp" class="menu--link" title="Courses">
							<i class='uil uil-book-alt menu--icon'></i>
							<span class="menu--label">상품</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="analyics.jsp" class="menu--link" title="Analyics">
							<i class='uil uil-analysis menu--icon'></i>
							<span class="menu--label">분석</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="create_new_course.jsp" class="menu--link" title="Create Course">
							<i class='uil uil-plus-circle menu--icon'></i>
							<span class="menu--label">상품 만들기</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="messages.jsp" class="menu--link" title="Messages">
							<i class='uil uil-comments menu--icon'></i>
							<span class="menu--label">메시지</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="notifications.jsp" class="menu--link" title="Notifications">
						  <i class='uil uil-bell menu--icon'></i>
						  <span class="menu--label">알림</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="all_reviews.jsp" class="menu--link" title="Reviews">
						  <i class='uil uil-star menu--icon'></i>
						  <span class="menu--label">리뷰</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="instructor_earning.jsp" class="menu--link" title="Earning">
						  <i class='uil uil-dollar-sign menu--icon'></i>
						  <span class="menu--label">적립</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="instructor_payout.jsp" class="menu--link" title="Payout">
						  <i class='uil uil-wallet menu--icon'></i>
						  <span class="menu--label">지불금</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="instructor_statements.jsp" class="menu--link" title="Statements">
						  <i class='uil uil-file-alt menu--icon'></i>
						  <span class="menu--label">진술</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="calculate.jsp" class="menu--link" title="Verification">
						  <i class='uil uil-check-circle menu--icon'></i>
						  <span class="menu--label">확인</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="left_section pt-2">
				<ul>
					<li class="menu--item">
						<a href="setting.jsp" class="menu--link" title="Setting">
							<i class='uil uil-cog menu--icon'></i>
							<span class="menu--label">환경 설정</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="feedback.jsp" class="menu--link" title="Send Feedback">
							<i class='uil uil-comment-alt-exclamation menu--icon'></i>
							<span class="menu--label">피드백 보내기</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Left Sidebar End -->
	<!-- Body Start -->
	<div class="wrapper">
		<div class="sa4d25">
			<div class="container-fluid">			
				<div class="row">
					<div class="col-lg-12">	
						<h2 class="st_title"><i class="uil uil-apps"></i> 대시보드</h2>
					</div>
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="card_dash">
							<div class="card_dash_left">
								<h5>이번 달 판매액</h5>
								<h2>350원</h2>
								<span class="crdbg_1">New 50</span>
							</div>
							<div class="card_dash_right">
								<img src="images/dashboard/achievement.svg" alt="">
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="card_dash">
							<div class="card_dash_left">
								<h5>총 판매액</h5>
								<h2>1500원</h2>
								<span class="crdbg_2">New 125</span>
							</div>
							<div class="card_dash_right">
								<img src="images/dashboard/graduation-cap.svg" alt="">
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="card_dash">
							<div class="card_dash_left">
								<h5>등록한 상품 수</h5>
								<h2>130</h2>
								<span class="crdbg_3">New 5</span>
							</div>
							<div class="card_dash_right">
								<img src="images/dashboard/online-course.svg" alt="">
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="card_dash">
							<div class="card_dash_left">
								<h5>총 구매자</h5>
								<h2>2650</h2>
								<span class="crdbg_4">New 245</span>
							</div>
							<div class="card_dash_right">
								<img src="images/dashboard/knowledge.svg" alt="">
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="card_dash1">
							<div class="card_dash_left1">
								<i class="uil uil-book-alt"></i>
								<h1>판매 시작하기</h1>
							</div>
							<div class="card_dash_right1">
								<button class="create_btn_dash" onclick="window.location.href = 'create_new_course.jsp';">상품 등록</button>
							</div>
						</div>
					</div>					
				</div>
				<div class="row">
					<div class="col-xl-4 col-lg-6 col-md-6">
						<div class="section3125 mt-50">
							<h4 class="item_title">마지막 등록상품 분석</h4>
							<div class="la5lo1">
								<div class="owl-carousel courses_performance owl-theme">
									<div class="item">
										<div class="fcrse_1">
											<a href="#" class="fcrse_img">
												<img src="images/courses/img-1.jpg" alt="">
												<div class="course-overlay"></div>
											</a>
											<div class="fcrse_content">
												<div class="vdtodt">
													<span class="vdt14">&nbsp;</span>
												</div>
												<a href="#" class="crsedt145">&nbsp;</a>
												<div class="allvperf">
													<div class="crse-perf-left">&nbsp;</div>
													<div class="crse-perf-right">&nbsp;</div>
												</div>
												<div class="allvperf">
													<div class="crse-perf-left">&nbsp;</div>
													<div class="crse-perf-right">&nbsp;</div>
												</div>
												<div class="allvperf">
													<div class="crse-perf-left">&nbsp;</div>
													<div class="crse-perf-right">&nbsp;</div>
												</div>
												<div class="auth1lnkprce">
													<a href="#" class="cr1fot50">&nbsp;</a>
													<a href="#" class="cr1fot50">&nbsp;</a>
													<a href="#" class="cr1fot50">&nbsp;</a>
												</div>
											</div>
										</div>
									</div>
																		
								</div>
							</div>
						</div>
					</div>					
					<div class="col-xl-4 col-lg-6 col-md-6">
						<div class="section3125 mt-50">
							<h4 class="item_title">소식</h4>
							<div class="la5lo1">
								<div class="owl-carousel edututs_news owl-theme">
									
									<div class="item">
										<div class="fcrse_1">
											<a href="#" class="fcrse_img">
												<img src="images/courses/news-1.jpg" alt="">												
											</a>
											<div class="fcrse_content">
												<a href="#" class="crsedt145 mt-15">&nbsp;</a>
												<p class="news_des45">&nbsp;</p>
												<div class="auth1lnkprce">
													<a href="#" class="cr1fot50">더보기</a>
												</div>
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>						
					</div>
					<div class="col-xl-4 col-lg-6 col-md-6">
						<div class="section3125 mt-50">
							<h4 class="item_title">프로필 분석</h4>
							<div class="la5lo1">	
								<div class="fcrse_1">
									<div class="fcrse_content">
										<h6 class="crsedt8145">현재 팔로워</h6>
										<h3 class="subcribe_title">856</h3>
										<div class="allvperf">
											<div class="crse-perf-left">전망</div>
											<div class="crse-perf-right">17k<span class="analyics_pr"><i class="uil uil-arrow-to-bottom"></i>75%</span></div>
										</div>
										<div class="allvperf">
											<div class="crse-perf-left">구매<span class="per_text">(per hour)</span></div>
											<div class="crse-perf-right">1<span class="analyics_pr"><i class="uil uil-top-arrow-from-top"></i>100%</span></div>
										</div>
										<div class="allvperf">
											<div class="crse-perf-left">등록<span class="per_text">(per hour)</span></div>
											<div class="crse-perf-right">50<span class="analyics_pr"><i class="uil uil-top-arrow-from-top"></i>70%</span></div>
										</div> 
										<div class="auth1lnkprce">
											<a href="#" class="cr1fot50">프로필 분석으로 이동 (준비중)</a>
										</div>
									</div>
								</div>	
							</div>
						</div>
						<div class="section3125 mt-50">
							<h4 class="item_title">Submit Courses</h4>
							<div class="la5lo1">	
								<div class="fcrse_1">
									<div class="fcrse_content">
										<div class="upcming_card">
											<a href="#" class="crsedt145">The Complete JavaScript Course 2020: Build Real Projects!<span class="pndng_145">Pending</span></a>
											<p class="submit-course">Submitted<span>1 days ago</span></p>
											<a href="#" class="delete_link10">Delete</a>
										</div>
									</div>
								</div>	
							</div>
						</div>
						<div class="section3125 mt-50">
							<h4 class="item_title">CRIVE 의 새로운 기능</h4>
							<div class="la5lo1">	
								<div class="fcrse_1">
									<div class="fcrse_content">
										<a href="#" class="new_links10">대시보드의 성능 향상</a>
										<a href="#" class="new_links10">메시지의 추가 거부 기능추가</a>
										<a href="#" class="new_links10">알림 선택적 수신가능</a>
									</div>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="footer mt-40">
			<div class="container-fluid">
				<div class="row">					
					<div class="col-lg-12">
						<div class="item_f1">
							<a href="terms_of_use.jsp">정책</a>
							<a href="terms_of_use.jsp">저작권 정책</a>
							<a href="terms_of_use.jsp">개인정보 정책</a>
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
											<p>© 2020 <strong>CRIVE</strong>. All Rights Reserved.</p>
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

	<script src="js/vertical-responsive-menu.min.js"></script>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/semantic/semantic.min.js"></script>
	<script src="js/custom1.js"></script>
	<script src="js/night-mode.js"></script>
	
</body>
</html>
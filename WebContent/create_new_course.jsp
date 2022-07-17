<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="commodity.CommodityDAO"%>
<%@ page import="commodity.CommodityDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, shrink-to-fit=9">
<meta name="description" content="Gambolthemes">
<meta name="author" content="Gambolthemes">
<title>Cursus - Create New Course</title>
<!-- Favicon Icon -->
<link rel="icon" type="image/png" href="images/fav.png">
<!-- Stylesheets -->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,500'
	rel='stylesheet'>
<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
<link href="css/vertical-responsive-menu1.min.css" rel="stylesheet">
<link href="css/instructor-dashboard.css" rel="stylesheet">
<link href="css/instructor-responsive.css" rel="stylesheet">
<link href="css/night-mode.css" rel="stylesheet">
<link href="css/jquery-steps.css" rel="stylesheet">
<link rel="stylesheet" href="css/summernote-lite.css">
<!-- Vendor Stylesheets -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
<link href="vendor/OwlCarousel/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="vendor/semantic/semantic.min.css"> 
	
	
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>

	<%
		String userID = null;

	if (session.getAttribute("userID") != null)
		userID = (String) session.getAttribute("userID");
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='sign_in.jsp';");
		script.println("</script>");
		script.close();
	}

	UserDAO userDAO = new UserDAO();
	CommodityDAO commodityDAO = new CommodityDAO();
	%>
	<%
		//세션 오류처리
	String errorCode = null;
	if (session.getAttribute("err") != null) {
		errorCode = (String) session.getAttribute("err");
		session.removeAttribute("err");
	}
	%>

	<!-- Header Start -->
	<header class="header clearfix">
		<button type="button" id="toggleMenu" class="toggle_menu">
			<i class='uil uil-bars'></i>
		</button>
		<button id="collapse_menu" class="collapse_menu">
			<i class="uil uil-bars collapse_menu--icon "></i> <span
				class="collapse_menu--label"></span>
		</button>
		<div class="main_logo" id="logo">
			<a href="index.jsp"><img src="images/logo.svg" alt=""></a> <a
				href="index.jsp"><img class="logo-inverse"
				src="images/ct_logo.svg" alt=""></a>
		</div>
		<div class="top-category">
			<div class="ui compact menu cate-dpdwn">
				<div class="ui simple dropdown item">
					<a href="#" class="option_links p-0" title="categories"><i
						class="uil uil-apps"></i></a>
					<div class="menu dropdown_category5">
						<a href="#" class="item channel_item">category</a> <a href="#"
							class="item channel_item">Business</a> <a href="#"
							class="item channel_item">Finance & Accounting</a> <a href="#"
							class="item channel_item">IT & Software</a> <a href="#"
							class="item channel_item">Office Productivity</a> <a href="#"
							class="item channel_item">Personal category</a> <a href="#"
							class="item channel_item">category</a> <a href="#"
							class="item channel_item">Marketing</a> <a href="#"
							class="item channel_item">Lifestyle</a> <a href="#"
							class="item channel_item">Photography</a> <a href="#"
							class="item channel_item">Health & Fitness</a> <a href="#"
							class="item channel_item">Music</a> <a href="#"
							class="item channel_item">Teaching & Academics</a>
					</div>
				</div>
			</div>
		</div>
		<div class="search120">
			<div class="ui search">
				<div class="ui left icon input swdh10">
					<input class="prompt srch10" type="text"
						placeholder="Search for Tuts Videos, Tutors, Tests and more..">
					<i class='uil uil-search-alt icon icon1'></i>
				</div>
			</div>
		</div>
		<div class="header_right">
			<ul>
				<li><a href="create_new_course.jsp" class="upload_btn"
					title="Create New Course">Create New Course</a></li>
				<li><a href="shopping_cart.jsp" class="option_links"
					title="cart"><i class='uil uil-shopping-cart-alt'></i><span
						class="noti_count">2</span></a></li>
				<li class="ui dropdown"><a href="#" class="option_links"
					title="Messages"><i class='uil uil-envelope-alt'></i><span
						class="noti_count">3</span></a>
					<div class="menu dropdown_ms">
						<a href="#" class="channel_my item">
							<div class="profile_link">
								<img src="images/left-imgs/img-6.jpg" alt="">
								<div class="pd_content">
									<h6>Zoena Singh</h6>
									<p>Hi! Sir, How are you. I ask you one thing please explain
										it this video price.</p>
									<span class="nm_time">2 min ago</span>
								</div>
							</div>
						</a> <a href="#" class="channel_my item">
							<div class="profile_link">
								<img src="images/left-imgs/img-5.jpg" alt="">
								<div class="pd_content">
									<h6>Joy Dua</h6>
									<p>Hello, I paid you video tutorial but did not play error
										404.</p>
									<span class="nm_time">10 min ago</span>
								</div>
							</div>
						</a> <a href="#" class="channel_my item">
							<div class="profile_link">
								<img src="images/left-imgs/img-8.jpg" alt="">
								<div class="pd_content">
									<h6>Jass</h6>
									<p>Thanks Sir, Such a nice video.</p>
									<span class="nm_time">25 min ago</span>
								</div>
							</div>
						</a> <a class="vbm_btn" href="messages.jsp">View All <i
							class='uil uil-arrow-right'></i></a>
					</div></li>
				<li class="ui dropdown"><a href="#" class="option_links"
					title="Notifications"><i class='uil uil-bell'></i><span
						class="noti_count">3</span></a>
					<div class="menu dropdown_mn">
						<a href="#" class="channel_my item">
							<div class="profile_link">
								<img src="images/left-imgs/img-1.jpg" alt="">
								<div class="pd_content">
									<h6>Rock William</h6>
									<p>
										Like Your Comment On Video <strong>How to create
											sidebar menu</strong>.
									</p>
									<span class="nm_time">2 min ago</span>
								</div>
							</div>
						</a> <a href="#" class="channel_my item">
							<div class="profile_link">
								<img src="images/left-imgs/img-2.jpg" alt="">
								<div class="pd_content">
									<h6>Jassica Smith</h6>
									<p>
										Added New Review In Video <strong>Full Stack PHP
											Developer</strong>.
									</p>
									<span class="nm_time">12 min ago</span>
								</div>
							</div>
						</a> <a href="#" class="channel_my item">
							<div class="profile_link">
								<img src="images/left-imgs/img-9.jpg" alt="">
								<div class="pd_content">
									<p>
										Your Membership Approved <strong>Upload Video</strong>.
									</p>
									<span class="nm_time">20 min ago</span>
								</div>
							</div>
						</a> <a class="vbm_btn" href="notifications.jsp">View
							All <i class='uil uil-arrow-right'></i>
						</a>
					</div></li>
				<li class="ui dropdown"><a href="#" class="opts_account"
					title="Account"> <img src="images/hd_dp.jpg" alt="">
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
							<a href="my_instructor_profile_view.jsp" class="dp_link_12">View
								Instructor Profile</a>
						</div>
						<div class="night_mode_switch__btn">
							<a href="#" id="night-mode" class="btn-night-mode"> <i
								class="uil uil-moon"></i> Night mode <span
								class="btn-night-mode-switch"> <span
									class="uk-switch-button"></span>
							</span>
							</a>
						</div>
						<a href="dashboard.jsp" class="item channel_item">Cursus
							dashboard</a> <a href="membership.jsp" class="item channel_item">Paid
							Memberships</a> <a href="setting.jsp" class="item channel_item">Setting</a>
						<a href="help.jsp" class="item channel_item">Help</a> <a
							href="feedback.jsp" class="item channel_item">Send Feedback</a> <a
							href="sign_in.jsp" class="item channel_item">Sign Out</a>
					</div></li>
			</ul>
		</div>
	</header>
	<!-- Header End -->
	<!-- Left Sidebar Start -->
	<nav class="vertical_nav">
		<div class="left_section menu_left" id="js-menu">
			<div class="left_section">
				<ul>
					<li class="menu--item"><a href="dashboard.jsp"
						class="menu--link" title="Dashboard"> <i
							class="uil uil-apps menu--icon"></i> <span class="menu--label">Dashboard</span>
					</a></li>
					<li class="menu--item"><a href="courses.jsp"
						class="menu--link" title="Courses"> <i
							class='uil uil-book-alt menu--icon'></i> <span
							class="menu--label">Courses</span>
					</a></li>
					<li class="menu--item"><a href="analyics.jsp"
						class="menu--link" title="Analyics"> <i
							class='uil uil-analysis menu--icon'></i> <span
							class="menu--label">Analyics</span>
					</a></li>
					<li class="menu--item"><a href="create_new_course.jsp"
						class="menu--link active" title="Create Course"> <i
							class='uil uil-plus-circle menu--icon'></i> <span
							class="menu--label">Create Course</span>
					</a></li>
					<li class="menu--item"><a href="messages.jsp"
						class="menu--link" title="Messages"> <i
							class='uil uil-comments menu--icon'></i> <span
							class="menu--label">Messages</span>
					</a></li>
					<li class="menu--item"><a href="notifications.jsp"
						class="menu--link" title="Notifications"> <i
							class='uil uil-bell menu--icon'></i> <span class="menu--label">Notifications</span>
					</a></li>
					<li class="menu--item"><a
						href="instructor_my_certificates.jsp" class="menu--link"
						title="My Certificates"> <i class='uil uil-award menu--icon'></i>
							<span class="menu--label">My Certificates</span>
					</a></li>
					<li class="menu--item"><a href="all_reviews.jsp"
						class="menu--link" title="Reviews"> <i
							class='uil uil-star menu--icon'></i> <span class="menu--label">Reviews</span>
					</a></li>
					<li class="menu--item"><a href="instructor_earning.jsp"
						class="menu--link" title="Earning"> <i
							class='uil uil-dollar-sign menu--icon'></i> <span
							class="menu--label">Earning</span>
					</a></li>
					<li class="menu--item"><a href="instructor_payout.jsp"
						class="menu--link" title="Payout"> <i
							class='uil uil-wallet menu--icon'></i> <span class="menu--label">Payout</span>
					</a></li>
					<li class="menu--item"><a href="instructor_statements.jsp"
						class="menu--link" title="Statements"> <i
							class='uil uil-file-alt menu--icon'></i> <span
							class="menu--label">Statements</span>
					</a></li>
					<li class="menu--item"><a href="calculate.jsp"
						class="menu--link" title="Verification"> <i
							class='uil uil-check-circle menu--icon'></i> <span
							class="menu--label">Verification</span>
					</a></li>
				</ul>
			</div>
			<div class="left_section pt-2">
				<ul>
					<li class="menu--item"><a href="setting.jsp"
						class="menu--link" title="Setting"> <i
							class='uil uil-cog menu--icon'></i> <span class="menu--label">Setting</span>
					</a></li>
					<li class="menu--item"><a href="feedback.jsp"
						class="menu--link" title="Send Feedback"> <i
							class='uil uil-comment-alt-exclamation menu--icon'></i> <span
							class="menu--label">Send Feedback</span>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Left Sidebar End -->
	<!-- Body Start -->
	<div class="wrapper">
		<div class="sa4d25">
			<div class="container">
				<form method="post" action="commodityUpload.jsp" id="write"
					enctype="multipart/form-data">
					<div class="row">
						<div class="col-lg-12">
							<h2 class="st_title">
								<i class="uil uil-analysis"></i>상품 등록
							</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="course_tabs_1">
								<div id="add-course-tab" class="step-app">
									<ul class="step-steps">
										<li class="active"><a href="#tab_step1"> <span
												class="number"></span> <span class="step-name">글 작성</span>
										</a></li>
										<li><a href="#tab_step2"> <span class="number"></span>
												<span class="step-name">카테고리</span>
										</a></li>
										<li><a href="#tab_step3"> <span class="number"></span>
												<span class="step-name">커버 사진 등록</span>
										</a></li>
										<li><a href="#tab_step4"> <span class="number"></span>
												<span class="step-name">구매자 필독 & 파일 등록</span>
										</a></li>
									</ul>
									<div class="step-content">
										<div class="step-tab-panel step-tab-info active" id="tab_step1">
											<div class="tab-from-content">
												<div class="title-icon">
													<h3 class="title">
														<i class="uil uil-info-circle"></i>글 작성
													</h3>
												</div>
												<div class="course__form">
													<div class="general_info10">
														<div class="row">
															<div class="col-lg-6 col-md-6">
																<div class="ui search focus mt-30 lbel25">
																	<label>제목*</label>
																	<div class="ui left icon input swdh19">
																		<input class="prompt srch_explore" type="text"
																			placeholder="Insert your title." name="title"
																			data-purpose="edit-course-title" maxlength="60"
																			id="main[title]" value="" required>
																		<div class="badge_num">60</div>
																	</div>
																</div>
															</div>
															<div class="col-lg-6 col-md-6">
																<div class="ui search focus mt-30 lbel25">
																	<label>부제목*</label>
																	<div class="ui left icon input swdh19">
																		<input class="prompt srch_explore" type="text"
																			placeholder="Insert your Subtitle." name="subtitle"
																			data-purpose="edit-course-title" maxlength="60"
																			id="sub[title]" value="" required>
																		<div class="badge_num2">120</div>
																	</div>
																</div>
															</div>
															<div class="col-lg-12 col-md-12">
																<div class="course_des_textarea mt-30 lbel25">
																	<label>소개글*</label>
																	<div class="course_des_bg">
																		<textarea id="summernote" name="description"></textarea>
																	</div>
																</div>
															</div>
															<div class="col-lg-4 col-md-12">
																<div class="mt-30 lbel25">
																	<label>언어*</label>
																</div>
																<select
																	class="ui hj145 dropdown cntry152 prompt srch_explore">
																	<option value="1">한국어</option>
																</select>
															</div>
															<!--
															<div class="col-lg-4 col-md-6">
																<div class="mt-30 lbel25">
																	<label>카테고리 선택*</label>
																</div>
																<select class="ui hj145 dropdown cntry152 prompt srch_explore" name="category" required>
																	<option value="">Select Category</option>
																	<option value="Minecraft">Minecraft</option>
																	<option value="Program">Program</option>
																</select>
															</div>
															<div class="col-lg-4 col-md-6">
																<div class="mt-30 lbel25">
																	<label>세부 카테고리 선택*</label>
																</div>
																<select
																	class="ui hj145 dropdown cntry152 prompt srch_explore"
																	name="subcategory" class="" required>
																	<option value="">Select Subcategory</option>
																	<option value="C++">C++</option>
																</select>
															</div>
															-->
														</div>
													</div>
													<div class="price_course">
														<div class="row">
															<div class="col-lg-12">
																<div class="price_title">
																	<h4>
																		<i class="uil uil-dollar-sign-alt"></i>가격
																	</h4>
																</div>
															</div>
															<div class="col-lg-3 col-md-4 col-sm-6">
																<div class="mt-30 lbel25">
																	<label>금액*</label>
																</div>
																<div class="ui search focus lbel25">
																	<div class="ui left icon input swdh19">
																		<input class="prompt srch_explore" type="number"
																			placeholder="Insert your price" name="price"
																			data-purpose="edit-course-title" maxlength="8"
																			id="main[title]" value="" required>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										<div class="step-tab-panel step-tab-location" id="tab_step2">
											<div class="tab-from-content">
												<div class="title-icon">
													<h3 class="title">
														<i class="uil uil-info-circle"></i>카테고리
													</h3>
												</div>
												<div class="course__form">
													<div class="row">
														<div class="col-lg-12">
															
		<div class="faq1256">
			<div class="container">
				<div class="row justify-content-lg-center justify-content-md-center">					
					<div class="col-lg-6 col-md-8">						
						<div class="certi_form">
							<div class="sign_form">
								<h2>판매 카테고리를 선택하세요.</h2>
									<div class="category_cop mt-40">
										<div class="panel-groupaccordion" id="accordiontest">
											<div class="panel panel-default">
												<div class="panel-heading" id="headingOne">
													<div class="panel-title10">
														<a class="collapsed" data-toggle="collapse" data-target="#collapseOne" href="#" aria-expanded="false" aria-controls="collapseOne">
															Development <span style="color:grey; font-size:12px;">개발</span>
														</a>
													</div>
												</div>
												<div id="collapseOne" class="panel-collapse collapse" aria-labelledby="headingOne" data-parent="#accordiontest">
													<div class="panel-body">
														<div class="ui form">
															<div class="grouped fields">								
																<div class="field fltr-radio">
																	<div class="ui radio checkbox">
																		<input type="radio" tabindex="0" name="category" value="Development-HTML & CSS" class="hidden">
																		<label>HTML & CSS</label>
																	  </div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Development-JavaScript & JQuery" class="hidden">
																		<label>JavaScript & JQuery</label>
																	</div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Development-Back End" class="hidden">
																		<label>Back End</label>
																	</div>
																</div>
																<div class="field fltr-radio">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Development-Front End" class="hidden">
																		<label>Front End</label>
																	  </div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Development-Script" class="hidden">
																		<label>Script <span style="color:grey; font-size:5px;">Minecraft</span></label>
																	</div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Development-Magic Spells" class="hidden">
																		<label>Magic Spells <span style="color:grey; font-size:5px;">Minecraft</span></label>
																	</div>
																</div>	
																<div class="field fltr-radio">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Development-Plugin" class="hidden">
																		<label>Plugin <span style="color:grey; font-size:5px;">Minecraft</span></label>
																	  </div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Development-MysticMob" class="hidden">
																		<label>MysticMob <span style="color:grey; font-size:5px;">Minecraft</span></label>
																	</div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Development-Map" class="hidden">
																		<label>Map <span style="color:grey; font-size:5px;">Minecraft</span></label>
																	</div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Development-Other" class="hidden">
																		<label>Other</label>
																	</div>
																</div>	
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="panel panel-default">
												<div class="panel-heading" id="headingTwo">
													<div class="panel-title10">
														<a class="collapsed" data-toggle="collapse" data-target="#collapseTwo" href="#" aria-expanded="false" aria-controls="collapseTwo">
															Commission & Outsourcing <span style="color:grey; font-size:12px;">커미션 & 외주</span>
														</a>
													</div>
												</div>
												<div id="collapseTwo" class="panel-collapse collapse" aria-labelledby="headingTwo" data-parent="#accordiontest">
													<div class="panel-body">
														<div class="ui form">
															<div class="grouped fields">										
																<div class="field fltr-radio">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Commission & Outsourcing-Web site" class="hidden">
																		<label>Web site</label>
																	  </div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Commission & Outsourcing-Image" class="hidden">
																		<label>Image</label>
																	</div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Commission & Outsourcing-Video" class="hidden">
																		<label>Video</label>
																	</div>
																</div>
																<div class="field fltr-radio">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Commission & Outsourcing-Plugin" class="hidden">
																		<label>Plugin <span style="color:grey; font-size:5px;">Minecraft</span></label>
																	  </div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Commission & Outsourcing-Script" class="hidden">
																		<label>Script <span style="color:grey; font-size:5px;">Minecraft</span></label>
																	</div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Commission & Outsourcing-Resource Pack" class="hidden">
																		<label>Resource Pack <span style="color:grey; font-size:5px;">Minecraft</span></label>
																	</div>
																</div>	
																<div class="field fltr-radio">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Commission & Outsourcing-Map" class="hidden">
																		<label>Map <span style="color:grey; font-size:5px;">Minecraft</span></label>
																	  </div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Commission & Outsourcing-Other" class="hidden">
																		<label>Other</label>
																	</div>
																</div>	
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="panel panel-default">
												<div class="panel-heading" id="headingThree">
													 <div class="panel-title10">
														<a class="collapsed" data-toggle="collapse" data-target="#collapseThree" href="#" aria-expanded="false" aria-controls="collapseThree">
															Design <span style="color:grey; font-size:12px;">디자인</span>
														</a>
													</div>
												</div>
												<div id="collapseThree" class="panel-collapse collapse" aria-labelledby="headingThree" data-parent="#accordiontest">
													<div class="panel-body">
														<div class="ui form">
															<div class="grouped fields">										
																<div class="field fltr-radio">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Design-Profile" class="hidden">
																		<label>Profile</label>
																	  </div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Design-Illustrator" class="hidden">
																		<label>Illustrator</label>
																	</div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Design-Skin" class="hidden">
																		<label>Skin <span style="color:grey; font-size:5px;">Minecraft</span></label>
																	</div>
																</div>
																<div class="field fltr-radio">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Design-Publicity" class="hidden">
																		<label>Publicity <span style="color:grey; font-size:5px;">홍보지</span></label>
																	  </div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Design-Banner" class="hidden">
																		<label>Banner <span style="color:grey; font-size:5px;">Minecraft</span></label>
																	</div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Design-Resource Pack" class="hidden">
																		<label>Resource Pack <span style="color:grey; font-size:5px;">Minecraft</span></label>
																	</div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Design-Motion Graphics" class="hidden">
																		<label>Motion Graphics</label>
																	</div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Design-2D Animation" class="hidden">
																		<label>2D Animation</label>
																	</div>
																</div>
																<div class="field">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" tabindex="0" value="Design-Other" class="hidden">
																		<label>Other</label>
																	</div>
																</div>																
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="panel panel-default">
												<div class="panel-heading" id="headingfour">
													<div class="panel-title10">
														<a class="collapsed" data-toggle="collapse" data-target="#collapsefour" href="#" aria-expanded="false" aria-controls="collapsefour">
															Other <span style="color:grey; font-size:12px;">기타</span>
														</a>
													</div>
												</div>
												<div id="collapsefour" class="panel-collapse collapse" aria-labelledby="headingfour" data-parent="#accordiontest">
													<div class="panel-body">
														<div class="ui form">
															<div class="grouped fields">										
																<div class="field fltr-radio">
																	<div class="ui radio checkbox">
																		<input type="radio" name="category" value="Other-Other" tabindex="0" class="hidden" checked>
																		<label>Other</label>
																	  </div>
																</div>																								
															</div>
														</div>
													</div>
												</div>
											</div>
																				
										</div>
									</div>
									<p class="testtrm145">카테고리 추가를 희망하신다면 <a href="#">피드백</a> 창을 이용해주세요.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										<div class="step-tab-panel step-tab-gallery" id="tab_step3">
											<div class="tab-from-content">
												<div class="title-icon">
													<h3 class="title">
														<i class="uil uil-image-upload"></i>커버 이미지
													</h3>
												</div>
												<div class="course__form">
													<div class="view_info10">
														<div class="row">
															<div class="col-lg-12">
																<div class="view_all_dt">
																	<div class="view_img_left">
																		<div class="view__img">
																			<img src="images/courses/add_img.jpg"
																				id="preview-image">
																		</div>
																	</div>
																	<div class="view_img_right">
																		<h4>커버 이미지</h4>
																		<p>이미지를 올려주세요. 750x422 크기 이미지 규격을 확인 해주세요 .jpg,
																			.jpeg, .png, .bmp, .gif 이외의 확장자는 지원하지 않습니다.</p>
																		<div class="upload__input">
																			<div class="input-group">
																				<div class="custom-file">
																					<input type="file" class="custom-file-input"
																						accept=".jpg, .jpeg, .png" id="input-image"
																						name="coverImage" required> <label
																						class="custom-file-label" for="input-image">Upload
																						File에 마우스를 올리셔야 선택여부가 보입니다.</label>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="step-tab-panel step-tab-location" id="tab_step4">
											<div class="tab-from-content">
													<div class="title-icon">
														<h3 class="title">
															<i class="uil uil-info-circle"></i>구매자 필독 & 파일
														</h3>
													</div>
													<div class="course__form">
														<div class="general_info10">
															<div class="row">
																<div class="col-lg-12 col-md-12">
																	<div class="course_des_textarea mt-30 lbel25">
																		<label>구매자 필독글*</label>
																		<div class="course_des_bg">
																			<textarea id="summernote-1" name="buyerDescription" required="required"></textarea>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="price_course">
															<div class="row">
																<div class="col-lg-12">
																	<div class="view_info10">
																		<div class="row">
																			<div class="col-lg-4">
																				<div class="part_input lbel25">
																					<label>파일*</label>
																					<div class="input-group">
																						<div class="custom-file">
																							<input type="file" name="file"
																								class="custom-file-input" id="inputGroupFile06"
																								required> <label class="custom-file-label"
																								for="inputGroupFile06">Browse 위 마우스를 올리세요</label>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>

										</div>
						
						
									</div>
									<div class="step-footer step-tab-pager">
										<button data-direction="prev"
											class="btn btn-default steps_btn">이전</button>
										<button data-direction="next"
											class="btn btn-default steps_btn">다음</button>
										<button data-direction="finish"
											class="btn btn-default steps_btn" type="submit">게시</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="alert alert-danger" id="errorDiv"
			style="position: fixed; bottom: 20px; left: 72%; height: 60px; width: 25%; z-index: 1; display: none;">
			<div class="row">
				<div class="col-sm-10" id="alert-err">
					<strong>Error</strong> No Content
				</div>
				<div class="col-sm-2">
					<button type="button" class="close"
						onclick="$('#errorDiv').fadeOut(1000);" style=""
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</div>
		</div>

		<div class="alert alert-warning" id="warningDiv"
			style="position: fixed; bottom: 20px; left: 72%; height: 60px; width: 25%; z-index: 2; display: none;">
			<div class="row">
				<div class="col-sm-10" id="alert-warn">
					<strong>Warning</strong> No Content
				</div>
				<div class="col-sm-2">
					<button type="button" class="close"
						onclick="$('#warningDiv').fadeOut(1000);" style=""
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</div>
		</div>

		<div class="alert alert-success" id="successDiv"
			style="position: fixed; bottom: 20px; left: 72%; height: 60px; width: 25%; z-index: 3; display: none;">
			<div class="row">
				<div class="col-sm-10" id="alert-success">
					<strong>Success</strong> No Content
				</div>
				<div class="col-sm-2">
					<button type="button" class="close"
						onclick="$('#successDiv').fadeOut(1000);" style=""
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</div>
		</div>

		<footer class="footer mt-40">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="item_f1">
							<a href="terms_of_use.jsp">Copyright Policy</a> <a
								href="terms_of_use.jsp">Terms</a> <a href="terms_of_use.jsp">Privacy
								Policy</a>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="footer_bottm">
							<div class="row">
								<div class="col-md-6">
									<ul class="fotb_left">
										<li><a href="index.jsp">
												<div class="footer_logo">
													<img src="images/logo1.svg" alt="">
												</div>
										</a></li>
										<li>
											<p>
												© 2020 <strong>Cursus</strong>. All Rights Reserved.
											</p>
										</li>
									</ul>
								</div>
								<div class="col-md-6">
									<div class="edu_social_links">
										<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
											class="fab fa-twitter"></i></a> <a href="#"><i
											class="fab fa-google-plus-g"></i></a> <a href="#"><i
											class="fab fa-linkedin-in"></i></a> <a href="#"><i
											class="fab fa-instagram"></i></a> <a href="#"><i
											class="fab fa-youtube"></i></a> <a href="#"><i
											class="fab fa-pinterest-p"></i></a>
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
	<script src="js/custom.js"></script>
	<script src="js/night-mode.js"></script>
	<script src="js/jquery-steps.min.js"></script>
	<script src="js/summernote-lite.js"></script>
	<script src="js/summernote-ko-KR.js"></script>
	<script>
	const Toast = Swal.mixin({ 
		toast: true, position: 'bottom', 
		showConfirmButton: false, timer: 2500,
		timerProgressBar: true, 
		didOpen: (toast) => { toast.addEventListener('mouseenter', Swal.stopTimer) 
			toast.addEventListener('mouseleave', Swal.resumeTimer) } 
		})
	</script>
	<script>
		$('#add-course-tab').steps({
		  onFinish: function () {
		  	$('#write').submit();
		  }
		});	
		function readImage(input) {
		    if(input.files && input.files[0]) {
		    	var file=input.files[0].name;  
		    	var fileSuffix =file.substring(file.lastIndexOf(".") + 1);
		    	var browser = navigator.userAgent.toLowerCase();
		    	
		    	fileSuffix = fileSuffix.toLowerCase();
		    	 if (!( "jpg" == fileSuffix || "jpeg" == fileSuffix  || "gif" == fileSuffix || "bmp" == fileSuffix 
		    	    || "png" == fileSuffix )){
		    		 	Toast.fire({ icon: 'warning', 
		    			    title: '지원하지 않는 파일 형식입니다.' })
		    		$("#input-image").val("");
		    		return false;
		    	 }if(file.size>=3*1024*1024) {
		         	$("#input-image").val("");
		         	Toast.fire({ icon: 'error', 
	    			    title: '파일 크기가 너무 큽니다.' })
		            return false;
		            }
		        const reader = new FileReader()
		        reader.onload = e => {
		            const previewImage = document.getElementById("preview-image")
		            previewImage.src = e.target.result
}
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0])
		    }
		}
		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("input-image")
		inputImage.addEventListener("change", e => {
		    readImage(e.target)
		})
	</script>
	<script>
		$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
		height: 250,                 // 에디터 높이
		minHeight: null,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: ''	//placeholder 설정
		});
	});
	
		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote-1').summernote({
			height: 250,                 // 에디터 높이
			minHeight: null,             // 최소 높이
			maxHeight: null,             // 최대 높이
			focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			lang: "ko-KR",					// 한글 설정
			placeholder: '4096자 이내로 입력하세요.'	//placeholder 설정
			});
		});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="setting.*" %>

<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>

	<head>
		<meta charset="utf-8">	
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">		
		<title>Curve - Setting</title>
		
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
		
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		
	</head>

<body>
<%
	String userID=null;

	if(session.getAttribute("userID")!=null)
		userID=(String)session.getAttribute("userID");
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='sign_in.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	SettingDTO setDTO = new SettingDTO();
	SettingDAO setDAO = new SettingDAO();
	
	setDTO = setDAO.getData(userID);
	if(setDTO==null&&userID!=null) {
		setDAO.upsert(new SettingDTO(userID,true,true,true,true,true,true,true,true,true));
	}
%>
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
									<span>1324qqww@gmail.com</span>
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
						<a href="index.jsp" class="menu--link" title="Home">
							<i class='uil uil-home-alt menu--icon'></i>
							<span class="menu--label">Home</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="live_streams.jsp" class="menu--link" title="Live Streams">
							<i class='uil uil-kayak menu--icon'></i>
							<span class="menu--label">Live Streams</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="explore.jsp" class="menu--link" title="Explore">
							<i class='uil uil-search menu--icon'></i>
							<span class="menu--label">Explore</span>
						</a>
					</li>
					<li class="menu--item menu--item__has_sub_menu">
						<label class="menu--link" title="Categories">
							<i class='uil uil-layers menu--icon'></i>
							<span class="menu--label">Categories</span>
						</label>
						<ul class="sub_menu">
							<li class="sub_menu--item">
								<a href="#" class="sub_menu--link">Development</a>
							</li>
							<li class="sub_menu--item">
								<a href="#" class="sub_menu--link">Business</a>
							</li>
							<li class="sub_menu--item">
								<a href="#" class="sub_menu--link">Finance & Accounting</a>
							</li>
							<li class="sub_menu--item">
								<a href="#.jsp" class="sub_menu--link">IT & Software</a>
							</li>
							<li class="sub_menu--item">
								<a href="#" class="sub_menu--link">Office Productivity</a>
							</li>
							<li class="sub_menu--item">
								<a href="#" class="sub_menu--link">Personal Development</a>
							</li>
							<li class="sub_menu--item">
								<a href="#" class="sub_menu--link">Design</a>
							</li>
							<li class="sub_menu--item">
								<a href="#" class="sub_menu--link">Marketing</a>
							</li>
							<li class="sub_menu--item">
								<a href="#" class="sub_menu--link">Lifestyle</a>
							</li>
							<li class="sub_menu--item">
								<a href="#" class="sub_menu--link">Photography</a>
							</li>
							<li class="sub_menu--item">
								<a href="#" class="sub_menu--link">Health & Fitness</a>
							</li>
							<li class="sub_menu--item">
								<a href="#" class="sub_menu--link">Music</a>
							</li>
							<li class="sub_menu--item">
								<a href="#" class="sub_menu--link">Teaching & Academics</a>
							</li>
						</ul>
					</li>
					<li class="menu--item  menu--item__has_sub_menu">
						<label class="menu--link" title="Tests">
						  <i class='uil uil-clipboard-alt menu--icon'></i>
						  <span class="menu--label">Tests</span>
						</label>
						<ul class="sub_menu">
							<li class="sub_menu--item">
								<a href="certification_center.jsp" class="sub_menu--link">Certification Center</a>
							</li>
							<li class="sub_menu--item">
								<a href="certification_start_form.jsp" class="sub_menu--link">Certification Fill Form</a>
							</li>
							<li class="sub_menu--item">
								<a href="certification_test_view.jsp" class="sub_menu--link">Test View</a>
							</li>
							<li class="sub_menu--item">
								<a href="certification_test__result.jsp" class="sub_menu--link">Test Result</a>
							</li>
							<li class="sub_menu--item">
								<a href="http://www.gambolthemes.net/html-items/edututs+/Instructor_Dashboard/my_certificates.jsp" class="sub_menu--link">My Certification</a>
							</li>
						</ul>
					</li>
					<li class="menu--item">
						<a href="saved_courses.jsp" class="menu--link" title="Saved Courses">
						  <i class="uil uil-heart-alt menu--icon"></i>
						  <span class="menu--label">Saved Courses</span>
						</a>
					</li>
					<li class="menu--item  menu--item__has_sub_menu">
						<label class="menu--link" title="Pages">
						  <i class='uil uil-file menu--icon'></i>
						  <span class="menu--label">Pages</span>
						</label>
						<ul class="sub_menu">
							<li class="sub_menu--item">
								<a href="about_us.jsp" class="sub_menu--link">About</a>
							</li>
							<li class="sub_menu--item">
								<a href="sign_in.jsp" class="sub_menu--link">Sign In</a>
							</li>
							<li class="sub_menu--item">
								<a href="sign_up.jsp" class="sub_menu--link">Sign Up</a>
							</li>
							<li class="sub_menu--item">
								<a href="sign_up_steps.jsp" class="sub_menu--link">Sign Up Steps</a>
							</li>
							<li class="sub_menu--item">
								<a href="membership.jsp" class="sub_menu--link">Paid Membership</a>
							</li>
							<li class="sub_menu--item">
								<a href="detail_view.jsp" class="sub_menu--link">Course Detail View</a>
							</li>
							<li class="sub_menu--item">
								<a href="checkout_membership.jsp" class="sub_menu--link">Checkout</a>
							</li>
							<li class="sub_menu--item">
								<a href="invoice.jsp" class="sub_menu--link">Invoice</a>
							</li>
							<li class="sub_menu--item">
								<a href="career.jsp" class="sub_menu--link">Career</a>
							</li>
							<li class="sub_menu--item">
								<a href="apply_job.jsp" class="sub_menu--link">Job Apply</a>
							</li>
							<li class="sub_menu--item">
								<a href="our_blog.jsp" class="sub_menu--link">Our Blog</a>
							</li>
							<li class="sub_menu--item">
								<a href="blog_single_view.jsp" class="sub_menu--link">Blog Detail View</a>
							</li>
							<li class="sub_menu--item">
								<a href="company_details.jsp" class="sub_menu--link">Company Details</a>
							</li>
							<li class="sub_menu--item">
								<a href="press.jsp" class="sub_menu--link">Press</a>
							</li>
							<li class="sub_menu--item">
								<a href="live_output.jsp" class="sub_menu--link">Live Stream View</a>
							</li>							<li class="sub_menu--item">

								<a href="add_streaming.jsp" class="sub_menu--link">Add live Stream</a>
							</li>
							<li class="sub_menu--item">
								<a href="search_result.jsp" class="sub_menu--link">Search Result</a>
							</li>
							<li class="sub_menu--item">
								<a href="thank_you.jsp" class="sub_menu--link">Thank You</a>
							</li>
							<li class="sub_menu--item">
								<a href="coming_soon.jsp" class="sub_menu--link">Coming Soon</a>
							</li>
							<li class="sub_menu--item">
								<a href="error_404.jsp" class="sub_menu--link">Error 404</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="left_section">
				<h6 class="left_title">SUBSCRIPTIONS</h6>
				<ul>
					<li class="menu--item">
						<a href="instructor_profile_view.jsp" class="menu--link user_img">
							<img src="images/left-imgs/img-1.jpg" alt="">
							Rock Smith
							<div class="alrt_dot"></div>
						</a>
					</li>
					<li class="menu--item">
						<a href="instructor_profile_view.jsp" class="menu--link user_img">
							<img src="images/left-imgs/img-2.jpg" alt="">
							Jassica William
						</a>
						<div class="alrt_dot"></div>
					</li>
					<li class="menu--item">
						<a href="all_instructor.jsp" class="menu--link" title="Browse Instructors">
						  <i class='uil uil-plus-circle menu--icon'></i>
						  <span class="menu--label">Browse Instructors</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="left_section pt-2">
				<ul>
					<li class="menu--item">
						<a href="setting.jsp" class="menu--link active" title="Setting">
							<i class='uil uil-cog menu--icon'></i>
							<span class="menu--label">Setting</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="help.jsp" class="menu--link" title="Help">
							<i class='uil uil-question-circle menu--icon'></i>
							<span class="menu--label">Help</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="report_history.jsp" class="menu--link" title="Report History">
							<i class='uil uil-windsock menu--icon'></i>
							<span class="menu--label">Report History</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="feedback.jsp" class="menu--link" title="Send Feedback">
							<i class='uil uil-comment-alt-exclamation menu--icon'></i>
							<span class="menu--label">Send Feedback</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="left_footer">
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
				<div class="left_footer_content">
					<p>© 2020 <strong>Cursus</strong>. All Rights Reserved.</p>
				</div>
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
						<h2 class="st_title"><i class='uil uil-cog'></i> Setting</h2>
						<div class="setting_tabs">
							<ul class="nav nav-pills mb-4" id="pills-tab" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" id="pills-account-tab" data-toggle="pill" href="#pills-account" role="tab" aria-selected="true">계정</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="pills-notification-tab" data-toggle="pill" href="#pills-notification" role="tab" aria-selected="false">알림</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="pills-privacy-tab" data-toggle="pill" href="#pills-privacy" role="tab" aria-selected="false">공개</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="pills-bllingpayment-tab" data-toggle="pill" href="#pills-bllingpayment" role="tab" aria-selected="false">결제</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="pills-api-tab" data-toggle="pill" href="#pills-api" role="tab" aria-selected="false">API 클라이언트</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="pills-closeaccount-tab" data-toggle="pill" href="#pills-closeaccount" role="tab" aria-selected="false">계정 삭제</a>
								</li>
							</ul>
						</div>
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-account" role="tabpanel" aria-labelledby="pills-account-tab">
								<div class="account_setting"> 
								<form method="post" action="settingAction.jsp" enctype="multipart/form-data">
									<h4>계정 로그인 활성화</h4>
									<p>당신은 현재 "<%=userDAO.getUserName(userID)%>" 의 계정으로 로그인 되어 있습니다.</p>
									<div class="basic_profile">
									<%if(!userDAO.getUserEmailChecked(userID)) {%><button class="save_btn" id="emailCheck">이메일 인증이 필요합니다.</button><%}%>
										<div class="basic_ptitle">
											<h4>프로필</h4>
											<p>다른 유저에게 보이는 프로필 입니다.</p>
										</div>
										<div class="basic_form">
											<div class="row">
												<div class="col-lg-8">
													<div class="row">
														<div class="col-lg-6">
															<div class="ui search focus row" style="margin-top:80px;">
																<div class="ui left icon input swdh11 swdh19 col-lg-6">
																	<input class="prompt srch_explore" type="text" name="" value="<%=userDAO.getUserName(userID)%>" id="id[name]" required maxlength="12" placeholder="닉네임" disabled="disabled">	
																	<input type="hidden" name="userName" value="<%=userDAO.getUserName(userID)%>">
																</div>
																<div class="part_input mt-1 lbel25 col-lg-6">
																	<div class="input-group">
																		<div class="custom-file">
																			<input type="file" name="profileImage" class="custom-file-input" accept=".jpg, .jpeg, .png" id="input-image">
																			<label class="custom-file-label" for="input-image">프로필 이미지</label>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="tutor_img col-lg-2">
															<label for="input-image"><img src="./ProfileImages/<%=userDAO.getProfileImage(userID)%>" id="preview-image"></label>												
														</div>
														<div class="col-lg-12">
															<div class="ui search focus mt-10">
																<div class="ui left icon input swdh11 swdh19">
																	<input class="prompt srch_explore" type="text" name="shortContent" value="<%=userDAO.getProfileShortContent(userID)%>" id="id_headline" required maxlength="36" placeholder="간략한 소개를 작성하세요">				
																	<div class="form-control-counter" data-purpose="form-control-counter">36</div>
																</div>
																<div class="help-block">36자 이내의 자기소개를 작성 해주세요.</div>
															</div>
														</div>
														<div class="col-lg-12">
															<div class="ui search focus mt-30">																
																<div class="ui form swdh30">
																	<div class="field">
																		<textarea rows="3" name="content" id="id_about" maxlength="2048" placeholder="소개를 작성하세요"><%=userDAO.getProfileContent(userID)%></textarea>
																	</div>
																</div>
																<div class="help-block">2048자 이내의 자기소개를 작성 해주세요.</div>
																</div>
															</div>
															<div class="col-lg-12">
																<div class="divider-1"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="basic_profile1">
											<div class="basic_ptitle">
												<h4>추가정보 설정</h4>
											</div>
											<div class="basic_form">
												<div class="row">
													<div class="col-lg-8">
														<div class="row">
															<div class="col-lg-12">
																<div class="ui search focus mt-30">
																	<div class="ui left icon labeled input swdh11 swdh31">
																		<div class="ui label lb12">
																			http://facebook.com/
																		</div>
																		<input class="prompt srch_explore" type="text" name="facebook" id="id_facebook" maxlength="64" value="<%=userDAO.getFacebook(userID)%>" placeholder="Facebook Profile">																
																	</div>
																	<div class="help-block">당신의 Facebook 프로필 링크를  http://facebook.com/ 뒷자리를 입력하세요.</div>
																</div>
															</div>
															<div class="col-lg-12">
																<div class="ui search focus mt-30">
																	<div class="ui left icon labeled input swdh11 swdh31">
																		<div class="ui label lb12">
																			http://twitter.com/
																		</div>
																		<input class="prompt srch_explore" type="text" name="twitter" id="id_twitter" maxlength="64" value="<%=userDAO.getTwitter(userID)%>" placeholder="Twitter Profile">																
																	</div>
																	<div class="help-block">당신의 twitter 프로필 링크를  http://twitter.com/ 뒷자리를 입력하세요.</div>
																</div>
															</div>														
															<div class="col-lg-12">
																<div class="ui search focus mt-30">
																	<div class="ui left icon labeled input swdh11 swdh31">
																		<div class="ui label lb12">
																			http://www.github.com/
																		</div>
																		<input class="prompt srch_explore" type="text" name="github" id="id_linkedin" maxlength="64" value="<%=userDAO.getGithub(userID)%>"  placeholder="Github Profile">																
																	</div>
																	<div class="help-block">당신의 github 프로필 링크를  http://github.com/ 뒷자리를 입력하세요.</div>
																</div>
															</div>
															<div class="col-lg-12">
																<div class="ui search focus mt-30">
																	<div class="ui left icon labeled input swdh11 swdh31">
																		<div class="ui label lb12">
																			http://www.youtube.com/
																		</div>
																		<input class="prompt srch_explore" type="text" name="youtube" id="id_youtube" maxlength="64" value="<%=userDAO.getYoutube(userID)%>" placeholder="Youtube Profile">																
																	</div>
																	<div class="help-block">당신의 Youtube 프로필 링크를  http://youtube.com/ 뒷자리를 입력하세요.
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										</div>
										<button class="save_btn" type="submit">모든 변경사항 저장</button>
									</form>
								</div>
							</div>
							<div class="tab-pane fade" id="pills-notification" role="tabpanel" aria-labelledby="pills-notification-tab">
								<div class="account_setting" id="pills-notificationHTML">
									<h4>알림</h4>
									<p>원하지 않는 알림을 차단하세요.</p>
									<div class="basic_profile">										
										<div class="basic_form">
											<div class="nstting_content">
												<div class="basic_ptitle">
													<h4>웹 페이지 내 활동 알림</h4>
												</div>
												<div class="ui toggle checkbox _1457s2">
													<input type="checkbox" name="stream_ss1" id="NotiProfile" <%if(setDTO.isNotiFollowActive()) {%>checked<%}%>>
													<label>팔로우 활동</label>
													<p class="ml5">내가 추가한 팔로우가 게시물 수정,등록 등을 하였을때 수신될 알림입니다.</p>
												</div>
												<div class="ui toggle checkbox _1457s2">
													<input type="checkbox" name="stream_ss2" id="NotiReview" <%if(setDTO.isNotiWrittenReview()) {%>checked<%}%>>
													<label>상품 리뷰</label>
													<p class="ml5">새로운 리뷰가 도착헀을때 수신될 알림입니다.</p>
												</div>
												<div class="ui toggle checkbox _1457s2">
													<input type="checkbox" name="stream_ss3" id="NotiBuy" <%if(setDTO.isNotiWrittenBuy()) {%>checked<%}%>>
													<label>상품 구매</label>
													<p class="ml5">새로운 사용자가 내 상품중 하나를 구매했을때 수신될 알림입니다.</p>
												</div>
												<div class="ui toggle checkbox _1457s2">
													<input type="checkbox" name="stream_ss4" id="NotiGoods" <%if(setDTO.isNotiWrittenGoods()) {%>checked<%}%>>
													<label>상품 좋아요</label>
													<p class="ml5">상품 좋아요 수가 일정 이상을 달성 했을때 수신될 알림입니다.</p>
												</div>	
												<div class="ui toggle checkbox _1457s2">
													<input type="checkbox" name="stream_ss4" id="NotiComment" <%if(setDTO.isNotiComment()) {%>checked<%}%>>
													<label>댓글 기록</label>
													<p class="ml5">리뷰 , 타임라인 등의 댓글에서 다른 사용자가 내 댓글에 답글을 남길때 수신될 알림입니다.</p>
												</div>																							
											</div>
										</div>
									</div>
									<div class="divider-1 mb-50"></div>
									<div class="basic_profile">										
										<div class="basic_form">
											<div class="nstting_content">
												<div class="basic_ptitle">
													<h4>이메일 수신</h4>
													<p>이메일은 VencoderEM@gmail.com 으로부터 도착합니다. <a href="#">사기에 주의하세요</a> </p>
												</div>
												<div class="ui toggle checkbox _1457s2">
													<input type="checkbox" name="stream_ss5" id="NotiEmail" <%if(setDTO.isNotiEmail()) {%>checked<%}%>>
													<label>모든 이메일 광고 알림을 허용합니다.</label>
													<p class="ml5">이 항목에 체크할 시 이벤트 , 할인, 등의 이메일이 무작위로 수신됩니다.</p>
												</div>																																			
											</div>
										</div>
									</div>
									<button class="save_btn" type="submit" name="saveBtn">저장</button>
								</div>
							</div>
							<div class="tab-pane fade" id="pills-privacy" role="tabpanel" aria-labelledby="pills-privacy-tab">
								<div class="account_setting">
									<h4>공개</h4>
									<p>다른 사용자에게 표시될 정보를 제한하세요.</p>
										<div class="basic_profile">								
											<div class="basic_form">
												<div class="nstting_content">
													<div class="basic_ptitle">
														<h4>프로필 표시 설정</h4>
													</div>
													<div class="ui toggle checkbox _1457s2">
														<input type="checkbox" id="PublicProfile" name="emailOpen" <%if(setDTO.isPublicProfile()) {%>checked<%}%>>
														<label>프로필을 공개합니다.</label>
														<p class="ml5">내 프로필을 공개합니다.</p>
													</div>
													<div class="ui toggle checkbox _1457s2">
														<input type="checkbox" id="PublicEmail" name="emailOpen" <%if(setDTO.isPublicEmail()) {%>checked<%}%>>
														<label>이메일을 공개합니다.</label>
														<p class="ml5">프로필 , Top판매자 , 등의 페이지에서 다른 사용자에게 공개될 수 있습니다.</p>
													</div>
													<div class="ui toggle checkbox _1457s2">
														<input type="checkbox" id="PublicMessage" name="stream_ss9" <%if(setDTO.isPublicMessage()) {%>checked<%}%>>
														<label>메시지를 공개합니다.</label>
														<p class="ml5">이 항목이 체크되면, 누구든지 나에게 말을 걸 수 있습니다.</p>
													</div>																																
												</div>
											</div>
										</div>	
										<button class="save_btn" type="submit" name="saveBtn">저장</button>
								</div>
							</div>
							<div class="tab-pane fade" id="pills-bllingpayment" role="tabpanel" aria-labelledby="pills-bllingpayment-tab">
								<div class="account_setting">
									<h4>정기결제 설정</h4>
									<p>이 기능은 현재 개발중입니다. 대시보드 에서 결제 설정이 가능합니다.</p>
									<!--<div class="basic_form">
										<div class="row">
											<div class="col-lg-8">
												<div class="basic_ptitle mt-30">
													<h4>Billing Address</h4>
												</div>
												<div class="row">
													<div class="col-lg-6">
														<div class="ui search focus mt-30">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="name" value="Joginder" id="id[name1]" required="" maxlength="64" placeholder="First Name">															
															</div>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="ui search focus mt-30">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="surname" value="Singh" id="id[surname1]" required="" maxlength="64" placeholder="Last Name">															
															</div>
														</div>
													</div>
													<div class="col-lg-12">
														<div class="ui search focus mt-30">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="academyname" value="Gambolthemes" id="id_academy" required="" maxlength="64" placeholder="Academy Name">															
															</div>
															<div class="help-block">If you want your invoices addressed to a academy. Leave blank to use your full name.</div>
														</div>
													</div>
													<div class="col-lg-12">
														<div class="ui fluid search selection dropdown focus mt-30 cntry152">
															<input type="hidden" name="country" class="prompt srch_explore">
															<i class="dropdown icon"></i>
																<div class="default text">Select Country</div>
																<div class="menu">
																<div class="item" data-value="af"><i class="af flag"></i>서울</div>
															</div>
														</div>
													</div>
													<div class="col-lg-12">
														<div class="ui search focus mt-30">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="addressname" value="#1234, Sks Nagar, Near MBD Mall, 141001 Ludhiana, Punjab, India" id="id_address1" required="" maxlength="64" placeholder="Address Line 1">															
															</div>
														</div>
													</div>
													<div class="col-lg-12">
														<div class="ui search focus mt-30">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="addressname2" id="id_address2" required="" maxlength="64" placeholder="Address Line 2">															
															</div>
														</div>
													</div>
													<div class="col-lg-12">
														<div class="ui search focus mt-30">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="city" value="Ludhiana" id="id_city" required="" maxlength="64" placeholder="City">															
															</div>
														</div>
													</div>
													<div class="col-lg-12">
														<div class="ui search focus mt-30">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="state" value="Punjab" id="id_state" required="" maxlength="64" placeholder="State / Province / Region">															
															</div>
														</div>
													</div>
													<div class="col-lg-12">
														<div class="ui search focus mt-30">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="zip" value="141001" id="id_zip" required="" maxlength="64" placeholder="Zip / Postal Code">															
															</div>
														</div>
													</div>
													<div class="col-lg-12">
														<div class="ui search focus mt-30">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="phone" value="+911234567890" id="id_phone" required="" maxlength="12" placeholder="Phone Number">															
															</div>
														</div>
													</div>
												</div>	
											</div>	
										</div>	
									</div>
									<div class="divider-1 mb-50"></div>
									<div class="basic_form">
										<div class="row">
											<div class="col-lg-12">
												<div class="basic_ptitle">
													<h4>Exclusive Sales</h4>
													<p>Sell more of your exclusive products of this type (equal to the amount on the left) to get % cut from further exclusive sales.</p>
												</div>
												<div class="billing-percentages">
													<div class="billing-percentages-progress-bar">
														<ul class="billing-percentages-progress-bar__labels">
															<li>
																<div class="billing-percentages-progress-bar__label billing-percentages-progress-bar__label_zero-level">
																	<span class="billing-percentages-progress-bar__profit t5">
																		<strong class="format-currency ">$0</strong>
																	</span>
																	<span class="billing-percentages-progress-bar__percent t5">50%</span>
																</div>
															</li>
															<li>
																<div class="billing-percentages-progress-bar__label">
																	<span class="billing-percentages-progress-bar__profit t5">
																		<strong class="format-currency ">$2,000</strong>
																	</span>
																	<span class="billing-percentages-progress-bar__percent t5">53%</span>
																</div>
															</li>
															<li>
																<div class="billing-percentages-progress-bar__label">
																	<span class="billing-percentages-progress-bar__profit t5">
																		<strong class="format-currency ">$8,000</strong>
																	</span>
																	<span class="billing-percentages-progress-bar__percent t5">55%</span>
																</div>
															</li>
															<li>
																<div class="billing-percentages-progress-bar__label">
																	<span class="billing-percentages-progress-bar__profit t5">
																		<strong class="format-currency ">$18,000</strong>
																	</span>
																	<span class="billing-percentages-progress-bar__percent t5">58%</span>
																</div>
															</li>
															<li>
																<div class="billing-percentages-progress-bar__label">
																	<span class="billing-percentages-progress-bar__profit t5">
																		<strong class="format-currency ">$40,000</strong>
																	</span>
																	<span class="billing-percentages-progress-bar__percent t5">62%</span>
																</div>
															</li>
															<li>
																<div class="billing-percentages-progress-bar__label">
																	<span class="billing-percentages-progress-bar__profit t5">
																		<strong class="format-currency ">$75,000</strong>
																	</span>
																	<span class="billing-percentages-progress-bar__percent t5">70%</span>
																</div>
															</li>
															<li>
																<div class="billing-percentages-progress-bar__label">
																	<span class="billing-percentages-progress-bar__profit t5">
																		<strong class="format-currency ">$100,000</strong>
																	</span>
																	<span class="billing-percentages-progress-bar__percent t5">80%</span>
																</div>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="basic_form mt-50">
										<div class="row">
											<div class="col-lg-12">
												<div class="basic_ptitle">
													<h4>Non-Exclusive Sales</h4>
													<p>Sell more of your non-exclusive products of this type (equal to the amount on the left) to get 70% cut from every non-exclusive sales.</p>
												</div>
												<div class="billing-percentages">
													<div class="billing-percentages-progress-bar">
														<ul class="billing-percentages-progress-bar__labels">
															<li>
																<div class="billing-percentages-progress-bar__label billing-percentages-progress-bar__label_zero-level">
																	<span class="billing-percentages-progress-bar__profit t5">
																		<strong class="format-currency ">$0</strong>
																	</span>
																	<span class="billing-percentages-progress-bar__percent t5">30%</span>
																</div>
															</li>
															<li>
																<div class="billing-percentages-progress-bar__label">
																	<span class="billing-percentages-progress-bar__profit t5">
																		<strong class="format-currency ">$2,000</strong>
																	</span>
																	<span class="billing-percentages-progress-bar__percent t5">30%</span>
																</div>
															</li>
															<li>
																<div class="billing-percentages-progress-bar__label">
																	<span class="billing-percentages-progress-bar__profit t5">
																		<strong class="format-currency ">$8,000</strong>
																	</span>
																	<span class="billing-percentages-progress-bar__percent t5">30%</span>
																</div>
															</li>
															<li>
																<div class="billing-percentages-progress-bar__label">
																	<span class="billing-percentages-progress-bar__profit t5">
																		<strong class="format-currency ">$18,000</strong>
																	</span>
																	<span class="billing-percentages-progress-bar__percent t5">30%</span>
																</div>
															</li>
															<li>
																<div class="billing-percentages-progress-bar__label">
																	<span class="billing-percentages-progress-bar__profit t5">
																		<strong class="format-currency ">$40,000</strong>
																	</span>
																	<span class="billing-percentages-progress-bar__percent t5">30%</span>
																</div>
															</li>
															<li>
																<div class="billing-percentages-progress-bar__label">
																	<span class="billing-percentages-progress-bar__profit t5">
																		<strong class="format-currency ">$75,000</strong>
																	</span>
																	<span class="billing-percentages-progress-bar__percent t5">30%</span>
																</div>
															</li>
															<li>
																<div class="billing-percentages-progress-bar__label">
																	<span class="billing-percentages-progress-bar__profit t5">
																		<strong class="format-currency ">$100,000</strong>
																	</span>
																	<span class="billing-percentages-progress-bar__percent t5">30%</span>
																</div>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="divider-1 mb-50"></div>
									<div class="basic_form mt-50">
										<div class="row">
											<div class="col-lg-12">
												<div class="basic_ptitle">
													<h4>Withrawal Method</h4>													
												</div>												
												<div class="rpt100 mt-30">													
													<ul class="radio--group-inline-container_1">
														<li>
															<div class="radio-item_1">
																<input id="paypal1" value="payal" name="paymentmethod" type="radio" data-minimum="50.0">
																<label for="paypal1" class="radio-label_1">Paypal</label>
															</div>
														</li>
														<li>
															<div class="radio-item_1">
																<input id="payoneer1" value="payoneer" name="paymentmethod" type="radio" data-minimum="50.0">
																<label  for="payoneer1" class="radio-label_1">Payoneer</label>
															</div>
														</li>
														<li>
															<div class="radio-item_1">
																<input id="swift1" value="swift" name="paymentmethod" type="radio" data-minimum="500.0">
																<label  for="swift1" class="radio-label_1">Swift</label>
															</div>
														</li>
													</ul>
												</div>
												<div class="form-group return-departure-dts" data-method="payal">															
													<div class="row">
														<div class="col-lg-12">
															<div class="pymnt_title">
																<h4>Your PayPal Account</h4>
																<span>Minimum - $50.00</span>
																<p>Get paid by credit or debit card, PayPal transfer or even via bank account in just a few clicks. All you need is your email address or mobile number. <a href="#">More about PayPal</a> | <a href="#">Create an account</a></p>
															</div>
														</div>														
														<div class="col-lg-4 col-md-4">
															<div class="ui search focus mt-30">
																<div class="ui left icon input swdh11 swdh19">
																	<input class="prompt srch_explore" type="email" name="emailaddress" value="" id="id_email" required="" maxlength="64" placeholder="Email address">															
																</div>
															</div>
															<div class="ui search focus mt-20">
																<div class="ui left icon input swdh11 swdh19">
																	<input class="prompt srch_explore" type="email" name="cemailaddress" value="" id="id_emailc" required="" maxlength="64" placeholder="Confirm email address">															
																</div>
															</div>
															<button class="save_payout_btn" type="submit">Set Payout Account</button>
														</div>
													</div>
												</div>
												<div class="form-group return-departure-dts" data-method="payoneer">															
													<div class="row">
														<div class="col-lg-12">
															<div class="pymnt_title">
																<h4>Your Payoneer Account</h4>
																<span>Minimum - $50.00</span>
																<p>Payoneer Prepaid MasterCard® or Global Bank Transfer (Payoneer) offers an easy, convenient and cost effective way to get paid. <a href="#">More about Payoneer </a> | <a href="#">Payoneer FAQs</a></p>
															</div>
														</div>														
														<div class="col-lg-4 col-md-4">
															<div class="ui search focus mt-30">
																<div class="ui left icon input swdh11 swdh19">
																	<input class="prompt srch_explore" type="email" name="emailaddress1" value="" id="id_email1" required="" maxlength="64" placeholder="Email address">															
																</div>
															</div>
															<div class="ui search focus mt-20">
																<div class="ui left icon input swdh11 swdh19">
																	<input class="prompt srch_explore" type="email" name="cemailaddress1" value="" id="id_emailc1" required="" maxlength="64" placeholder="Confirm email address">															
																</div>
															</div>
															<button class="save_payout_btn" type="submit">Set Payout Account</button>
														</div>
													</div>
												</div>
												<div class="form-group return-departure-dts" data-method="swift">															
													<div class="row">
														<div class="col-lg-12">
															<div class="pymnt_title">
																<h4>Your SWIFT Account</h4>
																<span>Minimum - $500.00</span>
																<p>SWIFT (International Transfer) get paid directly into your bank account. Connected with over 9000 banking organisations, security institutions and customers in more than 200 countries <a href="#">More about SWIFT</a></p>
															</div>
														</div>														
														<div class="col-lg-4 col-md-4">
															<div class="ui search focus mt-30">
																<div class="ui left icon input swdh11 swdh19">
																	<input class="prompt srch_explore" type="text" name="fullname" value="" id="id_fullname" required="" maxlength="64" placeholder="Full Name">															
																</div>
															</div>
															<div class="ui search focus mt-15">
																<div class="ui left icon input swdh11 swdh19">
																	<input class="prompt srch_explore" type="text" name="uraddress" value="" id="id_address4" required="" maxlength="64" placeholder="Your Address">															
																</div>
															</div>
															<div class="ui fluid search selection dropdown focus mt-15 cntry152">
																<input type="hidden" name="country" class="prompt srch_explore">
																<i class="dropdown icon"></i>
																<div class="default text">Select Country</div>
																<div class="menu">
																	<div class="item" data-value="zw"><i class="zw flag"></i>서울</div>
																</div>
															</div>
															<div class="ui search focus mt-15">
																<div class="ui left icon input swdh11 swdh19">
																	<input class="prompt srch_explore" type="text" name="swiftcode" value="" id="id_swiftcode" required="" maxlength="64" placeholder="Swift-Code">															
																</div>
															</div>
															<div class="ui search focus mt-15">
																<div class="ui left icon input swdh11 swdh19">
																	<input class="prompt srch_explore" type="text" name="banknumber" value="" id="id_banknumber" required="" maxlength="64" placeholder="Back Account Number">															
																</div>
															</div>
															<div class="ui search focus mt-15">
																<div class="ui left icon input swdh11 swdh19">
																	<input class="prompt srch_explore" type="text" name="bankname" value="" id="id_bankname" required="" maxlength="64" placeholder="Back Name">															
																</div>
															</div>
															<div class="ui search focus mt-15">
																<div class="ui left icon input swdh11 swdh19">
																	<input class="prompt srch_explore" type="text" name="address5" value="" id="id_address5" required="" maxlength="64" placeholder="Back Address">															
																</div>
															</div>
															<button class="save_payout_btn" type="submit">Set Payout Account</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<button class="save_btn" type="submit">Save Changes</button>
								</div>-->
							</div>
							<div class="tab-pane fade" id="pills-api" role="tabpanel" aria-labelledby="pills-api-tab">								
								<div class="account_setting">
									<h4>제휴 API</h4>
									<p>CRUVE 제휴 API는 개발자가 CRUVE와의 통합 및 클라이언트 응용 프로그램을 구축 할 수 있도록 CRUVE의 기능을 제공합니다.
									<br>자세한 내용을 보려면 다음을 방문하세요.  <a href="#">CRUVE Affiliate API</a></p>
								</div>
								<button class="api_btn">Request Affiliate API Client</button>
								<div class="nt_apt"><i class="uil uil-info-circle"></i> API 기능은 아직 오픈되지 않았습니다.</div>								
							</div>
							<div class="tab-pane fade" id="pills-closeaccount" role="tabpanel" aria-labelledby="pills-closeaccount-tab">
								<div class="account_setting">
									<h4>계정 삭제</h4>
									<p><strong>주의:</strong> 계정을 삭제할시 손실된 데이터는 복구가 불가능합니다.</p>
								</div>
								<div class="row">
									<div class="col-lg-4">
										<form method="post" action="accountClose.jsp">
											<div class="ui search focus mt-30">
												<div class="ui left icon input swdh11 swdh19">
													<input class="prompt srch_explore" type="password" name="pw" id="id_yourpassword" required="" maxlength="64" placeholder="Enter Your Password">															
												</div>
												<div class="help-block">정말 계정을 삭제 하시겠습니까?</div>
											</div>
											<button class="save_payout_btn mbs20" type="submit">계정 삭제</button>
										</form>
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
												<span class="description">한국어</span>
												Korea
											</div>
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

	<script src="js/vertical-responsive-menu.min.js"></script>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/semantic/semantic.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/night-mode.js"></script>
	
	<script>
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
	const Toast = Swal.mixin({ 
		toast: true, position: 'bottom', 
		showConfirmButton: false, timer: 2500,
		timerProgressBar: true, 
		didOpen: (toast) => { toast.addEventListener('mouseenter', Swal.stopTimer) 
			toast.addEventListener('mouseleave', Swal.resumeTimer) } 
		})
		
	const editToast = Swal.mixin({ 
		toast: true, position: 'bottom-end', 
		timerProgressBar: false,
		confirmButtonText: '저장하기',
		preConfirm: () => {
			$('#NotiSave').trigger('click');
		}
		})
	</script>
	
	<script>
	$(function() {
		$(document).on('click','#emailCheck',function(e) {
			$.ajax({
	            type:'GET',
	            async:false,
	            url:'http://localhost:8080/CRUVE/emailCheck',
	            dataType:'text',
	            data:{},
	            success: function(data, textStatus) {
		        	if(data.indexOf('success')!=-1){
		        		Toast.fire({ icon: 'success',
		        		title: '성공적으로 인증 이메일을 발송했습니다!',text: '<%=userDAO.getUserEmail(userID)%>'});
		        	}
		            else {
		            	Toast.fire({ icon: 'error',
			        		title: data});
		            }
	            },
	            error:function (data, textStatus) {
	                
	            }
	        })
		})
	});
	</script>
	
	<script>
	$(function() {
		$(document).on('click','button[name=saveBtn]',function() {
			$.ajax({
				type:'POST',
	            async:false,
	            url:'http://localhost:8080/CRUVE/NotiSave',
	            dataType:'text',
	            data:{"NotiProfile":$('#NotiProfile').is(':checked'),"NotiReview":$('#NotiReview').is(':checked'),"NotiBuy":$('#NotiBuy').is(':checked')
	            	,"NotiGoods":$('#NotiGoods').is(':checked'),"NotiComment":$('#NotiComment').is(':checked'),"NotiEmail":$('#NotiEmail').is(':checked'),
	            	"PublicEmail":$('#PublicEmail').is(':checked'),"PublicProfile":$('#PublicProfile').is(':checked'),"PublicMessage":$('#PublicMessage').is(':checked')},
	            success: function(data, textStatus) {
	            	if(data.indexOf('success')!=-1) {
	            		Toast.fire({icon:'success',title:'모든 변경사항을 저장했습니다.'});
		            	//$('#pills-notification').load(location.href+' #pills-notificationHTML');
		        		editToast.close();
	            	} else {
	            		Toast.fire({ icon: 'error',title: data});
	            	}
	            	//console.log('성공');
	            },
	            error:function (data, textStatus) {
	            }
			})
		})
	})
	</script>
	
	<script>
	var isShow=false;
	$(function() {
		$('input[type=checkbox]').change(function() {
				editToast.fire({icon:'info',title:'수정 후에는 "저장하기"를 누르셔야 합니다. '});
		})
	})
	</script>
	
</body>
</html>
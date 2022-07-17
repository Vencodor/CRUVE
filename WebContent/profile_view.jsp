<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="commodity.CommodityDAO" %>
<%@ page import="commodity.CommodityDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="setting.SettingDAO" %>
<%@ page import="profileComment.*" %>
<%@ page import="follow.*" %>
<%@ page import="util.AES128" %>
<%@ page import="util.DateCount" %>

<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">
		<title>Cursus - My Instructor Profile View</title>
		
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
<%
	String userID=null;
	String frontID=null;

	String userName=null;
	String profileImage=null;
	
	int pages=12;

	UserDAO userDAO = new UserDAO();
	CommodityDAO commodityDAO = new CommodityDAO();
	SettingDAO setDAO = new SettingDAO();
	FollowDAO follow = new FollowDAO();
	AES128 aes = new AES128();
	DateCount date = new DateCount();
	CommentDAO commentDAO = new CommentDAO();
	CommentUnderDAO commentUnderDAO = new CommentUnderDAO();

	if(session.getAttribute("userID")!=null)
		userID=(String)session.getAttribute("userID");
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.');");
		script.println("history.back();");
		script.println("</script>");
		return;
	}
	
	if(request.getParameter("pagess")!=null)
		pages=Integer.parseInt(request.getParameter("pagess"));
	
	if(setDAO.getData(frontID)!=null) {
		if(setDAO.getData(frontID).isPublicProfile()==false) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('해당 유저의 프로필이 비공개 상태입니다.');");
			script.println("history.back();");
			script.println("</script>");
			return;
		}
	}
	
	if(request.getParameter("ID")!=null)
		frontID = userDAO.getUserIdFromName(request.getParameter("ID"));
	else {
		frontID = userID;
	}
	
	if(follow.isFollow(userID, frontID)) { //만약 대상을 팔로우 중이면
		boolean isNews = follow.getData(userID, frontID).isNews();
		if(isNews) { //만약 대상이 새로운 소식을 알렸다면
			follow.setNewsDisable(userID, frontID);
		}
	}
	
	userName = userDAO.getUserName(frontID);
	profileImage = userDAO.getProfileImage(frontID);
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
						<img src="./ProfileImages/<%=profileImage%>" alt="">
					</a>
					<div class="menu dropdown_account">
						<div class="channel_my">
							<div class="profile_link">
								<img src="./ProfileImages/<%=userDAO.getProfileImage(userID)%>" alt="">
								<div class="pd_content">
									<div class="rhte85">
										<h6><%=userName%></h6>
										<div class="mef78" title="Verify">
											<i class='uil uil-check-circle'></i>
										</div>
									</div>
									<span><%=userDAO.getUserEmail(userID)%></span>
								</div>							
							</div>
							<a href="profile_view.jsp" class="dp_link_12">View Instructor Profile</a>						
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
							</li>
							<li class="sub_menu--item">
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
						<a href="setting.jsp" class="menu--link" title="Setting">
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
	<div class="wrapper _bg4586">
		<div class="_216b01">
			<div class="container-fluid">			
				<div class="row justify-content-md-center">
					<div class="col-md-10">
						<div class="section3125 rpt145" id="userField">							
							<div class="row" id="userFieldHTML">						
								<div class="col-lg-7">
<%
	ArrayList<CommodityDTO> list = commodityDAO.getUserCommodityList(frontID, pages);
%>
									<a href="#" class="_216b22">										
										<span><i class="uil uil-cog"></i></span>Setting
									</a>
									<div class="dp_dt150">						
										<div class="img148">
											<img src="./ProfileImages/<%=profileImage%>" alt="">										
										</div>
										<div class="prfledt1">
											<h2><%=userName%></h2>
											<span><%=userDAO.getProfileShortContent(frontID)%></span>
										</div>										
									</div>
									<ul class="_ttl120">
										<li>
											<div class="_ttl121">
												<div class="_ttl122">팔로워</div>
												<div class="_ttl123"> </div>
											</div>
										</li>
										<li>
											<div class="_ttl121">
												<div class="_ttl122">상품</div>
												<div class="_ttl123"><%if(list!=null) {%><%=list.size()%><%}%></div>
											</div>
										</li>
										<li>
											<div class="_ttl121">
												<div class="_ttl122">작성한 리뷰</div>
												<div class="_ttl123">0</div>
											</div>
										</li>
										<li>
											<div class="_ttl121">
												<div class="_ttl122">가입일</div>
												<div class="_ttl123">452K</div>
											</div>
										</li>
									</ul>
									
								</div>
								<div class="col-lg-5">
<%if(userID.equals(frontID)) {%>	
									<a href="setting.jsp" class="_216b12">									
										<span><i class="uil uil-cog"></i></span>Setting
									</a>
<%}%>
									<div class="rgt-145">
										<ul class="tutor_social_links">
											<%if(userDAO.getFacebook(frontID)!=null)if(userDAO.getFacebook(frontID).length()>2) {%><li><a onclick="window.location.href='http://www.facebook.com/<%=userDAO.getFacebook(frontID)%>';" class="fb"><i class="fab fa-facebook-f"></i></a></li><%}%>
											<%if(userDAO.getTwitter(frontID)!=null)if(userDAO.getTwitter(frontID).length()>2) {%><li><a onclick="window.location.href='http://www.twitter.com/<%=userDAO.getTwitter(frontID)%>';" class="tw"><i class="fab fa-twitter"></i></a></li><%}%>
											<%if(userDAO.getGithub(frontID)!=null)if(userDAO.getGithub(frontID).length()>2) {%><li><a onclick="window.location.href='http://www.github.com/<%=userDAO.getGithub(frontID)%>';" class="ln"><i class="fab fa-github"></i></a></li><%}%>
											<%if(userDAO.getYoutube(frontID)!=null)if(userDAO.getYoutube(frontID).length()>2) {%><li><a onclick="window.location.href='http://www.youtube.com/<%=userDAO.getYoutube(frontID)%>';" class="yu"><i class="fab fa-youtube"></i></a></li><%}%>
										</ul>
									</div>
<%if(userID.equals(frontID)) {%>
									<ul class="_bty149">
										<li><button class="studio-link-btn btn500" onclick="window.location.href = 'dashboard.jsp';">대시보드</button></li>								
										<li><button class="msg125 btn500" onclick="window.location.href = 'setting.jsp';">Edit</button></li>							
									</ul>
<%} else {%>
									<ul class="_bty149">
										<li><button id="addChat" data-name="<%=userDAO.getUserName(frontID)%>" class="msg125 btn500">문자 보내기</button></li>
										<%if(follow.isFollow(userID, userDAO.getUserIdFromName(userDAO.getUserName(frontID)))) { %>
										<li><button id="followBtn" data-name="<%=userDAO.getUserName(frontID)%>" class="msg125 btn500">팔로우 취소</button></li>
										<%} else { %><li><button id="followBtn" data-name="<%=userDAO.getUserName(frontID)%>" class="subscribe-btn btn500">팔로우</button></li><%} %>									
									</ul>
<%}%>
								</div>													
							</div>							
						</div>							
					</div>															
				</div>
			</div>
		</div>
		<div class="_215b15">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">						
						<div class="course_tabs">
							<nav>
								<div class="nav nav-tabs tab_crse" id="nav-tab" role="tablist">
									<a class="nav-item nav-link active" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-selected="true">소개</a>
									<a class="nav-item nav-link" id="nav-courses-tab" data-toggle="tab" href="#nav-courses" role="tab" aria-selected="false">상품</a>
									<!--<a class="nav-item nav-link" id="nav-purchased-tab" data-toggle="tab" href="#nav-purchased" role="tab" aria-selected="false">구매 목록</a>-->
									<a class="nav-item nav-link" id="nav-reviews-tab" data-toggle="tab" href="#nav-reviews" role="tab" aria-selected="false">평가</a>
									<a class="nav-item nav-link" id="nav-subscriptions-tab" data-toggle="tab" href="#nav-subscriptions" role="tab" aria-selected="false">팔로잉</a>
								</div>
							</nav>						
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="_215b17">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="course_tab_content">
							<div class="tab-content" id="nav-tabContent">
								<div class="tab-pane fade show active" id="nav-about" role="tabpanel">
									<div class="_htg451">
										<div class="_htg452">
											<h3>소개</h3>
											<p><%=userDAO.getProfileContent(frontID)%></p>
										</div>																	
									</div>							
								</div>
								<div class="tab-pane fade" id="nav-courses" role="tabpanel">
									<div class="crse_content">
<%
%>
										<h3>게시한 상품 (<%if(list!=null) {%><%=list.size()%><%}%>)</h3>
										<div class="_14d25">
											<div class="row">
<%
	if(list!=null) {
		for(int i=0; i<list.size(); i++) {
			CommodityDTO a = list.get(i);
			String aesID = aes.encrypt(a.getWrittenID());
%>
												<div class="col-lg-3 col-md-4">
													<div class="fcrse_1 mt-30">
														<a href="detail_view.jsp?ID=<%=aesID%>" class="fcrse_img">
															<img src="<%="./CoverImage/"+a.getCoverImage()%>" style="height:210px;" onerror="this.src='./images/courses/add_img.jpg'">
															<div class="course-overlay">
																<span class="play_btn1"><i class="uil uil-play"></i></span>
																<%if(commodityDAO.getlikeCount(a.getWrittenID())!=0) {%>
																<div class="crse_timer">
																	<%=commodityDAO.getlikeCount(a.getWrittenID())%>
																</div>
																<%}%>
															</div>
														</a>
														<div class="fcrse_content">
															<div class="vdtodt">
																<span class="vdt14"><%=a.getBuyer()%> 구매</span>
																<span class="vdt14"><%=a.getLastDate()%></span>
															</div>
															<a href="detail_view.jsp?ID=<%=aesID%>" class="crse14s"><%=a.getTitle()%></a>
															<a href="" class="crse-cate"><%=a.getCategory()%> | <%=a.getSubcategory()%></a>
															<div class="auth1lnkprce">
																<p class="cr1fot">By <a href="profile_view.jsp?ID=<%=userDAO.getUserName(a.getUserID())%>"><%=userDAO.getUserName(a.getUserID())%></a></p>
																<div class="prce142"><%=a.getPrice()%>원</div>
															</div>
														</div>
													</div>	
												</div>
<%
		}
	}
%>
												
											</div>		
										</div>		
									</div>
								</div>
								<div class="tab-pane fade show" id="nav-purchased" role="tabpanel">
									<div class="_htg451">
										<div class="_htg452">
											<h3>Purchased Courses</h3>
											<div class="row">
												<div class="col-md-9">
													<div class="fcrse_1 mt-20">
														<a href="detail_view.jsp" class="hf_img">
															<img src="images/courses/img-1.jpg" alt="">
															<div class="course-overlay">
																<div class="badge_seller">Bestseller</div>
																<div class="crse_reviews">
																	<i class="uil uil-percentage"></i>4.5
																</div>
																<span class="play_btn1"><i class="uil uil-play"></i></span>
																<div class="crse_timer">
																	25 hours
																</div>
															</div>
														</a>
														<div class="hs_content">
															<div class="eps_dots eps_dots10 more_dropdown">
																<a href="#"><i class="uil uil-ellipsis-v"></i></a>
																<div class="dropdown-content">
																	<span><i class="uil uil-download-alt"></i>Download</span>															
																	<span><i class="uil uil-trash-alt"></i>Delete</span>															
																</div>																											
															</div>
															<div class="vdtodt">
																<span class="vdt14">109k views</span>
																<span class="vdt14">15 days ago</span>
															</div>
															<a href="detail_view.jsp" class="crse14s title900">Complete Python Bootcamp: Go from zero to hero in Python 3</a>
															<a href="#" class="crse-cate">Web Development | Python</a>
															<div class="purchased_badge">Purchased</div>
															<div class="auth1lnkprce">
																<p class="cr1fot">By <a href="#">John Doe</a></p>
																<div class="prce142">$10</div>
																<button class="shrt-cart-btn" title="cart"><i class="uil uil-shopping-cart-alt"></i></button>
															</div>
														</div>
													</div>
												</div>									
											</div>
										</div>																	
									</div>							
								</div>
								<div class="tab-pane fade" id="nav-reviews" role="tabpanel">
									<div class="student_reviews" id="Comments">
										<div class="row" id="CommentsHTML">
											<div class="col-lg-12">
												<div class="review_right">
													<div class="review_right_heading">
														<h3>평가</h3>
													</div>
												</div>
												<div class="cmmnt_1526">
													<div class="cmnt_group">
														<div class="img160">
															<img src="./ProfileImages/<%=userDAO.getProfileImage(userID)%>" alt="">									
														</div>
														<textarea id="comment" class="_cmnt001" placeholder="메시지를 입력하세요." maxlength="1024"></textarea>
													</div>
													<button id="commentBtn" class="cmnt-btn" type="submit">작성</button>
												</div>
												<div class="review_all120">
												<!-- DB가 두개 필요. 대댓글 DB와 댓글 DB가 필요하다. 댓글을 하나 불러올 때마다 그 댓글과 관련된 대댓글을 불러와서 표시한다. -->
												<!-- 다중 for문 -->
												<input type="hidden" value="0">
<%
ArrayList<CommentDTO> comments = new ArrayList<CommentDTO>();
comments = commentDAO.getList(frontID);

if(comments!=null) {
	for(CommentDTO a : comments) {
%>
													<div class="review_item">
														<div class="review_usr_dt">
															<img src="./ProfileImages/<%=userDAO.getProfileImage(a.getUserID())%>" alt="">
															<div class="rv1458">
																<h4 class="tutor_name1"><%=userDAO.getUserName(a.getUserID())%></h4>
																<span class="time_145"><%=date.date(a.getDate())%></span>
															</div>
															<div class="eps_dots more_dropdown">
																<a href="#"><i class="uil uil-ellipsis-v"></i></a>
																<div class="dropdown-content">
																	<span name="commentDelete" data-type="main" data-ID="<%=a.getCommentID()%>"><i class='uil uil-trash-alt'></i>삭제</span>
																</div>																	
															</div>
														</div>
														<p class="rvds10"><%=a.getComment()%></p>
														<div class="rpt101">
															<div class="report155" name="likeAct" data-ID="<%=a.getCommentID()%>" data-boolean="good">
															<span data-ID="<%=a.getCommentID()%>"><i class='uil uil-thumbs-up'"></i> <%=a.getGood()%></span></div>
															
															<div class="report155" name="likeAct" data-ID="<%=a.getCommentID()%>" data-boolean="bad">
															<span><i class='uil uil-thumbs-down'></i> <%=a.getBad()%></span></div>
															<div name="reComment" data-TO="<%=a.getCommentID()%>" class="report155 ml-3">답장</div>
														</div>
													</div>
													
<%
ArrayList<CommentUnderDTO> reComments = new ArrayList<CommentUnderDTO>();
reComments = commentUnderDAO.getList(a.getCommentID());
if(reComments!=null) {
	for(CommentUnderDTO r : reComments) {
%>
													<div class="review_reply">
														<div class="review_item">
															<div class="review_usr_dt">
																<img src="./ProfileImages/<%=userDAO.getProfileImage(r.getUserID())%>" alt="">
																<div class="rv1458">
																	<h4 class="tutor_name1"><%=userDAO.getUserName(r.getUserID())%></h4>
																	<span class="time_145"><%=date.date(r.getDate())%></span>
																</div>
																<div class="eps_dots more_dropdown">
																	<a href="#"><i class="uil uil-ellipsis-v"></i></a>
																	<div class="dropdown-content">
																		<span name="commentUnderDelete" data-type="sub" data-ID="<%=r.getCommentID()%>"><i class='uil uil-trash-alt'></i>삭제</span>
																	</div>																											
																</div>
															</div>
															<p class="rvds10"><%=r.getComment()%></p>
														</div>
													</div>
<%
			}
		}

	}
}
%>
													
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade show" id="nav-subscriptions" role="tabpanel">
									<div class="_htg451">
										<div class="_htg452">
											<h3>팔로잉</h3>
											<div class="row">
												
												<div class="col-lg-3 col-md-4">
													<div class="fcrse_1 mt-30">
														<div class="tutor_img">
															<a href="#"><img src="images/left-imgs/img-1.jpg" alt=""></a>												
														</div>
														<div class="tutor_content_dt">
															<div class="tutor150">
																<a href="#" class="tutor_name">John Doe</a>
																<div class="mef78" title="Verify">
																	<i class="uil uil-check-circle"></i>
																</div>
															</div>
															<div class="tutor_cate">Wordpress &amp; Plugin Tutor</div>
															<ul class="tutor_social_links">
																<li><button class="sbbc145">Subscribed</button></li>
																<li><button class="sbbc146"><i class="uil uil-bell"></i></button></li>
															</ul>
															<div class="tut1250">
																<span class="vdt15">100K Students</span>
																<span class="vdt15">15 Courses</span>
															</div>
														</div>
													</div>										
												</div>
												
												<div class="col-lg-3 col-md-4">
													<div class="fcrse_1 mt-30">
														<div class="tutor_img">
															<a href="#"><img src="images/left-imgs/img-2.jpg" alt=""></a>											
														</div>
														<div class="tutor_content_dt">
															<div class="tutor150">
																<a href="#" class="tutor_name">Kerstin Cable</a>
																<div class="mef78" title="Verify">
																	<i class="uil uil-check-circle"></i>
																</div>
															</div>
															<div class="tutor_cate">Language Learning Coach, Writer, Online Tutor</div>
															<ul class="tutor_social_links">
																<li><button class="sbbc145">Subscribed</button></li>
																<li><button class="sbbc146"><i class="uil uil-bell"></i></button></li>
															</ul>
															<div class="tut1250">
																<span class="vdt15">14K Students</span>
																<span class="vdt15">11 Courses</span>
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
												한국어
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
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

	<script src="js/vertical-responsive-menu.min.js"></script>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/semantic/semantic.min.js"></script>
	<script src="js/custom.js"></script>	
	<script src="js/night-mode.js"></script>
	
	<script>
	const Toast = Swal.mixin({ 
		toast: true, position: 'bottom', 
		showConfirmButton: false, timer: 2600,
		timerProgressBar: true, 
		didOpen: (toast) => { toast.addEventListener('mouseenter', Swal.stopTimer) 
			toast.addEventListener('mouseleave', Swal.resumeTimer) } 
		})
	</script>
	
	<script>
	$(function() {
		$(document).on('click','#addChat',function(e) {
			thisElement = $(this);
			$.ajax({
	            type:'POST',
	            async:false,
	            url:'http://localhost:8080/CRUVE/aesEn',
	            dataType:'text',
	            data:{'name':$(this).attr('data-name')},
	            success: function(data, textStatus) {
	            	location.href="messages.jsp";
	            },
	            error:function (data, textStatus) {
	                console.log('Err'+data);
	            }
	        })    //ajax
		})
	})
	
	$(function() {
		$(document).on('click','#followBtn',function(e) {
			thisElement = $(this);
			$.ajax({
	            type:'GET',
	            async:false,
	            url:'http://localhost:8080/CRUVE/setFollow',
	            dataType:'text',
	            data:{'ID':$(this).attr('data-name')},
	            success: function(data, textStatus) {
	            	$('#userField').load(location.href+' #userFieldHTML');
	            },
	            error:function (data, textStatus) {
	                console.log('Err'+data);
	            }
	        })    //ajax
		})
	})
	
	$(function() {
		$(document).on('click','div[name=reComment]',function(e) {
			$('#selRecomment').remove();
	        $(this).parent().parent().append('<div class="row" id="selRecomment"><div class="col-12"><div class="cmmnt_1526"><div class="cmnt_group"><div class="img160">'+
	        		'<img src="./ProfileImages/<%=userDAO.getProfileImage(userID)%>" alt=""></div>'+
	        		'<textarea id="reComment" class="_cmnt001" placeholder="답글 내용을 입력하세요." maxlength="1024"></textarea></div><button data-TO="'+$(this).attr('data-TO')+'" id="reCommentBtn" class="cmnt-btn" type="submit">답장'+
	        		'</button></div></div></div>');
		})
	})
	
	$(function() {
		$(document).on('click','#commentBtn',function(e) {
			
			$.ajax({
	            type:'POST',
	            async:false,
	            url:'http://localhost:8080/CRUVE/profileComment',
	            dataType:'text',
	            data:{'toID':'<%=userName%>','comment':$('#comment').val()},
	            success: function(data, textStatus) {
	            	$('#comment').val('');
	            	Toast.fire({ icon: 'success', 
	            		title: '성공적으로 댓글을 달았습니다.',
	            		timer:2000
	            		})
	            	$('#Comments').load(location.href+'&pagess=0 #CommentsHTML');
	            },
	            error:function (data, textStatus) {
	                console.log('Err'+data);
	            }
	        })    //ajax
	        
		})
	})
	
	$(function() {
		$(document).on('click','#reCommentBtn',function(e) {
			
			$.ajax({
	            type:'POST',
	            async:false,
	            url:'http://localhost:8080/CRUVE/profileCommentUnder',
	            dataType:'text',
	            data:{'toCommentID':$(this).attr('data-TO'),'comment':$('#reComment').val()},
	            success: function(data, textStatus) {
	            	$('#reComment').val('');
	            	Toast.fire({ icon: 'success', 
	            		title: '성공적으로 대댓글을 달았습니다.',
	            		timer:2000
	            		})
	            	$('#Comments').load(location.href+'&pagess=0 #CommentsHTML');
	            },
	            error:function (data, textStatus) {
	                console.log('Err'+data);
	            }
	        })    //ajax
	        
		})
	})
	
	$(function() {
		$(document).on('click','div[name=likeAct]',function(e) {
			var thisBtn = $(this);
			$.ajax({
	            type:'GET',
	            async:false,
	            url:'http://localhost:8080/CRUVE/goodAct',
	            dataType:'text',
	            data:{'commentID':$(this).attr('data-ID'),'isGood':$(this).attr('data-boolean')},
	            success: function(data, textStatus) {
	           		if(data.indexOf("good")!=-1) {
	           			thisBtn.css( "color", "red" );
	           		} else {
	           			thisBtn.css( "color", "black" );
	           		}
	            },
	            error:function (data, textStatus) {
	                console.log('Err'+data);
	            }
	        })    //ajax
	        
		})
	})
	
	$(function() {
		$(document).on('click','span[name=commentDelete]',function(e) {
			$.ajax({
				type:'GET',
				async:false,
				url:'http://localhost:8080/CRUVE/deleteProfileComment',
				dataType:'text',
				data:{'commentID':$(this).attr('data-ID')},
				success: function(data , textStatus) {
					if(data.indexOf("success")!=-1) {
						Toast.fire({ icon: 'success', 
		            		title: '성공적으로 해당 댓글을 삭제했습니다.',
		            		timer:2000
		            		})
		            	$('#Comments').load(location.href+'&pagess=0 #CommentsHTML');
					} else {
						Toast.fire({ icon: 'error', 
		            		title: data,
		            		timer:2000
		            		})
					}
				},
	            error:function (data, textStatus) {
	                console.log('Err'+data);
	            }
			}) //ajax
		})
	})
	
	$(function() {
		$(document).on('click','span[name=commentUnderDelete]',function(e) {
			$.ajax({
				type:'GET',
				async:false,
				url:'http://localhost:8080/CRUVE/deleteProfileCommentUnder',
				dataType:'text',
				data:{'commentID':$(this).attr('data-ID')},
				success: function(data , textStatus) {
					if(data.indexOf("success")!=-1) {
						Toast.fire({ icon: 'success', 
		            		title: '성공적으로 해당 댓글을 삭제했습니다.',
		            		timer:2000
		            		})
		            	$('#Comments').load(location.href+'&pagess=0 #CommentsHTML');
					} else {
						Toast.fire({ icon: 'error', 
		            		title: data,
		            		timer:2000
		            		})
					}
				},
	            error:function (data, textStatus) {
	                console.log('Err'+data);
	            }
			}) //ajax
		})
	})
	</script>
	
</body>
</html>
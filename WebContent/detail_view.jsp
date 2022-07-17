<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="commodity.CommodityDAO" %>
<%@ page import="commodity.CommodityDTO" %>
<%@ page import="review.ReviewDAO" %>
<%@ page import="review.ReviewDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.*"%>
<%@ page import="edit.EditListDAO" %>
<%@ page import="edit.EditListDTO" %>
<%@ page import="util.DateCount" %>
<%@ page import="util.AES128" %>
<%@ page import="java.net.URLDecoder" %>

<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>

	<head>
		<meta charset="utf-8">		
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">
		<title>Curve - Course Detail View</title>
		
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
	request.setCharacterEncoding("UTF-8");
	DecimalFormat format = new DecimalFormat("0.0");

	int writtenID=0;
	int reviewPage=5;
	
	int acPage=10;

	String userID=null;
	String search="";
	String aesWrittenID=null;
	
	AES128 aes = new AES128();

	if(request.getParameter("ID")!=null) {
		try{
			aesWrittenID = request.getParameter("ID");} catch(Exception e){e.printStackTrace();}
		writtenID = Integer.parseInt(aes.decrypt(aesWrittenID));
	}
	
	if(request.getParameter("search")!=null) {
		search=request.getParameter("search");
		search = URLDecoder.decode(search, "UTF-8");
	}
	
	if(request.getParameter("page")!=null)
		reviewPage=Integer.parseInt(request.getParameter("page"));
	
	if(request.getParameter("acPage")!=null)
		acPage=Integer.parseInt(request.getParameter("acPage"));
	
	if(session.getAttribute("userID")!=null)
		userID=(String)session.getAttribute("userID");
	
	CommodityDAO commodityDAO = new CommodityDAO();
	UserDAO userDAO = new UserDAO();
	ReviewDAO reviewDAO = new ReviewDAO();
	EditListDAO editDAO = new EditListDAO();
	DateCount date = new DateCount();
	
	String userName=userDAO.getUserName(userID);
	String userImage=userDAO.getProfileImage(userID);
	
	CommodityDTO commodity = commodityDAO.getWritten(writtenID);
%>
	<!-- Video Model Start -->
	<div class="modal vd_mdl fade" id="videoModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-header">
			</div>
			<div class="modal-content">
				
				<div class="modal-body row">
				
					<img class="col-sm-12" src="<%=".\\CoverImage\\"+commodity.getCoverImage()%>" onerror="this.src='./images/courses/add_img.jpg'">
				</div>
				
			</div>
		</div>
	</div>
	<!-- Video Model End -->
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
						<a href="#" class="item channel_item">Minecraft</a>
						<a href="#" class="item channel_item">Plugin</a>
						<a href="#" class="item channel_item">Script</a>
						<a href="#" class="item channel_item">Map</a>
						<a href="#" class="item channel_item">기타</a>
					</div>
				</div>
			</div>
		</div>
		<div class="search120">
			<div class="ui search">
			  <div class="ui left icon input swdh10">
				<input class="prompt" type="text" placeholder="Search for commodity..">
				<i class='uil uil-search-alt icon icon1'></i>
			  </div>
			</div>
		</div>
		<div class="header_right">
			<ul>
				<li>
					<a href="create_new_course.jsp" class="upload_btn" title="Create New Course">상품 등록</a>
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
						<img src="./ProfileImages/<%=userImage%>" alt="">
					</a>
					<div class="menu dropdown_account">
						<div class="channel_my">
							<div class="profile_link">
<%
if(userID!=null) {
%>
								<img src="./ProfileImages/<%=userImage%>" alt="">
								<div class="pd_content">
									<div class="rhte85">
										<h6><%=userName%></h6>
										<div class="mef78" title="Verify">
											<i class='uil uil-check-circle'></i>
										</div>
									</div>
									<span><%=userDAO.getUserEmail(userID)%></span>
								</div>
<%
} else {
%>								<img src="" alt="">
								<div class="pd_content">
									<div class="rhte85">
										<h5>로그인이 필요합니다.</h6>
									</div>
								</div>
<%
}
%>
							</div>
<%
if(userID!=null) {
%>
							<a href="profile_view.jsp" class="dp_link_12">프로필 설정</a>			
<%
}
%>			
						</div>
						<div class="night_mode_switch__btn">
							<a href="#" id="night-mode" class="btn-night-mode">
								<i class="uil uil-moon"></i> Night mode
								<span class="btn-night-mode-switch">
									<span class="uk-switch-button"></span>
								</span>
							</a>
						</div>				
						<a href="membership.jsp" class="item channel_item">프리미엄</a>
						<a href="setting.jsp" class="item channel_item">사이트 설정</a>
						<a href="help.jsp" class="item channel_item">질문</a>
<%if(userID!=null) {%>
						<a href="dashboard.jsp" class="item channel_item">대시보드</a>		
						<a href="feedback.jsp" class="item channel_item">피드백 전송</a>
						<a href="sign_in.jsp" class="item channel_item">로그아웃</a>
<%}%>
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
						<a href="index.jsp" class="menu--link active" title="Home">
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
		<div class="_215b01">
			<div class="container-fluid">			
				<div class="row">
					<div class="col-lg-12">
						<div class="section3125">							
							<div class="row justify-content-center">						
								<div class="col-xl-4 col-lg-5 col-md-6">						
									<div class="preview_video">						
										<a href="#" class="fcrse_img" data-toggle="modal" data-target="#videoModal">
											<img src="<%=".\\CoverImage\\"+commodity.getCoverImage()%>" style="height:330px;" onerror="this.src='./images/courses/add_img.jpg'">
											<div class="course-overlay">
												<%if(commodity.getLikeCount()>10) {%><div class="badge_seller">Top Rated</div><%}%>
												<span class="play_btn1"><i class="uil uil-play"></i></span>
												<span class="_215b02">사진 자세히 보기</span>
											</div>
										</a>
									</div>
									<div class="_215b10">										
										<div class="_215b11">
										</div>
										<div class="_215b12">										
											<div class="reportBtn"  id="reportBtn" style="cursor: pointer;">										
												<span><i class="uil uil-windsock"></i></span>신고
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-8 col-lg-7 col-md-6">
									<div class="_215b03">
										<h2><%=commodity.getTitle()%></h2>
										<span class="_215b04"><%=commodity.getSubtitle()%></span>
									</div>
									<div class="_215b05">
										<%if(commodity.getSaleAmount()>0) { %><div class="crse_reviews mr-2">
											<i class="uil uil-percentage"></i><%=commodity.getSaleAmount()%>%
										</div><%} %>
									</div>
									<div class="_215b05">										
										마지막 업데이트 <%=date.date(commodity.getLastDate())%>
									</div>
									<ul class="_215b31">										
										<li><button class="btn_adcart" id="addCart">장바구니 추가</button></li>
										<li><a href="checkout_course.jsp?ID=<%=aesWrittenID%>"><button class="btn_buy">구매</button></a></li>
									</ul>
									<div class="_215fgt1">						
										환불 불가능
									</div>
								</div>							
							</div>							
						</div>							
					</div>															
				</div>
			</div>
		</div>
		<div class="_215b15 _byt1458">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="user_dt5">
							<div class="user_dt_left">
								<div class="live_user_dt">
									<div class="user_img5">
										<a href="profile_view.jsp?ID=<%=userDAO.getUserName(commodity.getUserID())%>"><img src="<%="./ProfileImages/"+userDAO.getProfileImage(commodity.getUserID())%>" alt=""></a>												
									</div>
									<div class="user_cntnt">
										<a href="profile_view.jsp?ID=<%=userDAO.getUserName(commodity.getUserID())%>" class="_df7852"><%=userDAO.getUserName(commodity.getUserID())%></a>
										<button id="addChat" data-name="<%=userDAO.getUserName(commodity.getUserID())%>" class="subscribe-btn">문자 보내기</button>
									</div>
								</div>
							</div>
							<div class="user_dt_right">
								<ul id="like">
									<li id="likeHTML">
										<span class="likeBtn"><button class="lkcm152"></span>
										<i class="uil uil-thumbs-up" style="<%if(commodityDAO.likeCheck(userID, writtenID)){%>color:blue<%}%>"></i>
										<div id="likeTxt"><%=commodityDAO.getlikeCount(writtenID)%></div></button>
									</li>
								</ul>
							</div>
						</div>
						<div class="course_tabs">
							<nav>
								<div class="nav nav-tabs tab_crse justify-content-center" id="nav-tab" role="tablist">
									<a class="nav-item nav-link active" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-selected="true">소개</a>
									<a class="nav-item nav-link" id="nav-courses-tab" data-toggle="tab" href="#nav-courses" role="tab" aria-selected="false">수정 내역</a>
									<a class="nav-item nav-link " id="nav-reviews-tab" data-toggle="tab" href="#nav-reviews" role="tab" aria-selected="false">리뷰</a>
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
										<%=commodity.getDescription()%>
									</div>							
								</div>
								<div class="tab-pane fade" id="nav-courses" role="tabpanel">
									<div class="crse_content">
										<h3>수정 내역</h3>
										<div class="_112456">
											<ul class="accordion-expand-holder">
												<li><span class="accordion-expand-all _d1452">Expand all</span></li>
												<li><span class="_fgr123"></span></li>
												<li><span class="_fgr123"></span></li>
											</ul>
										</div>
										<div id="accordion" class="ui-accordion ui-widget ui-helper-reset">
											<div id="accordionHTML">
<%
	ArrayList<EditListDTO> editList = new ArrayList<EditListDTO>();
	editList = editDAO.getList(writtenID,acPage);
	int EditlistSize=0;
	for(EditListDTO a : editList) {
		int i=0;
		EditlistSize++;
		if(!a.getTitle().split(" -> ",2)[0].equals(a.getTitle().split(" -> ",2)[1])){i++;}
		if(!a.getSubtitle().split(" -> ",2)[0].equals(a.getSubtitle().split(" -> ",2)[1])){ i++;}
		if(!a.getDescription().split(" -> ",2)[0].equals(a.getDescription().split(" -> ",2)[1])){ i++;}
		if(!a.getCategory().split(" -> ",2)[0].equals(a.getCategory().split(" -> ",2)[1])){ i++;}
		if(!a.getSubcategory().split(" -> ",2)[0].equals(a.getSubcategory().split(" -> ",2)[1])){ i++;}
%>											
											<a href="javascript:void(0)" class="accordion-header ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-corner-all">												
												<div class="section-header-left">
													<span class="section-title-wrapper">
														<i class='uil uil-presentation-play crse_icon'></i>
														<span class="section-title-text"><%=a.getEditTitle()%></span>
													</span>
												</div>
												<div class="section-header-right">
													<span class="num-items-in-section"><%=i%>개 수정</span>
													<span class="section-header-length"><%=date.date(a.getEditDate())%></span>
												</div>
											</a>
											<div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom">
												<%if(!a.getTitle().split(" -> ",2)[0].equals(a.getTitle().split(" -> ",2)[1])){ i++;%>
												<div class="lecture-container">
													<div class="left-content">
														<i class='uil uil-file icon_142'></i>
														<div class="top">
															<div class="title"><%=a.getTitle()%></div>
														</div>
													</div>
													<div class="details">
														<span class="content-summary">제목</span>
													</div>
												</div>
												<%}%>
												
												<%if(!a.getSubtitle().split(" -> ",2)[0].equals(a.getSubtitle().split(" -> ",2)[1])){ i++;%>
												<div class="lecture-container">
													<div class="left-content">
														<i class='uil uil-file icon_142'></i>
														<div class="top">
															<div class="title"><%=a.getSubtitle()%></div>
														</div>
													</div>
													<div class="details">
														<span class="content-summary">부제목</span>
													</div>
												</div>
												<%}%>
												
												<%if(!a.getDescription().split(" -> ",2)[0].equals(a.getDescription().split(" -> ",2)[1])){ i++;%>
												<div class="lecture-container">
													<div class="left-content">
														<i class='uil uil-file-alt icon_142'></i>
														<div class="top">
															<div class="title"><%=a.getDescription()%></div>
														</div>
													</div>
													<div class="details">
														<span class="content-summary">설명</span>
													</div>
												</div>
												<%}%>
												
												<%if(!a.getCategory().split(" -> ",2)[0].equals(a.getCategory().split(" -> ",2)[1])){ i++;%>
												<div class="lecture-container">
													<div class="left-content">
														<i class='uil uil-list-ui-alt icon_142'></i>
														<div class="top">
															<div class="title"><%=a.getCategory()%></div>
														</div>
													</div>
													<div class="details">
														<span class="content-summary">카테고리</span>
													</div>
												</div>
												<%}%>
												
												<%if(!a.getSubcategory().split(" -> ",2)[0].equals(a.getSubcategory().split(" -> ",2)[1])){ i++;%>
												<div class="lecture-container">
													<div class="left-content">
														<i class='uil uil-list-ui-alt icon_142'></i>
														<div class="top">
															<div class="title"><%=a.getSubcategory()%></div>
														</div>
													</div>
													<div class="details">
														<span class="content-summary">세부 카테고리</span>
													</div>
												</div>
												<%}%>
											</div>
<%
	}
%>
											</div>											
										</div>
										<%if(acPage==EditlistSize) {%><button id="10More" class="btn1458">10개 더보기</button><%} %>
									</div>
								</div>
								<div class="tab-pane fade" id="nav-reviews" role="tabpanel">
									<div class="student_reviews" id="nav-reviewsHTML">
											<div class="cmmnt_1526">
												<div class="cmnt_group">
													<div class="img160">
														<img src="./ProfileImages/<%=userDAO.getProfileImage(userID)%>" alt="">									
													</div>
													<textarea class="_cmnt001" style="height:100px" name="description" id="review-content" placeholder="2048자 이내의 리뷰를 작성하세요." required></textarea>
												</div>
												<div class="row">
													<div class="col-sm-10">
														<div class="rating-box" style="margin-top:27px; margin-left:7%;">
															<div class="rate" id="1"><div class="rating-star full-star"></div></div>
															<div class="rate" id="2"><div class="rating-star full-star"></div></div>
															<div class="rate" id="3"><div class="rating-star full-star"></div></div>
															<div class="rate" id="4"><div class="rating-star full-star"></div></div>
															<div class="rate" id="5"><div class="rating-star full-star"></div></div>
														</div>
													</div>
													<input type="hidden" value="<%=writtenID%>" name="writtenID" required>
													<input type="hidden" value="10" name="rate" id="review-rate" required>
													<div class="col-sm-2">
														<button class="cmnt-btn" id="reviewBtn" type="submit">작성</button>
													</div>
												</div>
											</div>
											
										<div class="row">
											<div class="col-lg-5">
<%
	ArrayList<ReviewDTO> totalList = reviewDAO.getList(search,100,writtenID);
	ArrayList<ReviewDTO> list = reviewDAO.getList(search,reviewPage,writtenID);
	
	double totalRate=0;
	int rateCount=0;
	double endRate=0;
	
	int rate5=0,rate4=0,rate3=0,rate2=0,rate1=0;
	
	if(totalList!=null) {
		for(ReviewDTO review : totalList) {
			totalRate=totalRate+(review.getRate()/2.0);
			rateCount++;
			switch(review.getRate()/2) {
			case 1:
				rate1++;
				break;
			case 2:
				rate2++;
				break;
			case 3:
				rate3++;
				break;
			case 4:
				rate4++;
				break;
			case 5:
				rate5++;
				break;
			}
		}
	}
	endRate = totalRate/(double)rateCount;
	if(totalList.size()>=1) {
%>
												<div class="reviews_left">
													<h3>평점</h3>
													<div class="total_rating">
														<div class="_rate001"><%=format.format(endRate)%></div>												
														<div class="rating-box">
<%
			while(endRate>0) {
				if(endRate==0.5) {%><span class="rating-star half-star"></span><%}
				else {%><span class="rating-star full-star"></span><%}
				endRate=endRate-1;
			}
%>
														</div>
														<div class="_rate002">평균 점수</div>	
													</div>
													<div class="_rate003">
														<div class="_rate004">
															<div class="progress progress1">
																<div class="progress-bar" style="color:red; width:<%=220*(rate5/(double)rateCount)%>px" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
															</div>
															<div class="rating-box">
																<span class="rating-star full-star"></span>
																<span class="rating-star full-star"></span>
																<span class="rating-star full-star"></span>
																<span class="rating-star full-star"></span>
																<span class="rating-star full-star"></span>
															</div>
															<div class="_rate002"><%=format.format(rate5/(double)rateCount*100)%>%</div>
														</div>
														<div class="_rate004">
															<div class="progress progress1">
																<div class="progress-bar" style="color:red; width:<%=220*(rate4/(double)rateCount)%>px" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
															</div>
															<div class="rating-box">
																<span class="rating-star full-star"></span>
																<span class="rating-star full-star"></span>
																<span class="rating-star full-star"></span>
																<span class="rating-star full-star"></span>
																<span class="rating-star empty-star"></span>
															</div>
															<div class="_rate002"><%=format.format(rate4/(double)rateCount*100)%>%</div>
														</div>
														<div class="_rate004">
															<div class="progress progress1">
																<div class="progress-bar" style="color:red; width:<%=220*(rate3/(double)rateCount)%>px" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
															</div>
															<div class="rating-box">
																<span class="rating-star full-star"></span>
																<span class="rating-star full-star"></span>
																<span class="rating-star full-star"></span>
																<span class="rating-star empty-star"></span>
																<span class="rating-star empty-star"></span>
															</div>
															<div class="_rate002"><%=format.format(rate3/(double)rateCount*100)%>%</div>
														</div>
														<div class="_rate004">
															<div class="progress progress1">
																<div class="progress-bar" style="color:red; width:<%=220*(rate2/(double)rateCount)%>px" role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100"></div>
															</div>
															<div class="rating-box">
																<span class="rating-star full-star"></span>
																<span class="rating-star full-star"></span>
																<span class="rating-star empty-star"></span>
																<span class="rating-star empty-star"></span>
																<span class="rating-star empty-star"></span>
															</div>
															<div class="_rate002"><%=format.format(rate2/(double)rateCount*100)%>%</div>
														</div>
														<div class="_rate004">
															<div class="progress progress1">
																<div class="progress-bar" style="color:red; width:<%=220*(rate1/(double)rateCount)%>px" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
															</div>
															<div class="rating-box">
																<span class="rating-star full-star"></span>
																<span class="rating-star empty-star"></span>
																<span class="rating-star empty-star"></span>
																<span class="rating-star empty-star"></span>
																<span class="rating-star empty-star"></span>
															</div>
															<div class="_rate002"><%=format.format(rate1/(double)rateCount*100)%>%</div>
														</div>
													</div>
												</div>
<%
	} else {
%>

<%
	}
%>										
											</div>
											<div class="col-lg-7">
												<input id="writtenID" name="" type="hidden" value="<%=writtenID%>">
												<div class="review_right">
													<div class="review_right_heading">
														<h3>Reviews (<%=rateCount%>)</h3>
														<div class="review_search">
															<input class="rv_srch" type="text" name="search" id="reviewSearch" placeholder="Search reviews..." value="<%=search%>">
															<button class="rvsrch_btn" id="reviewSearchBtn" type="submit"><i class='uil uil-search'></i></button>
														</div>
													</div>
												</div>
												<div class="review_all120" id="myReview">
<%
	if(list!=null) {
		for(ReviewDTO review : list) {
			double rate = review.getRate()/2.0;
%>
													<div class="review_item">
														<div class="review_usr_dt">
															<a href="profile_view.jsp?userName=<%=userDAO.getUserName(review.getUserID())%>"><img src="./ProfileImages/<%=userDAO.getProfileImage(review.getUserID())%>" alt=""></a>
															<div class="rv1458">
																<a href="profile_view.jsp?userName=<%=userDAO.getUserName(review.getUserID())%>"><h4 class="tutor_name1"><%=userDAO.getUserName(review.getUserID())%></h4></a>
																<span class="time_145"><%=date.date(review.getLastDate())%></span>
															</div>
														</div>
														<div class="rating-box mt-20">
<%
			while(rate>0) {
				if(rate==0.5) {%><span class="rating-star half-star"></span><%}
				else {%><span class="rating-star full-star"></span><%}
				rate=rate-1;
			}
%>
														</div>
														<p class="rvds10"><%=review.getDescription()%></p>
														<div class="rpt100">
															<span>이 리뷰가 유용하셨나요?</span>
															<div class="radio--group-inline-container">
																<div class="radio-item">
																	<input id="radio-1" name="radio" type="radio">
																	<label for="radio-1" class="radio-label">Yes</label>
																</div>
																<div class="radio-item">
																	<input id="radio-2" name="radio" type="radio">
																	<label  for="radio-2" class="radio-label">No</label>
																</div>
															</div>
															<div class="reportBtn" id="<%=review.getReviewID()%>" style="cursor: pointer;" class="report145">신고</div>
														</div>
													</div>
<%
		}
	}
	if(rateCount>=reviewPage) {
%>
													<div class="review_item">
														<a id="more" class="more_reviews">더 보기</a>
													</div>
<%
	}
%>
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
		showConfirmButton: false, timer: 2500,
		timerProgressBar: true, 
		didOpen: (toast) => { toast.addEventListener('mouseenter', Swal.stopTimer) 
			toast.addEventListener('mouseleave', Swal.resumeTimer) } 
		})
	
		$(function() {
			var likeCount = Number(<%=commodityDAO.getlikeCount(writtenID)%>);
			var likeTxt = document.getElementById('likeTxt');
			$(document).on('click','.likeBtn', function(e){
		        $.ajax({
		            type:'GET',
		            async:false, //false가 기본값임 - 비동기
		            url:'http://localhost:8080/CRUVE/likeAct',
		            dataType:'text',
		            data:{ID:'<%=aesWrittenID%>'},
		            success: function(data, textStatus) {
		                if(data.indexOf("add")!=-1) {  

		            		Toast.fire({ icon: 'success', 
		            		title: '글 "<%=commodityDAO.getTitle(writtenID)%>" 에 추천을 누르셨습니다.' })
		            		$('#like').load(location.href + " #likeHTML");
		                } else if(data.indexOf("remove")!=-1) {
		                	
		                	Toast.fire({ icon: 'error', 
			            		title: '글 "<%=commodityDAO.getTitle(writtenID)%>" 추천을 취소했습니다.' })
			            		$('#like').load(location.href + " #likeHTML");
		                } else {
		                	console.log('예외 '+data+" "+textStatus);
		                }
		            },
		            error:function (data, textStatus) {
		                console.log('error');
		            }
		        })    //ajax
		
		    })
		})
	</script>
	
	<script>
	$(function() {
		var signBtn = document.getElementById('addCart');
		$(document).on('click','#addCart', function(e){
	        $.ajax({
	            type:'GET',
	            async:false, //false가 기본값임 - 비동기
	            url:'http://localhost:8080/CRUVE/addCart',
	            dataType:'text',
	            data:{'ID':'<%=aesWrittenID%>'},
	            success: function(data, textStatus) {
		        	//카트추가 완료 alert 액션 넣기
		        	Toast.fire({ icon: 'success', 
		            		title: '글 "<%=commodityDAO.getTitle(writtenID)%>" 을 장바구니에 담으셨습니다.' })
	            },
	            error:function (data, textStatus) {
	                console.log('cartErr'+data);
	            }
	        })    //ajax
	
	    })
	})
	</script>
	
		
	<script>
	$(function () {
		const report = Swal.mixin({
			  customClass: {
			    confirmButton: 'save_btn'
			  },
			  buttonsStyling: false
		})
		
		var reportBtn = document.getElementsByClassName('reportBtn');
		$(document).on('click','.reportBtn',function(e){
			//console.log($(e.target).attr('id')+'')
			report.fire({
				title: '신고 사유를 입력하세요.',
				html: '<div class="ui search focus mt-15"><div class="ui left icon input swdh95"><i class="uil uil-comment-alt-edit icon icon2"></i><input id="reportDescription" class="prompt"></div></div><br><span style="color: grey; font-size:13px">거짓 신고가 발각될 경우 처벌을 받을 수 있습니다.</span>',
				focusConfirm: false,
				  preConfirm: (description) => {
					  var reviewID;
					  if($(e.target).attr('id')!=null) {
						 reviewID = $(e.target).attr('id');
					  } else {
						 reviewID = 0;
					  }
					  $.ajax({
							type:'POST',
				            async:false, //false가 기본값임 - 비동기
				            url:'http://localhost:8080/CRUVE/report',
				            dataType:'text',
				            data:{'writtenID':'<%=aesWrittenID%>','reviewID':reviewID,'description':$("#reportDescription").val()},
				            success: function(data, textStatus) {
				            	if(data.indexOf("success")!=-1) {
						        	Toast.fire({ icon: 'success', 
						            	title: '정상적으로 신고 처리되었습니다.',
							            text: '신고는 "신고 목록" 에서 확인 가능합니다.',
							            timer: 6000
						            	})
				            	} else {
				            		Toast.fire({ icon: 'error', 
					            		title: data })
				            	}
				            },
				            error:function (data, textStatus) {
				                console.log('review'+data);
				            }
						})
				  },
				  allowOutsideClick: () => !Swal.isLoading()
				})
		})
	})
	</script>
	
	<script>
	$(function () {
		var reviewBtn = document.getElementById('reviewBtn');
		$(document).on('click','#reviewBtn',function(e){
			$.ajax({
				type:'POST',
	            async:false, //false가 기본값임 - 비동기
	            url:'http://localhost:8080/CRUVE/addReview',
	            dataType:'text',
	            data:{"writtenID":"<%=aesWrittenID%>","description":$('#review-content').val(),"rate":$('#review-rate').val()},
	            success: function(data, textStatus) {
	            	if(data.indexOf("success")!=-1) {
			        	Toast.fire({ icon: 'success', 
			            	title: '리뷰를 글 "<%=commodityDAO.getTitle(writtenID)%>" 에 등록하셨습니다.',
				            text: '리뷰 악용은 처벌받으실 수 있습니다.',
				            timer: 5200
			            	})
			            $('#review-content').val('');
			        	$('#nav-reviews').load(window.location.href + " #nav-reviewsHTML");
	            	} else {
	            		Toast.fire({ icon: 'error', 
		            		title: data })
	            	}
	            },
	            error:function (data, textStatus) {
	                console.log('review'+data);
	            }
			})
		})
	})
	</script>
	
	<script>
		var rates = new Array()
		rates = document.getElementsByClassName("rate");
		$(document).ready(function () 
		{
		    $(document).on('mousemove','.rate',function(e){
		        empty();
		        for(var i=0; i<Number($(this).attr('id')); i++) {
		        	rates[i].firstChild.className = "rating-star full-star";
		        }
		        
		        var x = e.pageX - $(this).offset().left;
		        if( x < $(this).width() / 2 ) {
		        	//왼쪽
		        	rates[Number($(this).attr('id'))-1].firstChild.className = "rating-star half-star";
		        	document.getElementById("review-rate").value = Number($(this).attr('id'))*2-1;
		        }
		        else {
		        	document.getElementById("review-rate").value = Number($(this).attr('id'))*2;
		        }
		    });
		});
		
		function empty() {
			for(var i=0; i<rates.length; i++) {
				rates[i].firstChild.className = "rating-star empty-star";
			}
		}
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
	</script>
	
	<script>
	$(function() {
		var page = 10;
		$(document).on('click','#10More',function() {
			page = page + 10;
			$('#accordion').load(location.href+'?acPage='+page+' #accordionHTML');
		})
	})
	
	$(function() {
		$(document).on('click','#reviewSearchBtn',function() {
			$('#nav-reviews').load(location.href+"&search="+encodeURI($('#reviewSearch').val())+" #nav-reviewsHTML");
		})
	})
	$(function() {
		$(document).on('click','#more',function() {
			$('#nav-reviews').load(location.href+"&search="+encodeURI($('#reviewSearch').val())+"&page=<%=reviewPage+10%> #nav-reviewsHTML");
		})
	})
	</script>
	
</body>
</html>
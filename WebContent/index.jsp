<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="commodity.*" %>
<%@ page import="chat.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="util.AES256_1" %>
<%@ page import="util.AES128" %>
<%@ page import="noti.*" %>
<%@ page import="util.DateCount" %>
<%@ page import="setting.*" %>
<%@ page import="follow.*" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>

<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">		
		<title>CRUVE | 온라인 창작물 거래중개 사이트</title>
		
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
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	</head>


<body style="">
<%
	System.out.println(request.getServletContext().getRealPath("CommodityFile"));

	UserDAO userDAO = new UserDAO();
	CommodityDAO commodityDAO = new CommodityDAO();
	AES256_1 AES = new AES256_1();
	AES128 AES128 = new AES128();
	ChatDataDAO chatDAO = new ChatDataDAO();
	NotiDAO notiDAO = new NotiDAO();
	DateCount date = new DateCount();
	SettingDAO setting = new SettingDAO();
	FollowDAO follow = new FollowDAO();
	
	boolean firstLogin=false;

	if(session.getAttribute("userID")==null) {
		Cookie[] login = request.getCookies();
		if(login !=null){
		    for(Cookie tempCookie : login){
		        if(tempCookie.getName().equals("userID")){ //쿠키값으로 로그인 처리
			    	System.out.println("쿠키 로그인 | "+ AES.decrypt( tempCookie.getValue()));
		            session.setAttribute("userID", AES.decrypt( tempCookie.getValue()) );
		            firstLogin=true;
		        }
		    }
		}
	}

	String userID = null;

	String userName = null;
	String userImage = null;
	int cartCount = 0;
	
	String filePath = ".//CommodityFile//";
	String profilePath = "//ProfileImages//";

	if(session.getAttribute("userID")!=null)
		userID = (String) session.getAttribute("userID");
	
	try {
		ArrayList cartList = (ArrayList)session.getAttribute("cart");
		cartCount = cartList.size();
	} catch(Exception e) {}

	UserDTO userInfo = new UserDTO();
	if(userID!=null) {
	userInfo = userDAO.getUser(userID);
	//setting.upsert(new SettingDTO(userID,true,false,false,false,false,false,false,false,false)); # 테스트용으로 쓴거
	}
	userName = userInfo.getUserName();
	userImage = userInfo.getProfileImage();
	
%>
<% //세션 오류처리
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
						<a href="sign_in.jsp" class="item channel_item">로그인</a>
						<a href="sign_up.jsp" class="item channel_item">회원가입</a>
						<a href="profile_view.jsp" class="item channel_item">내 프로필</a>
						<a href="setting.jsp" class="item channel_item">환경설정</a>
						<a href="dashboard.jsp" class="item channel_item">대시보드</a>
					</div>
				</div>
			</div>
		</div>
		<div class="search120">
			<div class="ui search">
			  <div class="ui left icon input swdh10">
				<input class="prompt srch10" type="text" id="searchMenu" placeholder="웹 검색..">
				<i class='uil uil-search-alt icon icon1'></i>
			  </div>
			</div>
		</div>
		<div class="header_right">
			<ul>
				<li>
					<a href="create_new_course.jsp" class="upload_btn" title="Create New Course">제품 등록</a>
				</li>
				<li>
					<a href="shopping_cart.jsp" class="option_links"><i class='uil uil-shopping-cart-alt'></i><%if(cartCount!=0) {%><span class="noti_count"><%=cartCount%></span><%}%></a>
				</li>
<%
ArrayList<ChatDataDTO> mChat = new ArrayList<ChatDataDTO>();
mChat = chatDAO.menuGetList(userID);
int chatSize = mChat.size();
%>
				<li class="ui dropdown">
					<a href="#" class="option_links" title="Messages"><i class='uil uil-envelope-alt'></i>
					<%if(chatSize!=0){%><span class="noti_count"><%if(chatSize<=3) {%><%=chatSize%><%}else{%>3+<%}%></span><%}%>
					</a>
					<div class="menu dropdown_ms">
<%
if(mChat!=null)
for(ChatDataDTO a : mChat) {
%>
						<a href="#" class="channel_my item">
							<div class="profile_link">
								<img src="./ProfileImages/<%=userDAO.getProfileImage(a.getUserID())%>" alt="">
								<div class="pd_content">
									<h6><%=userDAO.getUserName(a.getUserID())%></h6>
									<p><%=a.getMessage()%>.</p>
									<span class="nm_time"><%=date.date(a.getLastDate())%></span>
								</div>							
							</div>							
						</a>
<%
}
%>
						<a class="vbm_btn" href="messages.jsp">더 보기 <i class='uil uil-arrow-right'></i></a>
					</div>
				</li>
<%
ArrayList<NotiDTO> notiList = new ArrayList<NotiDTO>();
notiList = notiDAO.menuGetList(userID);
int notiSize = notiList.size();
%>
				<li class="ui dropdown">
					<a href="#" class="option_links" title="Notifications"><i class='uil uil-bell'></i><%if(notiSize>0) {%><span class="noti_count"><%if(notiSize<=3) {%><%=notiSize%><%}else {%>3+<%}%></span><%}%></a>
					<div class="menu dropdown_mn">
<%
if(notiList!=null)
for(NotiDTO a : notiList) {
	String notiUserName = userDAO.getUserName(a.getUserID());
	String[] typeFilter = a.getType().split("/",2); 
	int writtenID=0;
	try {writtenID = Integer.parseInt(typeFilter[1]);} catch(Exception e) {e.printStackTrace();}
%>
						<a href="detail_view.jsp?ID=<%=writtenID%>" class="channel_my item">
							<div class="profile_link">
								<img src="./ProfileImages/<%=userDAO.getProfileImage(a.getUserID())%>" alt="">
								<div class="pd_content">
									<h6><%=notiUserName%></h6>
									<p><%=notiUserName%> <%=a.getContent()%></p>
									<span class="nm_time"><%=date.date(a.getDate())%></span>
								</div>							
							</div>							
						</a>
<% 
}
%>
						<!--
						<div class="channel_my item all__noti5">
								<div class="profile_link">
									<img src="images/left-imgs/img-9.jpg" alt="">
									<div class="pd_content">
										<p class="noti__text5"> Your Course Approved Now. <a href="#" class="crse_bl">How to create sidebar menu</a>.</p>
										<span class="nm_time">20 min ago</span>
									</div>							
								</div>							
							</div>
							-->
						<a class="vbm_btn" href="notifications.jsp">더 보기 <i class='uil uil-arrow-right'></i></a>
					</div>
				</li>
				<li class="ui dropdown">
					<a href="#" class="opts_account" title="Account">
						<%if(userID!=null){%><img src="./ProfileImages/<%=userImage%>" alt=""> <%}%>
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
											<%if("partner".equals(userInfo.getUserRank())) {%><div class="mef79" title="파트너"><i class="uil uil-check-circle"></i></div><%} %>
											<%if("premium".equals(userInfo.getUserRank())) {%><div class="mef78" title="프리미엄"><i class="uil uil-check-circle"></i></div><%} %>
										</div>
									</div>
									<span><%=userInfo.getUserEmail()%></span>
								</div>
<%
} else {
%>								
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
								<i class="uil uil-moon"></i> 야간 모드
								<span class="btn-night-mode-switch">
									<span class="uk-switch-button"></span>
								</span>
							</a>
						</div>				
						<a href="membership.jsp" class="item channel_item">프리미엄</a>
						<a href="setting.jsp" class="item channel_item">환경설정</a>
<%if(userID!=null) {%>
						<a href="dashboard.jsp" class="item channel_item">대시보드</a>
						<a href="sign_in.jsp?Logout=true" class="item channel_item">로그아웃</a>
<%}%>
					</div>
				</li>
			</ul>
		</div>
	</header>
	<!-- Header End -->
	<!-- Left Sidebar Start -->
	<nav class="vertical_nav" id="navbar">
		<div class="left_section menu_left" id="js-menu" >
			<div class="left_section">
				<ul>
					<li class="menu--item">
						<a href="index.jsp" class="menu--link active" title="Home">
							<i class='uil uil-home-alt menu--icon'></i>
							<span class="menu--label">홈</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="explore.jsp" class="menu--link" title="Explore">
							<i class='uil uil-search menu--icon'></i>
							<span class="menu--label">검색</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="saved_courses.jsp" class="menu--link" title="Saved Courses">
						  <i class="uil uil-heart-alt menu--icon"></i>
						  <span class="menu--label">저장된 게시물</span>
						</a>
					</li>
					<li class="menu--item  menu--item__has_sub_menu">
						<label class="menu--link" title="Pages">
						  <i class='uil uil-file menu--icon'></i>
						  <span class="menu--label">페이지</span>
						</label>
						<ul class="sub_menu">
							<li class="sub_menu--item">
								<a href="about_us.jsp" class="sub_menu--link">정보</a>
							</li>
							<li class="sub_menu--item">
								<a href="sign_in.jsp" class="sub_menu--link">로그인</a>
							</li>
							<li class="sub_menu--item">
								<a href="sign_up.jsp" class="sub_menu--link">회원가입</a>
							</li>
							<li class="sub_menu--item">
								<a href="sign_up_steps.jsp" class="sub_menu--link">특수 회원가입</a>
							</li>
							<li class="sub_menu--item">
								<a href="membership.jsp" class="sub_menu--link">프리미엄</a>
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
				<h6 class="left_title">팔로우</h6>
				<ul>
<%
ArrayList<FollowDTO> followList = new ArrayList<FollowDTO>();
followList = follow.getList(userID);
if(followList!=null) {
	for(FollowDTO a : followList) {
%>
					<li class="menu--item">
						<a href="profile_view.jsp?ID=<%=userDAO.getUserName(a.getToID())%>" class="menu--link user_img">
							<img src="./ProfileImages/<%=userDAO.getProfileImage(a.getToID())%>" alt="">
							<%=userDAO.getUserName(a.getToID())%>
							<%if(a.isNews()) {%><div class="alrt_dot"></div><%} %>
						</a>
					</li>
<%
	}
}
%>
					<li class="menu--item">
						<a href="all_instructor.jsp" class="menu--link" title="Browse Instructors">
						  <i class='uil uil-plus-circle menu--icon'></i>
						  <span class="menu--label">다른 사용자 등록</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="left_section pt-2">
				<ul>
					<li class="menu--item">
						<a href="setting.jsp" class="menu--link" title="Setting">
							<i class='uil uil-cog menu--icon'></i>
							<span class="menu--label">환경설정</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="help.jsp" class="menu--link" title="Help">
							<i class='uil uil-question-circle menu--icon'></i>
							<span class="menu--label">도움</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="report_history.jsp" class="menu--link" title="Report History">
							<i class='uil uil-windsock menu--icon'></i>
							<span class="menu--label">신고 기록</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="left_footer">
				<ul>
					<li><a href="about_us.jsp">About</a></li>
					<li><a href="press.jsp">Press</a></li>
					<li><a href="contact_us.jsp">사이트 정보</a></li>
					<li><a href="terms_of_use.jsp">정책</a></li>
					<li><a href="terms_of_use.jsp">저작권 정책</a></li>
					<li><a href="terms_of_use.jsp">개인정보 정책</a></li>
				</ul>
				<div class="left_footer_content">
					<p>© 2020 <strong>CRUVE</strong>. All Rights Reserved.</p>
				</div>
			</div>
		</div>
	</nav>
	<!-- Left Sidebar End -->
	<!-- Body Start -->
	<div class="wrapper" id="bodyHTML">
		<div class="sa4d25">
			<div class="container-fluid">			
				<div class="row">
					<div class="col-xl-9 col-lg-8">
						<div class="section3125">
							<h4 class="item_title">추천 제품</h4>
							<a href="explore.jsp?&sort=좋아요순" class="see150">더 보기</a>
							<div class="la5lo1">
								<div class="owl-carousel featured_courses owl-theme">
<%
	ArrayList<CommodityDTO> RatedCommodity = new ArrayList<CommodityDTO>();
	RatedCommodity = commodityDAO.getList("좋아요순","",6);

	for(CommodityDTO a : RatedCommodity) {
		String writtenID = AES128.encrypt(a.getWrittenID());
%>
									<div class="item">
										<div class="fcrse_1 mb-20">
											<a href="detail_view.jsp?ID=<%=writtenID%>" class="fcrse_img">
												<img src="<%=".\\CoverImage\\"+a.getCoverImage()%>" onerror="this.src='./images/courses/add_img.jpg'" style="height:210px;">
												<div class="course-overlay">
													<%if(a.getLikeCount()>10) {%><div class="badge_seller">Top Rated</div><%}%>
													<%if(a.getSaleAmount()>0&&a.isSaleActive()) {%><div class="crse_reviews">
														<i class='uil uil-percentage'></i><%=a.getSaleAmount()%>% 할인
													</div><%}%>
													<span class="play_btn1"><i class="uil uil-info-circle"></i></span>
												</div>
											</a>
											<div class="fcrse_content">
												<div class="eps_dots more_dropdown">
													<a href="#"><i class='uil uil-ellipsis-v'></i></a>
													<div class="dropdown-content">
														<span data-name="<%=writtenID%>" class="saveBtn"><i class="uil uil-heart"></i>저장</span>
														<span data-name="<%=writtenID%>" class="reportBtn"><i class="uil uil-windsock"></i>신고</span>
													 </div>																											
												</div>
												<div class="vdtodt">
													<span class="vdt14"><%=a.getLikeCount()%> 추천</span>
													<span class="vdt14"><%=date.date(a.getLastDate())%></span>
												</div>
												<a href="detail_view.jsp?ID=<%=writtenID%>" class="crse14s"><%=a.getTitle()%></a>
												<a href="" class="crse-cate"><%=a.getCategory()%> | <%=a.getSubcategory()%></a>
												<div class="auth1lnkprce">
													<p class="cr1fot">By <a href="profile_view.jsp?ID=<%=userDAO.getUserName(a.getUserID())%>"><%=userDAO.getUserName(a.getUserID())%></a></p>
													<div class="prce142"><%=a.getPrice()%>원</div>
													<button id="<%=writtenID%>" name="addCart" class="shrt-cart-btn" title="cart"><i class="uil uil-shopping-cart-alt"></i></button>
												</div>
											</div>
										</div>
									</div>
<%
	}
%>
								</div>
							</div>
						</div>
						<div class="section3125 mt-30">
							<h4 class="item_title">최신 제품</h4>
							<a href="explore.jsp?&sort=최신순" class="see150">더 보기</a>
							<div class="la5lo1">
								<div class="owl-carousel featured_courses owl-theme">
<%
	ArrayList<CommodityDTO> NewCommodity = new ArrayList<CommodityDTO>();
	NewCommodity = commodityDAO.getList("최신순","",6);

	for(CommodityDTO a : NewCommodity) {
		String writtenID = AES128.encrypt(a.getWrittenID());
%>
									<div class="item">
										<div class="fcrse_1 mb-20">
											<a href="detail_view.jsp?ID=<%=writtenID%>" class="fcrse_img">
												<img src="<%=".\\CoverImage\\"+a.getCoverImage()%>" onerror="this.src='./images/courses/add_img.jpg'" style="height:210px;">
												<div class="course-overlay">
													<%if(a.getLikeCount()>10) {%><div class="badge_seller">Top Rated</div><%}%>
													<%if(a.getSaleAmount()>0&&a.isSaleActive()) {%><div class="crse_reviews">
														<i class='uil uil-percentage'></i><%=a.getSaleAmount()%>% 할인
													</div><%}%>
													<span class="play_btn1"><i class="uil uil-info-circle"></i></span>
												</div>
											</a>
											<div class="fcrse_content">
												<div class="eps_dots more_dropdown">
													<a href="#"><i class='uil uil-ellipsis-v'></i></a>
													<div class="dropdown-content">
														<span data-name="<%=writtenID%>" class="saveBtn"><i class="uil uil-heart"></i>저장</span>
														<span data-name="<%=writtenID%>" class="reportBtn"><i class="uil uil-windsock"></i>신고</span>
													 </div>																											
												</div>
												<div class="vdtodt">
													<span class="vdt14"><%=a.getLikeCount()%> 추천</span>
													<span class="vdt14"><%=date.date(a.getLastDate())%></span>
												</div>
												<a href="detail_view.jsp?ID=<%=writtenID%>" class="crse14s"><%=a.getTitle()%></a>
												<a href="" class="crse-cate"><%=a.getCategory()%> | <%=a.getSubcategory()%></a>
												<div class="auth1lnkprce">
													<p class="cr1fot">By <a href="profile_view.jsp?ID=<%=userDAO.getUserName(a.getUserID())%>"><%=userDAO.getUserName(a.getUserID())%></a></p>
													<div class="prce142"><%=a.getPrice()%>원</div>
													<button id="<%=writtenID%>" name="addCart" class="shrt-cart-btn" title="cart"><i class="uil uil-shopping-cart-alt"></i></button>
												</div>
											</div>
										</div>
									</div>
<%
	}
%>
								</div>
							</div>
						</div>
						<div class="section3126">
							<div class="row">
								<div class="col-xl-6 col-lg-12 col-md-6">
									<div class="value_props">
										<div class="value_icon">
											<i class='uil uil-user-check'></i>
										</div>
										<div class="value_content">
											<h4>거래 안전성</h4>
											<p>월말 정산으로 판매자에게 수익을 지급하므로 사기에 대처 가능합니다.</p>
										</div>
									</div>
								</div>
								<div class="col-xl-6 col-lg-12 col-md-6">
									<div class="value_props">
										<div class="value_icon">
											<i class='uil uil-info-circle'></i>
										</div>
										<div class="value_content">
											<h4>상세한 정보 & 빠른 검색</h4>
											<p>제움에 대해 상세하게 작성 가능하고, 원하는 제품을 빠르게 찾을 수 있습니다.</p>
										</div>
									</div>
								</div>
								<div class="col-xl-6 col-lg-12 col-md-6">
									<div class="value_props">
										<div class="value_icon">
											<i class='uil uil-history'></i>
										</div>
										<div class="value_content">
											<h4>간편한 거래</h4>
											<p>프로그램의 구매/판매가 매우 수월합니다.</p>
										</div>
									</div>
								</div>
								<div class="col-xl-6 col-lg-12 col-md-6">
									<div class="value_props">
										<div class="value_icon">
											<i class='uil uil-presentation-play'></i>
										</div>
										<div class="value_content">
											<h4>간편한 관리 & 정교한 분석 시스템</h4>
											<p>월별 판매량 , 소식 등을 대시보드에서 전달합니다.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="section3125 mt-50">
							<h4 class="item_title">베스트 팔로워</h4>
							<a href="all_instructor.jsp" class="see150">더 보기</a>
							<div class="la5lo1">
								<div class="owl-carousel top_instrutors owl-theme">
<%
ArrayList<FollowObj> users = new ArrayList<FollowObj>();
users = userDAO.userList(10,"");
if(users !=null) {
	
	Collections.sort(users, new Comparator<FollowObj>() {
        public int compare(FollowObj o1, FollowObj o2) {
            if(o1.getFollower()>o2.getFollower()) {
                return -1;
            }else if(o1.getFollower()<o2.getFollower()) {
                return 1;
            }else {
                return 0;
            }
        }
    });
	
	for(FollowObj a : users) {
	UserDTO user = userDAO.getUser(a.getUserID());
%>
									<div class="item">
										<div class="fcrse_1 mb-20">
											<div class="tutor_img">
												<a href="profile_view.jsp?ID=<%=user.getUserName()%>"><img src="./ProfileImages/<%=user.getProfileImage()%>" loading="lazy" alt=""></a>												
											</div>
											<div class="tutor_content_dt">
												<div class="tutor150">
													<a href="profile_view.jsp?ID=<%=user.getUserName()%>" class="tutor_name"><%=user.getUserName()%></a>
													<%if("partner".equals(user.getUserRank())) {%><div class="mef79" title="파트너"><i class="uil uil-check-circle"></i></div><%} %>
													<%if("premium".equals(user.getUserRank())) {%><div class="mef78" title="프리미엄"><i class="uil uil-check-circle"></i></div><%} %>
												</div>
												<div class="tutor_cate"><%=user.getProfileShortContent()%>&nbsp;</div>
												<ul class="tutor_social_links">
												<%if(user.getFacebook()!=null)if(user.getFacebook().length()>2) {%>
													<li><a href="#" onclick="window.location.href='http://www.facebook.com/<%=user.getFacebook()%>'; return false;" class="fb"><i class="fab fa-facebook-f"></i></a></li>
												<%} else {%><li><a onclick="return false;" class="fb"><i class="fas fa-times"></i></a></li><%}%>
												<%if(user.getTwitter()!=null)if(user.getTwitter().length()>2) {%>
													<li><a href="#" onclick="window.location.href='http://www.twitter.com/<%=user.getTwitter()%>'; return false;" class="tw"><i class="fab fa-twitter"></i></a></li>
												<%} else {%><li><a onclick="return false;';" class="tw"><i class="fas fa-times"></i></a></li><%} %>
												<%if(user.getGit()!=null)if(user.getGit().length()>2) {%>
													<li><a href="#" onclick="window.location.href='http://www.github.com/<%=user.getGit()%>'; return false;" class="ln"><i class="fab fa-github"></i></a></li>
												<%} else {%><li><a onclick="return false;" class="ln"><i class="fas fa-times"></i></a></li><%} %>
												<%if(user.getYoutube()!=null)if(user.getYoutube().length()>2) {%>
													<li><a href="#" onclick="window.location.href='http://www.youtube.com/<%=user.getYoutube()%>'; return false;" class="yu"><i class="fab fa-youtube"></i></a></li>
												<%} else {%><li><a onclick="return false;" class="yu"><i class="fas fa-times"></i></a></li><%} %>
											</ul>
												<div class="tut1250">
													<span class="vdt15"><%=a.getFollower()%></span>
													<span class="vdt15">팔로우</span>
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
					<div class="col-xl-3 col-lg-4">
						<div class="right_side">
							<div class="fcrse_2 mb-30">
<%
	if(userID!=null) {
%>
								<div class="tutor_img">
									<a href="profile_view.jsp"><img src="./ProfileImages/<%=userDAO.getProfileImage(userID)%>" alt=""></a>												
								</div>
								<div class="tutor_content_dt">
									<div class="tutor150">
										<a href="profile_view.jsp" class="tutor_name"><%=userName%></a>
										<%if("partner".equals(userInfo.getUserRank())) {%><div class="mef79" title="파트너"><i class="uil uil-check-circle"></i></div><%} %>
												<%if("premium".equals(userInfo.getUserRank())) {%><div class="mef78" title="프리미엄"><i class="uil uil-check-circle"></i></div><%} %>
									</div>
									<div class="tutor_cate"><%=userDAO.getProfileShortContent(userID)%></div>
									<ul class="tutor_social_links">
										<%if(userInfo.getFacebook()!=null)if(userInfo.getFacebook().length()>2) {%><li><a onclick="window.location.href='http://www.facebook.com/<%=userInfo.getFacebook()%>';" class="fb"><i class="fab fa-facebook-f"></i></a></li><%}%>
										<%if(userInfo.getTwitter()!=null)if(userInfo.getTwitter().length()>2) {%><li><a onclick="window.location.href='http://www.twitter.com/<%=userInfo.getTwitter()%>';" class="tw"><i class="fab fa-twitter"></i></a></li><%}%>
										<%if(userInfo.getGit()!=null)if(userInfo.getGit().length()>2) {%><li><a onclick="window.location.href='http://www.github.com/<%=userInfo.getGit()%>';" class="ln"><i class="fab fa-github"></i></a></li><%}%>
										<%if(userInfo.getYoutube()!=null)if(userInfo.getYoutube().length()>2) {%><li><a onclick="window.location.href='http://www.youtube.com/<%=userInfo.getYoutube()%>';" class="yu"><i class="fab fa-youtube"></i></a></li><%}%>
									</ul>
<%
	ArrayList<FollowDTO> profileFollow = follow.getList(userID);
	int followSize=0;
	if(profileFollow!=null)
		followSize = profileFollow.size();
		
	ArrayList<CommodityDTO> list = commodityDAO.getUserCommodityList(userID, 50);
	int RateScore=0;
	
	if(list.size()>=1) {
		for(CommodityDTO rate : list) {
			RateScore = RateScore+rate.getLikeCount();
		}

%>
									<div class="tut1250">
										<span class="vdt15">팔로워 <%=followSize%></span>
										<span class="vdt15">제품 <%=list.size()%></span>
									</div>
									<a href="profile_view.jsp" class="prfle12link">Go To Profile</a>
									</div> 
<%
	} else {
		%>
									<div class="tut1250">
										<span class="vdt15">팔로워 <%=followSize%></span>
										<span class="vdt15">게시한 제품이 없습니다.</span>
									</div>
									<a href="profile_view.jsp" class="prfle12link">Go To Profile</a>
									</div> 
		<%	
	}
	
	} else {
%>
								<div class="tutor_content_dt">
									<div class="tutor150">
										<a href="sign_in.jsp" class="tutor_name mt-5">로그인이 필요합니다.</a>
									</div>
									<div class="tutor_cate"></div>
									<ul class="tutor_social_links">
										<li><a href="" class="fb"><i class="fas fa-times"></i></a></li>
										<li><a href="" class="tw"><i class="fas fa-times"></i></a></li>
										<li><a href="" class="ln"><i class="fas fa-times"></i></a></li>
										<li><a href="" class="yu"><i class="fas fa-times"></i></a></li>
									</ul>
								</div> 
<%
}
%>
							</div>
							<div class="fcrse_3">
								<div class="cater_ttle">
									<h4>제품 게시</h4>
								</div>
								<div class="live_text">
									<div class="live_icon"><i class="uil uil-kayak"></i></div>
									<div class="live-content">
										<p>당신이 창작한 프로그램을 올릴곳이 어디에도 없나요?</p>
										<button class="live_link" onclick="window.location.href = 'create_new_course.jsp';">시작하기</button>
										<span class="livinfo">정보 : 게시를 마치기 전에, 사용자 지용 약관 정독을 권고합니다.</span>
									</div>
								</div>
							</div>
							<div class="get1452">
								<h4>프리미엄</h4>
								<p>프리미엄에 가입해 다양한 혜택을 누리세요</p>
								<button class="Get_btn" onclick="window.location.href = '#';">시작하기</button>
							</div>
							<div class="fcrse_3">
								<div class="cater_ttle">
									<h4>Top Categories</h4>
								</div>
								<ul class="allcate15">
									<li><a href="explore.jsp?search=Development" class="ct_item"><i class='uil uil-arrow'></i>Development</a></li>
									<li><a href="explore.jsp?search=Other" class="ct_item"><i class='uil uil-monitor'></i>Other</a></li>
									<li><a href="explore.jsp?search=Design" class="ct_item"><i class='uil uil-ruler'></i>Design</a></li>
									<li><a href="explore.jsp?search=Commission" class="ct_item"><i class='uil uil-book-open'></i>Commission & Outsourcing</a></li>
								</ul>
							</div>
							<div class="strttech120">
								<h4>파트너를 모집합니다.</h4>
								<p>다양한 혜택을 제공하는 파트너 계약을 통해 더욱 나은 판매를 시작하세요.</p>
								<button class="Get_btn" onclick="window.location.href = '#';">Vencoder#5472</button>
							</div>
						</div>
					</div>
					<div class="col-xl-12 col-lg-12">
						<div class="section3125 mt-30">
							<h4 class="item_title">공지</h4>
							<div class="la5lo1">
								<div class="owl-carousel Student_says owl-theme">
									
									<div class="item">
										<div class="fcrse_4 mb-20">
											<div class="say_content">
												<p>새로 오픈한 온라인 거래 사이트 "CRIVE" 입니다. 여러가지 창작물을 공유/거래가 가능하지만, 저작권법에 위배되는 창작물은 법적 조치가 있을수 있습니다.</p>
											</div>
											<div class="st_group">
												<div class="stud_img">
													<img src="images/left-imgs/img-4.jpg" alt="">												
												</div>
												<h4>Vencoder</h4>
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
							<a href="our_blog.jsp">블로그</a>
							<a href="career.jsp">채용</a>
							<a href="press.jsp">Press</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6">
						<div class="item_f1">
							<a href="help.jsp">도움</a>
							<a href="contact_us.jsp">사이트 정보</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6">
						<div class="item_f1">
							<a href="terms_of_use.jsp">정책</a>
							<a href="terms_of_use.jsp">저작권 정책</a>
							<a href="terms_of_use.jsp">개인정보 정책</a>
							<a href="sitemap.jsp">사이트 맵</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6">
						<div class="item_f3">
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
	<!-- Body End -->

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<script src="js/vertical-responsive-menu.min.js"></script>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/semantic/semantic.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/night-mode.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 자동완성 -->
	<script src="js/addCart.js"></script>
	
	<script>
	$(function() {
		$(document).on('click','#night-mode',function() {
			$.ajax({
	            type:'GET',
	            url:'http://localhost:8080/CRUVE/setMode',
	            dataType:'text',
	            data:{},
	            success: function(data, textStatus) {
	            },
	            error:function (data, textStatus) {
	            }
	        })
		})
	})
	</script>
	<script>
    $(function() {    //화면 다 뜨면 시작
        var searchSource = ["로그인","회원가입" ,"로그아웃","상품 등록", "프로필", "설정", "장바구니", "상품 검색","신고 목록","프리미엄","대시보드","게시한 상품 목록","이용약관","개인정보 처리"]; // 배열 형태로 
        var searchHref = ["sign_in.jsp","sign_up.jsp" ,"sign_in.jsp?Logout=true","create_new_course.jsp", "profile_view.jsp", "setting.jsp", "shopping_cart.jsp", "explore.jsp",
        		"report_history.jsp","membership.jsp","dadashboard.jsp","courses.jsp","terms_of_use.jsp","terms_of_use.jsp"];
        $("#searchMenu").autocomplete({  //오토 컴플릿트 시작
            source : searchSource,    // source 는 자동 완성 대상
            select : function(event, ui) {    //아이템 선택시
                location.href=searchHref[searchSource.indexOf(ui.item.value)];
            	console.log(ui.item);
            },
            focus : function(event, ui) {    //포커스 가면
                return false;//한글 에러 잡기용도로 사용됨
            },
            minLength: 1,// 최소 글자수
            autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
            classes: {    //잘 모르겠음
            },
            delay: 10,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//            disabled: true, //자동완성 기능 끄기
            position: { my : "right top", at: "right bottom" },
            close : function(event){    //자동완성창 닫아질때 호출
                console.log(event);
            }
        }).autocomplete( "instance" )._renderItem = function( ul, item ) {    //요 부분이 UI를 마음대로 변경하는 부분
            return $( "<div class='ui compact menu' style='z-index:0'>" )    //기본 tag가 li로 되어 있음 
            .append( "<div class='item channel_item'>" + item.value + "<br> </div> </div>" )    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
            .appendTo( ul );
     	};
     	
     	$("#searchMenu").autocomplete( "instance" )._resizeMenu = function() {
   		  //this.menu.element.outerWidth( 500 );
   		};
        
    });
	</script>
	<script>
	const Toast = Swal.mixin({ 
		toast: true, position: 'bottom', 
		showConfirmButton: false, timer: 2600,
		timerProgressBar: true, 
		didOpen: (toast) => { toast.addEventListener('mouseenter', Swal.stopTimer) 
			toast.addEventListener('mouseleave', Swal.resumeTimer) } 
		})
		
		<%if(firstLogin) {%>
		Toast.fire({ icon: 'info', 
	    title: '"<%=userID%>" 로 로그인. 환영합니다' })
	    <%} else if(userID==null&&session.getAttribute("unRegister")==null) {
	    session.setAttribute("unRegister", true);
	    %>
		Toast.fire({ icon: 'warning', 
		title: '로그인을 하셔야 모든 서비스를 이용하실수 있습니다.',
		footer: '<a href="sign_in.jsp">로그인 하기</a>',
		timer:2000
		})
	    <%}%>
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
			report.fire({
				title: '신고 사유를 입력하세요.',
				html: '<div class="ui search focus mt-15"><div class="ui left icon input swdh95"><i class="uil uil-comment-alt-edit icon icon2"></i><input id="reportDescription" class="prompt"></div></div><br><span style="color: grey; font-size:13px">거짓 신고가 발각될 경우 처벌을 받을 수 있습니다.</span>',
				focusConfirm: false,
				  preConfirm: (description) => {
					  $.ajax({
							type:'POST',
				            async:false, //false가 기본값임 - 비동기
				            url:'http://localhost:8080/CRUVE/report',
				            dataType:'text',
				            data:{'writtenID':$(this).attr('data-name'),'reviewID':'0','description':$("#reportDescription").val()},
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
		$(document).on('click','.saveBtn',function(e){
			$.ajax({
				type:'GET',
				async:false, //false가 기본값임 - 비동기
				url:'http://localhost:8080/CRUVE/save',
				dataType:'text',
				data:{'writtenID':$(this).attr('data-name')},
				success: function(data, textStatus) {
					if(data.indexOf("success")!=-1) {
						Toast.fire({ icon: 'success', 
						title: '정상적으로 저장되었습니다.',
						text: '메뉴의 "저장된 게시물"에서 확인 가능합니다.',
						timer: 3000
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
		})
	})
	</script>
	
	
</body>
</html>
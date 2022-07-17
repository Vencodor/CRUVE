<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="commodity.CommodityDAO" %>
<%@ page import="commodity.CommodityDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="util.DateCount" %>
<%@ page import="util.AES128" %>

<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>
<%
	String userID = null;

	if(session.getAttribute("userID")!=null)
		userID = (String)session.getAttribute("userID");
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='sign_in.jsp';");
		script.println("</script>");
		script.close();
	}
	
	UserDAO userDAO = new UserDAO();
	CommodityDAO commodityDAO = new CommodityDAO();
	DateCount date = new DateCount();
	AES128 aes = new AES128();

%>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">		
		<title>Cursus - My Courses</title>
		
		<!-- Favicon Icon -->
		<link rel="icon" type="image/png" href="images/fav.png">
		
		<!-- Stylesheets -->
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,500' rel='stylesheet'>
		<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
		<link href="css/vertical-responsive-menu1.min.css" rel="stylesheet">
		<link href="css/instructor-dashboard.css" rel="stylesheet">
		<link href="css/instructor-responsive.css" rel="stylesheet">
		<link href="css/night-mode.css" rel="stylesheet">
		<link href="css/datepicker.min.css" rel="stylesheet">
		
		<!-- Vendor Stylesheets -->
		<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
		<link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
		<link href="vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
		<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="vendor/semantic/semantic.min.css">		
		
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		
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
						<a href="dashboard.jsp" class="menu--link" title="Dashboard">
							<i class="uil uil-apps menu--icon"></i>
							<span class="menu--label">Dashboard</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="courses.jsp" class="menu--link active" title="Courses">
							<i class='uil uil-book-alt menu--icon'></i>
							<span class="menu--label">Courses</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="analyics.jsp" class="menu--link" title="Analyics">
							<i class='uil uil-analysis menu--icon'></i>
							<span class="menu--label">Analyics</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="create_new_course.jsp" class="menu--link" title="Create Course">
							<i class='uil uil-plus-circle menu--icon'></i>
							<span class="menu--label">Create Course</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="messages.jsp" class="menu--link" title="Messages">
							<i class='uil uil-comments menu--icon'></i>
							<span class="menu--label">Messages</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="notifications.jsp" class="menu--link" title="Notifications">
						  <i class='uil uil-bell menu--icon'></i>
						  <span class="menu--label">Notifications</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="instructor_my_certificates.jsp" class="menu--link" title="My Certificates">
						  <i class='uil uil-award menu--icon'></i>
						  <span class="menu--label">My Certificates</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="all_reviews.jsp" class="menu--link" title="Reviews">
						  <i class='uil uil-star menu--icon'></i>
						  <span class="menu--label">Reviews</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="instructor_earning.jsp" class="menu--link" title="Earning">
						  <i class='uil uil-dollar-sign menu--icon'></i>
						  <span class="menu--label">Earning</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="instructor_payout.jsp" class="menu--link" title="Payout">
						  <i class='uil uil-wallet menu--icon'></i>
						  <span class="menu--label">Payout</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="instructor_statements.jsp" class="menu--link" title="Statements">
						  <i class='uil uil-file-alt menu--icon'></i>
						  <span class="menu--label">Statements</span>
						</a>
					</li>
					<li class="menu--item">
						<a href="calculate.jsp" class="menu--link" title="Verification">
						  <i class='uil uil-check-circle menu--icon'></i>
						  <span class="menu--label">Verification</span>
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
						<a href="feedback.jsp" class="menu--link" title="Send Feedback">
							<i class='uil uil-comment-alt-exclamation menu--icon'></i>
							<span class="menu--label">Send Feedback</span>
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
						<h2 class="st_title"><i class="uil uil-book-alt"></i>Courses</h2>
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
					<div class="col-md-12">
						<div class="my_courses_tabs">
							<ul class="nav nav-pills my_crse_nav" id="pills-tab" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" id="pills-my-courses-tab" data-toggle="pill" href="#pills-my-courses" role="tab" aria-controls="pills-my-courses" aria-selected="true"><i class="uil uil-book-alt"></i>내 상품</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="pills-my-purchases-tab" data-toggle="pill" href="#pills-my-purchases" role="tab" aria-controls="pills-my-purchases" aria-selected="false"><i class="uil uil-download-alt"></i>내 구매</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="pills-upcoming-courses-tab" data-toggle="pill" href="#pills-upcoming-courses" role="tab" aria-controls="pills-upcoming-courses" aria-selected="false"><i class="uil uil-upload-alt"></i>검토 대기중인 상품</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="pills-discount-tab" data-toggle="pill" href="#pills-discount" role="tab" aria-controls="pills-discount" aria-selected="false"><i class="uil uil-tag-alt"></i>할인</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="pills-promotions-tab" data-toggle="pill" href="#pills-promotions" role="tab" aria-controls="pills-promotions" aria-selected="false"><i class="uil uil-megaphone"></i>프로모션</a>
								</li>
							</ul>
							<div class="tab-content" id="pills-tabContent">
								<div class="tab-pane fade show active" id="pills-my-courses" role="tabpanel">
									<div class="table-responsive mt-30">
										<table class="table ucp-table">
											<thead class="thead-s">
												<tr>
													<th class="text-center" scope="col">작성 번호</th>
													<th>제목</th>
													<th class="text-center" scope="col">마지막 작성일</th>
													<th class="text-center" scope="col">판매</th>
													<th class="text-center" scope="col">부속</th>
													<th class="text-center" scope="col">카테고리</th>
													<th class="text-center" scope="col">상해</th>
													<th class="text-center" scope="col">작동</th>
												</tr>
											</thead>
											<tbody>
<%
	ArrayList<CommodityDTO> list = commodityDAO.getUserCommodityList(userID, 30);
	if(list!=null) {
		for(CommodityDTO a : list) {
%>
												<tr>
													<td class="text-center"><%=a.getWrittenID()%></td>
													<td><%=a.getTitle()%></td>
													<td class="text-center"><%=a.getLastDate()%></td>
													<td class="text-center"><%=a.getBuyer()%></td>
													<td class="text-center">0</td>
													<td class="text-center"><a href="#"><%=a.getCategory()%></a> | <a href="#"><%=a.getSubcategory()%></a></td>
													<td class="text-center"><b class="course_active">Active</b></td>
													<td class="text-center">
														<a href="modify_commodity.jsp?ID=<%=a.getWrittenID()%>" title="Edit" class="gray-s"><i class="uil uil-edit-alt"></i></a>
														<a href="delete_commodity.jsp?ID=<%=a.getWrittenCode()%>" title="Delete" class="gray-s"><i class="uil uil-trash-alt"></i></a>
													</td>
												</tr>
<%
		}
	}
%>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="pills-my-purchases" role="tabpanel">
									<div class="table-responsive mt-30">
										<table class="table ucp-table">
											<thead class="thead-s">
												<tr>
													<th class="text-center" scope="col">Item No.</th>
													<th class="cell-ta" scope="col">Title</th>
													<th class="cell-ta" scope="col">Vendor</th>
													<th class="cell-ta" scope="col">Category</th>
													<th class="text-center" scope="col">Delivery Type</th>
													<th class="text-center" scope="col">Price</th>
													<th class="text-center" scope="col">Purchase Date</th>
													<th class="text-center" scope="col">Actions</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="text-center">001</td>
													<td class="cell-ta">Course Title Here</td>
													<td class="cell-ta"><a href="#">Zoena Singh</a></td>
													<td class="cell-ta"><a href="#">Web Development</a></td>
													<td class="text-center"><b class="course_active">Download</b></td>
													<td class="text-center">$15</td>
													<td class="text-center">25 March 2020</td>
													<td class="text-center">
														<a href="#" title="Download" class="gray-s"><i class="uil uil-download-alt"></i></a>
														<a href="#" title="Delete" class="gray-s"><i class="uil uil-trash-alt"></i></a>
														<a href="#" title="Print" class="gray-s"><i class="uil uil-print"></i></a>
													</td>
												</tr>
												<tr>
													<td class="text-center">002</td>
													<td class="cell-ta">Course Title Here</td>
													<td class="cell-ta"><a href="#">Rock William</a></td>
													<td class="cell-ta"><a href="#">C++</a></td>
													<td class="text-center"><b class="course_active">Download</b></td>
													<td class="text-center">$20</td>
													<td class="text-center">20 March 2020</td>
													<td class="text-center">
														<a href="#" title="Download" class="gray-s"><i class="uil uil-download-alt"></i></a>
														<a href="#" title="Delete" class="gray-s"><i class="uil uil-trash-alt"></i></a>
														<a href="#" title="Print" class="gray-s"><i class="uil uil-print"></i></a>
													</td>
												</tr>
											</tbody>
										</table>
									</div>								
								</div>
								<div class="tab-pane fade" id="pills-upcoming-courses" role="tabpanel">
									<div class="table-responsive mt-30">
										<table class="table ucp-table">
											<thead class="thead-s">
												<tr>
													<th class="text-center" scope="col">Item No.</th>
													<th class="cell-ta">Title</th>
													<th class="text-center" scope="col">Thumbnail</th>
													<th class="text-center">Category</th>
													<th class="text-center">Price</th>
													<th class="text-center">Date</th>
													<th class="text-center" scope="col">Status</th>
													<th class="text-center" scope="col">Actions</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="text-center">01</td>
													<td class="cell-ta">Course Title Here</td>
													<td class="text-center"><a href="#">View</a></td>
													<td class="text-center"><a href="#">Web Development</a></td>
													<td class="text-center">$15</td>
													<td class="text-center">9 April 2020</td>
													<td class="text-center"><b class="course_active">Pending</b></td>
													<td class="text-center">
														<a href="#" title="Edit" class="gray-s"><i class="uil uil-edit-alt"></i></a>
														<a href="#" title="Delete" class="gray-s"><i class="uil uil-trash-alt"></i></a>
													</td>
												</tr>
												<tr>
													<td class="text-center">02</td>
													<td class="cell-ta">Course Title Here</td>
													<td class="text-center"><a href="#">View</a></td>
													<td class="text-center"><a href="#">Graphic Design</a></td>
													<td class="text-center">$12</td>
													<td class="text-center">8 April 2020</td>
													<td class="text-center"><b class="course_active">Pending</b></td>
													<td class="text-center">
														<a href="#" title="Edit" class="gray-s"><i class="uil uil-edit-alt"></i></a>
														<a href="#" title="Delete" class="gray-s"><i class="uil uil-trash-alt"></i></a>
													</td>
												</tr>
												<tr>
													<td class="text-center">03</td>
													<td class="cell-ta">Course Title Here</td>
													<td class="text-center"><a href="#">View</a></td>
													<td class="text-center"><a href="#">Photography</a></td>
													<td class="text-center">$6</td>
													<td class="text-center">7 April 2020</td>
													<td class="text-center"><b class="course_active">Pending</b></td>
													<td class="text-center">
														<a href="#" title="Edit" class="gray-s"><i class="uil uil-edit-alt"></i></a>
														<a href="#" title="Delete" class="gray-s"><i class="uil uil-trash-alt"></i></a>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="pills-discount" role="tabpanel">
									<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingOne">
												<div class="panel-title adcrse1250">
													<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
														할인상품 추가
													</a>
												</div>
											</div>
											<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
												<div class="panel-body adcrse_body">
													<div class="row">
														<div class="col-lg-8">
															<div class="discount_form">
																<div class="row">
																	<div class="col-lg-6 col-md-6">
																		<div class="mt-20 lbel25">	
																			<label>상품*</label>
																		</div>
																		<select id="saleSelect" class="ui hj145 dropdown cntry152 prompt srch_explore">
																			<option value="">선택하기</option>
<%
	if(commodityDAO.getUserCommodityList(userID, 30)!=null) {
	for(CommodityDTO a : commodityDAO.getUserCommodityList(userID, 30)) {
%>
																			<option value="<%=aes.encrypt(a.getWrittenID())%>"><%=a.getTitle()%> (ID:<%=a.getWrittenID()%></option>
<%
	}
	}
%>
																		</select>
																	</div>
																	<div class="col-lg-6 col-md-6">	
																		<div class="ui search focus mt-20 lbel25">
																			<label>할인률</label>
																			<div class="ui left icon input swdh19">
																				<input class="prompt srch_explore" type="number" id="saleAmount" min="0" max="3" placeholder="퍼센트 정도를 나타냅니다. ex. 20% -> 20">															
																			</div>
																		</div>										
																	</div>
																	<div class="col-lg-12 col-md-12">	
																		<div class="ui search focus mt-20 lbel25">
																			<label>기간</label>
																			<div class="ui left icon input swdh19">
																			<input id="saleDate" class="prompt srch_explore datepicker-here" type="text" placeholder="" 
																			data-range="true" data-multiple-dates-separator=" - " data-timepicker="true" data-language="ko"
																			data-time-format='hh:ii' >														
																			</div>
																		</div>										
																	</div>
																	<div class="col-lg-4 col-md-4"></div>
																	<div class="col-lg-4 col-md-4">	
																		<button id="addSaleBtn" class="discount_btn">추가</button>								
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div id="salesList">
										<div class="table-responsive mt-30" id="salesListHTML">
											<table class="table ucp-table">
												<thead class="thead-s">
													<tr>
														<th class="text-center" scope="col">글 번호</th>
														<th class="cell-ta">타이틀</th>
														<th class="text-center" scope="col">시작일</th>
														<th class="text-center" scope="col">종료일</th>
														<th class="text-center" scope="col">할인</th>
														<th class="text-center" scope="col">상태</th>
														<th class="text-center" scope="col">삭제</th>
													</tr>
												</thead>
												<tbody>
	<%
		ArrayList<CommodityDTO> salesList = commodityDAO.getSalesList(userID);
		if(salesList!=null) {
			for(CommodityDTO a : salesList) {
	%>
	                                                <tr>
														<td class="text-center"><%=a.getWrittenID()%></td>
														<td class="cell-ta"><%=a.getTitle()%></td>
														<td class="text-center"><%=a.getSaleStartDate()%></td>
														<td class="text-center"><%=a.getSaleEndDate()%></td>
														<td class="text-center"><%=a.getSaleAmount()%>%</td>
														<td class="text-center"><b class="course_active"><%=a.isSaleActive()%></b></td>
														<td class="text-center">
															<div id="saleDelete" class="gray-s" data-ID="<%=aes.encrypt(a.getWrittenID())%>"><i class="uil uil-trash-alt"></i></div>
														</td>
													</tr>
	<%
			}
		}
	%>
	                                            </tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="pills-promotions" role="tabpanel" aria-labelledby="pills-promotions-tab">
									<div class="promotion_tab mb-10">
										<img src="images/dashboard/promotion.svg" alt="">
										<h4>프로모션 계획이 활성화 되었습니다!</h4>
										<p>프로모션 계획을 활성화하면 코스보기 및 판매를 개선 할 수 있습니다.</p>
										<button class="plan_link_btn" onclick="window.location.href = '';" disabled="disabled">새로운 계획 짜기</button>
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
							<a href="terms_of_use.jsp">Copyright Policy</a>
							<a href="terms_of_use.jsp">Terms</a>
							<a href="terms_of_use.jsp">Privacy Policy</a>
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
	<script src="js/custom1.js"></script>
	<script src="js/night-mode.js"></script>
	<script src="js/datepicker.min.js"></script>
	<script src="js/i18n/datepicker.ko.js"></script>
	
	<script>
		const Toast = Swal.mixin({ 
		toast: true, position: 'bottom', 
		showConfirmButton: false, timer: 3000,
		timerProgressBar: true, 
		didOpen: (toast) => { toast.addEventListener('mouseenter', Swal.stopTimer) 
			toast.addEventListener('mouseleave', Swal.resumeTimer) } 
		})
	</script>
	
	<script>
	$(function() {
		$(document).on('click','#addSaleBtn',function(e) {
			var saleSelect = $('#saleSelect').val();
			var saleAmount = $('#saleAmount').val();
			var saleDate = $('#saleDate').val();
			
			if(saleSelect&&saleAmount&&saleDate) {
				$.ajax({
					type:'POST',
		            async:false, //false가 기본값임 - 비동기
		            url:'http://localhost:8080/CRUVE/setSale',
		            dataType:'text',
		            data:{"writtenID":saleSelect,"saleAmount":saleAmount,"saleDate":saleDate},
		            success: function(data, textStatus) {
		            	if(data.indexOf("success")!=-1) {
				        	Toast.fire({ icon: 'success', 
				            	title: '정상적으로 할인 상품이 등록되었습니다.',
					            timer: 3200
				            	})
				        	$('#salesList').load(window.location.href + " #salesListHTML");
		            	} else {
		            		Toast.fire({ icon: 'error', 
			            		title: data })
		            	}
		            },
		            error:function (data, textStatus) {
		                console.log('review'+data);
		            }
				})
			} else {
				Toast.fire({ icon: 'warning', 
            		title: '입력하지 않은 사항이 존재합니다.',
            		timer: 1800
            		})
			}
		})
	})
	</script>
	<script>
	$(function () {
		$(document).on('click','#saleDelete',function() {
			$.ajax({
				type:'POST',
	            async:false, //false가 기본값임 - 비동기
	            url:'http://localhost:8080/CRUVE/deleteSale',
	            dataType:'text',
	            data:{"writtenID":$(this).attr('data-ID')},
	            success: function(data, textStatus) {
	            	if(data.indexOf("success")!=-1) {
			        	Toast.fire({ icon: 'success', 
			            	title: '정상적으로 할인을 취소하셨습니다.',
			            	text: '적용 되기까지 몇분의 시간이 소요됩니다.',
				            timer: 2300
			            	})
			        	$('#salesList').load(window.location.href + " #salesListHTML");
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
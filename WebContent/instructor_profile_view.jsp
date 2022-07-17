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
		<title>Cursus - Instructor Profile View</title>
		
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
		<div class="_216b01">
			<div class="container">			
				<div class="row justify-content-md-center">
					<div class="col-md-10">
						<div class="section3125 rpt145">							
							<div class="row">						
								<div class="col-lg-7">
									<a href="#" class="_216b22">										
										<span><i class="uil uil-windsock"></i></span>Report Profile
									</a>
									<div class="dp_dt150">						
										<div class="img148">
											<img src="images/left-imgs/img-1.jpg" alt="">										
										</div>
										<div class="prfledt1">
											<h2>John Doe</h2>
											<span>Web Developer</span>
										</div>										
									</div>
									<ul class="_ttl120">
										<li>
											<div class="_ttl121">
												<div class="_ttl122">Enroll Students</div>
												<div class="_ttl123">612K</div>
											</div>
										</li>
										<li>
											<div class="_ttl121">
												<div class="_ttl122">Courses</div>
												<div class="_ttl123">8</div>
											</div>
										</li>
										<li>
											<div class="_ttl121">
												<div class="_ttl122">Reviews</div>
												<div class="_ttl123">115K</div>
											</div>
										</li>
										<li>
											<div class="_ttl121">
												<div class="_ttl122">Subscribers</div>
												<div class="_ttl123">452K</div>
											</div>
										</li>
									</ul>
								</div>
								<div class="col-lg-5">
									<a href="#" class="_216b12">										
										<span><i class="uil uil-windsock"></i></span>Report Profile
									</a>
									<div class="rgt-145">
										<ul class="tutor_social_links">
											<li><a href="#" class="fb"><i class="fab fa-facebook-f"></i></a></li>
											<li><a href="#" class="tw"><i class="fab fa-twitter"></i></a></li>
											<li><a href="#" class="ln"><i class="fab fa-linkedin-in"></i></a></li>
											<li><a href="#" class="yu"><i class="fab fa-youtube"></i></a></li>
										</ul>
									</div>
									<ul class="_bty149">
										<li><button class="subscribe-btn btn500">Subscribe</button></li>								
										<li><button class="msg125 btn500">Message</button></li>								
									</ul>
									
								</div>													
							</div>							
						</div>							
					</div>															
				</div>
			</div>
		</div>
		<div class="_215b15">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">						
						<div class="course_tabs">
							<nav>
								<div class="nav nav-tabs tab_crse" id="nav-tab" role="tablist">
									<a class="nav-item nav-link active" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-selected="true">About</a>
									<a class="nav-item nav-link" id="nav-courses-tab" data-toggle="tab" href="#nav-courses" role="tab" aria-selected="false">Courses</a>
									<a class="nav-item nav-link" id="nav-reviews-tab" data-toggle="tab" href="#nav-reviews" role="tab" aria-selected="false">Discussion</a>
								</div>
							</nav>						
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="_215b17">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="course_tab_content">
							<div class="tab-content" id="nav-tabContent">
								<div class="tab-pane fade show active" id="nav-about" role="tabpanel">
									<div class="_htg451">
										<div class="_htg452">
											<h3>About Me</h3>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum scelerisque nibh sed ligula blandit, quis faucibus lorem pellentesque. Suspendisse pulvinar dictum pellentesque. Vestibulum at sagittis lectus, sit amet aliquam turpis. In quis elit tempus, semper justo vitae, lacinia massa. Etiam sagittis quam quis fermentum lacinia. Curabitur blandit sapien et risus congue viverra. Mauris auctor risus sit amet cursus sollicitudin. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla feugiat sodales massa, in viverra dolor condimentum ut. In imperdiet, justo nec volutpat blandit, tellus justo tempor quam, sed pretium nibh nunc nec mauris. Mauris vel malesuada magna. Quisque iaculis molestie purus, non luctus mauris porta id. Maecenas imperdiet tincidunt mauris vestibulum vulputate. Aenean sollicitudin pretium nibh, et sagittis risus tincidunt ac. Phasellus scelerisque rhoncus massa, ac euismod massa pharetra non. Phasellus dignissim, urna in iaculis varius, turpis libero mollis velit, sit amet euismod arcu mi ac nibh. Praesent tincidunt eros at ligula pellentesque elementum. Fusce condimentum enim a tellus egestas, sit amet rutrum elit gravida. Pellentesque in porta sapien. Fusce tristique maximus ipsum et mollis. Sed at massa ac est dapibus vulputate at eu nibh.</p>
										</div>																	
									</div>							
								</div>
								<div class="tab-pane fade" id="nav-courses" role="tabpanel">
									<div class="crse_content">
										<h3>My courses (8)</h3>
										<div class="_14d25">
											<div class="row">
												<div class="col-lg-3 col-md-4">
													<div class="fcrse_1 mt-30">
														<a href="detail_view.jsp" class="fcrse_img">
															<img src="images/courses/img-1.jpg" alt="">
															<div class="course-overlay">
																<div class="badge_seller">Bestseller</div>
																<div class="crse_reviews">
																	<i class="uil uil-star"></i>4.5
																</div>
																<span class="play_btn1"><i class="uil uil-play"></i></span>
																<div class="crse_timer">
																	25 hours
																</div>
															</div>
														</a>
														<div class="fcrse_content">
															<div class="eps_dots more_dropdown">
																<a href="#"><i class="uil uil-ellipsis-v"></i></a>
																<div class="dropdown-content">
																	<span><i class="uil uil-share-alt"></i>Share</span>
																	<span><i class="uil uil-clock-three"></i>Save</span>
																	<span><i class="uil uil-ban"></i>Not Interested</span>
																	<span><i class="uil uil-windsock"></i>Report</span>
																</div>																											
															</div>
															<div class="vdtodt">
																<span class="vdt14">109k views</span>
																<span class="vdt14">15 days ago</span>
															</div>
															<a href="detail_view.jsp" class="crse14s">Complete Python Bootcamp: Go from zero to hero in Python 3</a>
															<a href="#" class="crse-cate">Web Development | Python</a>
															<div class="auth1lnkprce">
																<p class="cr1fot">By <a href="#">John Doe</a></p>
																<div class="prce142">$10</div>
																<button class="shrt-cart-btn" title="cart"><i class="uil uil-shopping-cart-alt"></i></button>
															</div>
														</div>
													</div>	
												</div>
												<div class="col-lg-3 col-md-4">
													<div class="fcrse_1 mt-30">
														<a href="detail_view.jsp" class="fcrse_img">
															<img src="images/courses/img-2.jpg" alt="">
															<div class="course-overlay">
																<div class="badge_seller">Bestseller</div>
																<div class="crse_reviews">
																	<i class="uil uil-star"></i>4.5
																</div>
																<span class="play_btn1"><i class="uil uil-play"></i></span>
																<div class="crse_timer">
																	28 hours
																</div>
															</div>
														</a>
														<div class="fcrse_content">
															<div class="eps_dots more_dropdown">
																<a href="#"><i class="uil uil-ellipsis-v"></i></a>
																<div class="dropdown-content">
																	<span><i class="uil uil-share-alt"></i>Share</span>
																	<span><i class="uil uil-clock-three"></i>Save</span>
																	<span><i class="uil uil-ban"></i>Not Interested</span>
																	<span><i class="uil uil-windsock"></i>Report</span>
																</div>																									
															</div>
															<div class="vdtodt">
																<span class="vdt14">5M views</span>
																<span class="vdt14">15 days ago</span>
															</div>
															<a href="detail_view.jsp" class="crse14s">The Complete JavaScript Course 2020: Build Real Projects!</a>
															<a href="#" class="crse-cate">Development | JavaScript</a>
															<div class="auth1lnkprce">
																<p class="cr1fot">By <a href="#">John Doe</a></p>
																<div class="prce142">$5</div>
																<button class="shrt-cart-btn" title="cart"><i class="uil uil-shopping-cart-alt"></i></button>
															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-3 col-md-4">
													<div class="fcrse_1 mt-30">
														<a href="detail_view.jsp" class="fcrse_img">
															<img src="images/courses/img-20.jpg" alt="">
															<div class="course-overlay">
																<div class="crse_reviews">
																	<i class="uil uil-star"></i>5.0
																</div>
																<span class="play_btn1"><i class="uil uil-play"></i></span>
																<div class="crse_timer">
																	21 hours
																</div>
															</div>
														</a>
														<div class="fcrse_content">
															<div class="eps_dots more_dropdown">
																<a href="#"><i class="uil uil-ellipsis-v"></i></a>
																<div class="dropdown-content">
																	<span><i class="uil uil-share-alt"></i>Share</span>
																	<span><i class="uil uil-clock-three"></i>Save</span>
																	<span><i class="uil uil-ban"></i>Not Interested</span>
																	<span><i class="uil uil-windsock"></i>Report</span>
																</div>																										
															</div>
															<div class="vdtodt">
																<span class="vdt14">200 Views</span>
																<span class="vdt14">4 days ago</span>
															</div>
															<a href="detail_view.jsp" class="crse14s">WordPress Development - Themes, Plugins &amp; Gutenberg</a>
															<a href="#" class="crse-cate">Design | Wordpress</a>
															<div class="auth1lnkprce">
																<p class="cr1fot">By <a href="#">John Doe</a></p>
																<div class="prce142">$14</div>
																<button class="shrt-cart-btn" title="cart"><i class="uil uil-shopping-cart-alt"></i></button>
															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-3 col-md-4">
													<div class="fcrse_1 mt-30">
														<a href="detail_view.jsp" class="fcrse_img">
															<img src="images/courses/img-4.jpg" alt="">
															<div class="course-overlay">
																<div class="badge_seller">Bestseller</div>
																<div class="crse_reviews">
																	<i class="uil uil-star"></i>5.0
																</div>
																<span class="play_btn1"><i class="uil uil-play"></i></span>
																<div class="crse_timer">
																	1 hour
																</div>
															</div>
														</a>
														<div class="fcrse_content">
															<div class="eps_dots more_dropdown">
																<a href="#"><i class="uil uil-ellipsis-v"></i></a>
																<div class="dropdown-content">
																	<span><i class="uil uil-share-alt"></i>Share</span>
																	<span><i class="uil uil-clock-three"></i>Save</span>
																	<span><i class="uil uil-ban"></i>Not Interested</span>
																	<span><i class="uil uil-windsock"></i>Report</span>
																</div>																										
															</div>
															<div class="vdtodt">
																<span class="vdt14">153k views</span>
																<span class="vdt14">3 months ago</span>
															</div>
															<a href="detail_view.jsp" class="crse14s">The Complete Digital Marketing Course - 12 Courses in 1</a>
															<a href="#" class="crse-cate">Digital Marketing | Marketing</a>
															<div class="auth1lnkprce">
																<p class="cr1fot">By <a href="#">John Doe</a></p>
																<div class="prce142">$12</div>
																<button class="shrt-cart-btn" title="cart"><i class="uil uil-shopping-cart-alt"></i></button>
															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-3 col-md-4">
													<div class="fcrse_1 mt-30">
														<a href="detail_view.jsp" class="fcrse_img">
															<img src="images/courses/img-13.jpg" alt="">
															<div class="course-overlay">
																<span class="play_btn1"><i class="uil uil-play"></i></span>
																<div class="crse_timer">
																	30 hours
																</div>
															</div>
														</a>
														<div class="fcrse_content">
															<div class="eps_dots more_dropdown">
																<a href="#"><i class="uil uil-ellipsis-v"></i></a>
																<div class="dropdown-content">
																	<span><i class="uil uil-share-alt"></i>Share</span>
																	<span><i class="uil uil-clock-three"></i>Save</span>
																	<span><i class="uil uil-ban"></i>Not Interested</span>
																	<span><i class="uil uil-windsock"></i>Report</span>
																</div>																										
															</div>
															<div class="vdtodt">
																<span class="vdt14">20 Views</span>
																<span class="vdt14">1 day ago</span>
															</div>
															<a href="detail_view.jsp" class="crse14s">The Complete Node.js Developer Course (3rd Edition)</a>
															<a href="#" class="crse-cate">Development | Node.js</a>
															<div class="auth1lnkprce">
																<p class="cr1fot">By <a href="#">John Doe</a></p>
																<div class="prce142">$3</div>
																<button class="shrt-cart-btn" title="cart"><i class="uil uil-shopping-cart-alt"></i></button>
															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-3 col-md-4">
													<div class="fcrse_1 mt-30">
														<a href="detail_view.jsp" class="fcrse_img">
															<img src="images/courses/img-7.jpg" alt="">
															<div class="course-overlay">
																<div class="badge_seller">Bestseller</div>
																<div class="crse_reviews">
																	<i class="uil uil-star"></i>5.0
																</div>
																<span class="play_btn1"><i class="uil uil-play"></i></span>
																<div class="crse_timer">
																	5.4 hours
																</div>
															</div>
														</a>
														<div class="fcrse_content">
															<div class="eps_dots more_dropdown">
																<a href="#"><i class="uil uil-ellipsis-v"></i></a>
																<div class="dropdown-content">
																	<span><i class="uil uil-share-alt"></i>Share</span>
																	<span><i class="uil uil-clock-three"></i>Save</span>
																	<span><i class="uil uil-ban"></i>Not Interested</span>
																	<span><i class="uil uil-windsock"></i>Report</span>
																</div>																										
															</div>
															<div class="vdtodt">
																<span class="vdt14">109k views</span>
																<span class="vdt14">15 days ago</span>
															</div>
															<a href="detail_view.jsp" class="crse14s">WordPress for Beginners: Create a Website Step by Step</a>
															<a href="#" class="crse-cate">Design | Wordpress</a>
															<div class="auth1lnkprce">
																<p class="cr1fot">By <a href="#">John Doe</a></p>
																<div class="prce142">$18</div>
																<button class="shrt-cart-btn" title="cart"><i class="uil uil-shopping-cart-alt"></i></button>
															</div>
														</div>
													</div>
												</div>												
												<div class="col-lg-3 col-md-4">
													<div class="fcrse_1 mt-30">
														<a href="detail_view.jsp" class="fcrse_img">
															<img src="images/courses/img-8.jpg" alt="">
															<div class="course-overlay">
																<div class="badge_seller">Bestseller</div>
																<div class="crse_reviews">
																	<i class="uil uil-star"></i>4.0
																</div>
																<span class="play_btn1"><i class="uil uil-play"></i></span>
																<div class="crse_timer">
																	23 hours
																</div>
															</div>
														</a>
														<div class="fcrse_content">
															<div class="eps_dots more_dropdown">
																<a href="#"><i class="uil uil-ellipsis-v"></i></a>
																<div class="dropdown-content">
																	<span><i class="uil uil-share-alt"></i>Share</span>
																	<span><i class="uil uil-clock-three"></i>Save</span>
																	<span><i class="uil uil-ban"></i>Not Interested</span>
																	<span><i class="uil uil-windsock"></i>Report</span>
																</div>																										
															</div>
															<div class="vdtodt">
																<span class="vdt14">196k views</span>
																<span class="vdt14">1 month ago</span>
															</div>
															<a href="detail_view.jsp" class="crse14s">CSS - The Complete Guide 2020 (incl. Flexbox, Grid &amp; Sass)</a>
															<a href="#" class="crse-cate">Design | CSS</a>
															<div class="auth1lnkprce">
																<p class="cr1fot">By <a href="#">John Doe</a></p>
																<div class="prce142">$10</div>
																<button class="shrt-cart-btn" title="cart"><i class="uil uil-shopping-cart-alt"></i></button>
															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-3 col-md-4">
													<div class="fcrse_1 mt-30">
														<a href="detail_view.jsp" class="fcrse_img">
															<img src="images/courses/img-16.jpg" alt="">
															<div class="course-overlay">
																<span class="play_btn1"><i class="uil uil-play"></i></span>
																<div class="crse_timer">
																	22 hours
																</div>
															</div>
														</a>
														<div class="fcrse_content">
															<div class="eps_dots more_dropdown">
																<a href="#"><i class="uil uil-ellipsis-v"></i></a>
																<div class="dropdown-content">
																	<span><i class="uil uil-share-alt"></i>Share</span>
																	<span><i class="uil uil-clock-three"></i>Save</span>
																	<span><i class="uil uil-ban"></i>Not Interested</span>
																	<span><i class="uil uil-windsock"></i>Report</span>
																</div>																									
															</div>
															<div class="vdtodt">
																<span class="vdt14">11 Views</span>
																<span class="vdt14">5 Days ago</span>
															</div>
															<a href="detail_view.jsp" class="crse14s">Vue JS 2 - The Complete Guide (incl. Vue Router &amp; Vuex)</a>
															<a href="#" class="crse-cate">Development | Vue JS</a>
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
									<div class="student_reviews">
										<div class="row">
											<div class="col-lg-12">
												<div class="review_right">
													<div class="review_right_heading">
														<h3>Discussions</h3>
													</div>
												</div>
												<div class="cmmnt_1526">
													<div class="cmnt_group">
														<div class="img160">
															<img src="images/left-imgs/img-1.jpg" alt="">										
														</div>
														<textarea class="_cmnt001" placeholder="Add a public comment"></textarea>
													</div>
													<button class="cmnt-btn" type="submit">Comment</button>
												</div>
												<div class="review_all120">
													<div class="review_item">
														<div class="review_usr_dt">
															<img src="images/left-imgs/img-1.jpg" alt="">
															<div class="rv1458">
																<h4 class="tutor_name1">John Doe</h4>
																<span class="time_145">2 hour ago</span>
															</div>
															<div class="eps_dots more_dropdown">
																<a href="#"><i class="uil uil-ellipsis-v"></i></a>
																<div class="dropdown-content">
																	<span><i class='uil uil-comment-alt-edit'></i>Edit</span>
																	<span><i class='uil uil-trash-alt'></i>Delete</span>
																</div>																											
															</div>
														</div>
														<p class="rvds10">Nam gravida elit a velit rutrum, eget dapibus ex elementum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce lacinia, nunc sit amet tincidunt venenatis.</p>
														<div class="rpt101">
															<a href="#" class="report155"><i class='uil uil-thumbs-up'></i> 10</a>
															<a href="#" class="report155"><i class='uil uil-thumbs-down'></i> 1</a>
															<a href="#" class="report155"><i class='uil uil-heart'></i></a>
															<a href="#" class="report155 ml-3">Reply</a>
														</div>
													</div>
													<div class="review_reply">
														<div class="review_item">
															<div class="review_usr_dt">
																<img src="images/left-imgs/img-3.jpg" alt="">
																<div class="rv1458">
																	<h4 class="tutor_name1">Rock Doe</h4>
																	<span class="time_145">1 hour ago</span>
																</div>
																<div class="eps_dots more_dropdown">
																	<a href="#"><i class="uil uil-ellipsis-v"></i></a>
																	<div class="dropdown-content">
																		<span><i class='uil uil-trash-alt'></i>Delete</span>
																	</div>																											
																</div>
															</div>
															<p class="rvds10">Fusce lacinia, nunc sit amet tincidunt venenatis.</p>
															<div class="rpt101">
																<a href="#" class="report155"><i class='uil uil-thumbs-up'></i> 4</a>
																<a href="#" class="report155"><i class='uil uil-thumbs-down'></i> 2</a>
																<a href="#" class="report155"><i class='uil uil-heart'></i></a>
																<a href="#" class="report155 ml-3">Reply</a>
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
	
</body>
</html>
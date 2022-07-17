<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="util.AES256" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="chat.*" %>
<%@ page import="util.DateCount" %>

<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="CRUVE">
		<meta name="author" content="CRUVE">
		
		<meta name="_csrf" th:content="$(_csrf.token)"/>
		<meta name="_csrf_header" th:content="$(_csrf.headerName)"/>
		<title>Cursus - Messages</title>
		
		<!-- Favicon Icon -->
		<link rel="icon" type="image/png" href="images/fav.png">
		
		<!-- Stylesheets -->
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,500' rel='stylesheet'>
		<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
		<link href="css/vertical-responsive-menu1.min.css" rel="stylesheet">
		<link href="css/instructor-dashboard.css" rel="stylesheet">
		<link href="css/instructor-responsive.css" rel="stylesheet">
		<link href="css/night-mode.css" rel="stylesheet">
		<link href="css/jquery.mCustomScrollbar.min.css" rel="stylesheet">
		
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
AES256 aes256 = new AES256();
UserDAO userDAO = new UserDAO();
ChatDataDAO chatDAO = new ChatDataDAO();
ChatListDAO chatListDAO = new ChatListDAO();
DateCount date = new DateCount();
webSocket ws = new webSocket();

String userID=null;

if(session.getAttribute("userID")!=null)
	userID = (String) session.getAttribute("userID");
else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인이 필요합니다');");
	script.println("history.back()");
	script.println("</script>");
	script.close();
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
						<a href="courses.jsp" class="menu--link" title="Courses">
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
						<a href="messages.jsp" class="menu--link active" title="Messages">
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
<%
String toID="";
if(session.getAttribute("selChat")!=null)
	toID=(String)session.getAttribute("selChat");
ArrayList<ChatDataDTO> messages = new ArrayList<ChatDataDTO>();
if(chatDAO.getList(userID,toID)!=null)
	messages=chatDAO.getList(userID,toID);

ArrayList<ChatListDTO> chats = new ArrayList<ChatListDTO>();
if(chatListDAO.getList(userID)!=null)
	chats=chatListDAO.getList(userID);
%>
	<div class="wrapper">
		<div class="sa4d25">
			<div class="container-fluid">			
				<div class="row">
					<div class="col-lg-12">	
						<h2 class="st_title"><i class="uil uil-comments"></i> Messages</h2>
					</div>					
				</div>				
				<div class="row">
					<div class="col-12">
						<div class="all_msg_bg">
							<div class="row no-gutters">
								<div class="col-xl-4 col-lg-5 col-md-12">					
									<div class="msg_search">
										<div class="ui search focus">
											<div class="ui left icon input swdh11 swdh15">
												<input class="prompt srch_explore" id="addChatlist" type="text" placeholder="대화할 유저 이름을 입력하세요...">
												<i class="uil uil-search-alt icon icon8"></i>
											</div>
										</div>
									</div>
									<div class="simplebar-content-wrapper">
										<div class="group_messages" id="chatListField">
<%
	for(ChatListDTO a : chats) {
		String AuserName = userDAO.getUserName(a.getToID());
%>
											<div class="chat__message__dt active" data-name="<%=AuserName%>" data-chatID="<%=a.getChatID()%>">
												<div class="user-status">										
													<div class="user-avatar">
														<img src="./ProfileImages/<%=userDAO.getProfileImage(a.getToID())%>" alt="" onError="this.src='images/left-imgs/img-8.jpg'">
														<div class="msg__badge" ><%=a.getNews()%></div>
													</div>
													<p class="user-status-title"><span class="bold"><%=AuserName%></span></p>
													<p class="user-status-text">&nbsp;</p>
													<p class="user-status-time floaty"><%=date.date(a.getLastDate())%></p>
												</div>
											</div>
<%
	}
%>
										</div>
									</div>					
								</div>
								<div class="col-xl-8 col-lg-7 col-md-12" id="chatContainer">			
									<div class="chatbox_right" id="chatContainerHTML">
										<div class="chat_header">
											<div class="user-status">											
												<div class="user-avatar">
													<img src="./ProfileImages/<%=userDAO.getProfileImage(toID)%>" alt="">
												</div>
												<div id="userStatus">
													<div id="userStatusHTML">
														<p class="user-status-title"><span class="bold" id="toName"><%=userDAO.getUserName(toID)%></span></p>
														<%if(ws.userJoin(aes256.encrypt(toID))){%><p class="user-status-tag online">온라인</p><%}
														else { %>	<p class="user-status-tag offline">오프라인</p><%}%>
													</div>
												</div>
												<div class="user-status-time floaty eps_dots eps_dots5 more_dropdown">
													<a href="#"><i class="uil uil-ellipsis-h"></i></a>
													<div class="dropdown-content">
														<span id="listDelete"><i class="uil uil-trash-alt"></i>삭제</span>
														<!--<span><i class="uil uil-ban"></i>Block</span>
														<span><i class="uil uil-windsock"></i>Report</span>															
														<span><i class="uil uil-volume-mute"></i>Mute</span>-->
													 </div>																										
												</div>													
											</div>
										</div>
										<div class="messages-line simplebar-content-wrapper2 scrollstyle_4">											
											<div class="mCustomScrollbar" id="contentFieldParent">		
												<div id="contentField">
													<div id="contentFieldChild">
<%
if(session.getAttribute("selChat")!=null)
	toID=(String)session.getAttribute("selChat");
for(ChatDataDTO a : messages) {
	if(a.getUserID().equals(userID)) {
%>
												<div class="main-message-box ta-right" id="myText">
													<div class="message-dt row" style="float:right">
														<div class="message-inner-dt col-12">
															<p class="" style="width: auto"><%=a.getMessage()%></p>
														</div>
														<span class="col-12"><%=date.date(a.getLastDate())%></span>
													</div>
												</div>
<%
	} else {%>
												<div class="main-message-box st3" id="myText">
													<div class="message-dt st3 row">
														<div class="message-inner-dt col-12">
															<p class="" style="width: auto"><%=a.getMessage()%></p>
														</div><!--message-inner-dt end-->
														<span class="col-12"><%=date.date(a.getLastDate())%></span>
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
										<div class="message-send-area">
												<div class="mf-field">
													<div class="ui search focus input__msg">
														<div class="ui left icon input swdh19">
															<input class="prompt srch_explore" type="text" maxlength="256" id="chatInputField" placeholder="보낼 메시지를 적으세요.. ( 최대 256 글자 )">
														</div>
													</div>
													<button class="add_msg" id="sendBtn"><i class="uil uil-message"></i></button>
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
	<script src="js/jquery.mCustomScrollbar.js"></script>
	
	<script>
	var webSocket = new WebSocket("ws://localhost:8080/CRUVE/userChat");
	var messageTextArea = $("#contentField");
	// 접속이 완료되면
	webSocket.onopen = function(message) {
	// 콘솔에 메시지를 남긴다.
		messageTextArea.value += "Server connect...\n";
		webSocket.send('<%=aes256.encrypt(userID)%>'+'{Vencoder}'+'!@#ID#@!');
	};
	webSocket.onclose = function(message) {
		console.log(message+"");
	};
		
	webSocket.onerror = function(message) {
		messageTextArea.value += "error...\n";
	};
	
	// 서버로부터 메시지가 도착하면 콘솔 화면에 메시지를 남긴다.
	webSocket.onmessage = function(message) {
		$(messageTextArea).append( '<div class="main-message-box st3" id="myText"><div class="message-dt st3 row"><div class="message-inner-dt col-12"><p class="" style="width: auto">'+message.data+'</p><span class="col-12"></div></div></div>' );
	};
	
	const Toast = Swal.mixin({ 
		toast: true, position: 'bottom', 
		showConfirmButton: false, timer: 1300,
		timerProgressBar: true, 
		didOpen: (toast) => { toast.addEventListener('mouseenter', Swal.stopTimer) 
			toast.addEventListener('mouseleave', Swal.resumeTimer) } 
		});
	
	var userID='<%=aes256.encrypt(userID)%>';
	var thisElement = null;
	
	$(function() {
		$(document).on('click','.chat__message__dt',function(e) {
			thisElement = $(this);
			$.ajax({
	            type:'POST',
	            async:false,
	            url:'http://localhost:8080/CRUVE/aesEn',
	            dataType:'text',
	            data:{'name':$(this).attr('data-name')},
	            success: function(data, textStatus) {
	            	messageTextArea = $("#contentField");
	            	userID=data;
	            	$('.chat__message__dt').removeClass('active');
	            	thisElement.addClass('active');
	            	document.getElementById('toName').innerText=''+thisElement.attr('data-name');
	            	$('#contentField').load(window.location.href + " #contentFieldChild");
	            	$('#userStatus').load(window.location.href + " #userStatusHTML");
	            },
	            error:function (data, textStatus) {
	                console.log('Err'+data);
	            }
	        })    //ajax
		})
	})
	
	 $(function() {
		$(document).on('click','#sendBtn',function(e) {
			let message = document.getElementById("chatInputField");
			$(messageTextArea).append( '<div class="main-message-box ta-right"><div class="message-dt row" style="float:right"><div class="message-inner-dt col-12"><p class="" style="width: auto">'+message.value+'</p></div><span class="col-12"></div></div>' );
			if(userID)
				webSocket.send(userID+'{Vencoder}'+message.value<%if(!ws.userJoin(aes256.encrypt(toID))){%>+'<%=aes256.encrypt("PIZZA")%><%=aes256.encrypt(userID)%>'<%}%>);
			else
				console.log(userID+'|560번줄 에러');
			message.value = "";
		})
	})
	
	$(function() {
    	$('#addChatlist').keydown(function(e) {
    		console.log('키다운');
        	if (e.keyCode == 13) {
        		var value=$(this).val();
            	$.ajax({
            			type:'GET',
            			async:false,
            			url:'http://localhost:8080/CRUVE/addChatList',
        	            dataType:'text',
        	            data:{'toName':value},
        	            success: function(data, textStatus) {
        	            	if(data.indexOf('success')!=-1) {
        	            		$('#chatListField').append( '<div class="chat__message__dt" data-name="'+value+'"><div class="user-status"><div class="user-avatar"><img src="images/left-imgs/img-1.jpg" alt=""><div class="msg__badge" >0</div></div><p class="user-status-title"><span class="bold">'+value+'</span></p><p class="user-status-text">&nbsp;</p><p class="user-status-time floaty">대화기록 없음</p></div></div>');
        	            		Toast.fire({ icon: 'success', 
        	            		    title: '정상적으로 대화방이 추가되었습니다.' })
        	            	} else {
        	            		Toast.fire({ icon: 'error', 
        	            		    title: data })
        	            	}
        	            },
        	            error:function (data, textStatus) {
        	                console.log('Err'+data);
        	            }
            	})
            }
    	});
    });

	$(function() {
		$(document).on('click','#listDelete',function(e) {
			$.ajax({
    			type:'POST',
    			async:false,
    			url:'http://localhost:8080/CRUVE/deleteChatList',
	            dataType:'text',
	            data:{'chatID':$(thisElement).attr('data-chatID')},
	            success: function(data, textStatus) {
	            	if(data.indexOf('error')!=-1) {
	            		console.log(value+'');
	            		Toast.fire({ icon: 'error', 
	            		    title: '삭제를 하던중, 오류가 발생했습니다.' })
	            	} else {
	            		$('div[data-chatID='+$(thisElement).attr('data-chatID')+']').remove();
	            	}
	            },
	            error:function (data, textStatus) {
	                console.log('Err'+data);
	            }
    		})
		});
	})
	</script>
			
</body>
</html>
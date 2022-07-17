<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.Address" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="java.util.Properties" %>
<%@ page import="util.Gmail" %>
<%@ page import="java.util.regex.Pattern" %>

<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>

	<head>
		<meta charset="utf-8">		
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">
		<title>CRIVE</title>
		
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
	request.setCharacterEncoding("UTF-8");

	String userName=null;
	String userID=null;
	String userPassword=null;
	String userEmail=null;
	
	int Result=0;
	int Result1=0;
	
	if(request.getParameter("name")!=null)
		userName = request.getParameter("name");
	if(request.getParameter("id")!=null)
		userID = request.getParameter("id");
	if(request.getParameter("password")!=null)
		userPassword = request.getParameter("password");
	if(request.getParameter("email")!=null)
		userEmail = request.getParameter("email");
	
	if(userName==null||userID==null||userPassword==null||userEmail==null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	if(userName.length()>16 || userID.length()>32 || userPassword.length()>48) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비정상적인 접근입니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	if(!Pattern.matches("^[가-힣a-zA-Z0-9]*$",userName)) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 입력 형식에 맞지 않습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	SHA256 sha256 = new SHA256();
	
	Result = userDAO.userJoinCheckID(userID);
	if(Result == 1) {
		Result1 = userDAO.userJoinCheckName(userName);
		if(Result1 == 1) {
			Result=0;
			Result1=0;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("err=1");
			script.println("location.href='sign_up.jsp?err1=1';");
			script.println("</script>");
			script.close();
			return;
		}
	} else {
		Result1 = userDAO.userJoinCheckName(userName);
		if(Result1 == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("err=2");
			script.println("location.href='sign_up.jsp?err=1';");
			script.println("</script>");
			script.close();
			return;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("err=3");
			script.println("location.href='sign_up.jsp?err=1&err1=1';");
			script.println("</script>");
			script.close();
			return;
		}
	}
	
	Result = userDAO.userJoin(new UserDTO(userName,userID,userPassword,null,userEmail,sha256.getSHA256(userEmail),null,null,null,false,null,null,null,null));
	
	if(Result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('동일한 ID 또는 이름이 존재합니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	boolean emailChecked = userDAO.getUserEmailChecked(userID); //이메일 체크 확인
	if(emailChecked == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>"); //java script 구문 실행
		script.println("alert('이미 이메일 인증을 하셨습니다.');");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
	}
	
	session.setAttribute("userID", userID);
	
	String host = "http://localhost:8080/CRUVE/"; //현재 웹사이트 주소
	String from = "VencoderEM@gmail.com"; 
	String to = userDAO.getUserEmail(userID);
	String subject = "Curve 이메일 인증 메일입니다.";
	String content = "링크에 접속하여 이메일 인증을 진행하세요" +
		"<a href='"+host+"emailCheck.jsp?code="+new SHA256().getSHA256(to)+"'>이메일 인증하기</a>";
	
		//실제로 SMTP에 접속할 정보를 넣기위해
	Properties p = new Properties();
	p.put("mail.smtp.user",from);
	p.put("mail.smtp.host","smtp.googlemail.com");
	p.put("mail.smtp.port","465");
	p.put("mail.smtp.starttls.enable","true");
	p.put("mail.smtp.auth","true");
	p.put("mail.smtp.debug","true");
	p.put("mail.smtp.socketFactory.port","465");
	p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback","false");
    p.put("mail.smtp.connectiontimeout", "t1");
    p.put("mail.smtp.timeout", "t2");
	
	try {
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content,"text/html;charset=UTF8");
		Transport.send(msg);
	} catch (Exception e) {
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("history.back();)");
		script.println("</script>");
		script.close();
		return;
	}
%>
	<!-- Header Start -->
	<header class="header clearfix">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="ml_item">
						<div class="main_logo main_logo15" id="logo">
							<a href="index.jsp"><img src="images/logo.svg" alt=""></a>
							<a href="index.jsp"><img class="logo-inverse" src="images/ct_logo.svg" alt=""></a>
						</div>				
					</div>				
					<div class="header_right pr-0">
						<ul>				
							<li class="ui top right pointing dropdown">
								<a href="" class="opts_account">
									<img src="images/hd_dp.jpg" alt="">
								</a>
								<div class="menu dropdown_account">
									<div class="channel_my">
										<div class="profile_link">
											<img src="images/hd_dp.jpg" alt="">
											<div class="pd_content">
												<div class="rhte85">
													<h6>계정 생성중입니다</h6>
												</div>
											</div>							
										</div>
									</div>
									<div class="night_mode_switch__btn">
										<a href="#" id="night-mode" class="btn-night-mode">
											<i class="uil uil-moon"></i> Night mode
											<span class="btn-night-mode-switch">
												<span class="uk-switch-button"></span>
											</span>
										</a>
									</div>					
									<a href="setting.jsp" class="item channel_item">이메일 인증 건너뛰기</a>
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
		<div class="faq1256">
			<div class="container">
				<div class="row justify-content-md-center">					
					<div class="col-md-6">
						<div class="certi_form rght1528">
							<div class="test_result_bg">
								<ul class="test_result_left">
									<li>
										<div class="result_dt">
											<i class=""></i>
										</div>
									</li>
									<li>
									</li>
								</ul>
								<div class="result_content" style="margin-top:50px" id="result">
									<div id="resultHTML">
										<h2>이메일 인증이 필요합니다.</h2>
										<p>"<%=userEmail%>" 으로 이메일 인증 링크를 보냈습니다.</p>
										<%if(userDAO.getUserEmailChecked(userID)) {%><a href="setting.jsp" class="download_btn">이미 인증하셨습니다.</a><%} else{%>
										<a href="setting.jsp" class="download_btn">다음</a><%}%>
									</div>
								</div>
							</div>
						</div>
					</div>			
				</div>
			</div>
		</div>
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
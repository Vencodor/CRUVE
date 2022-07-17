<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.AES256_1" %>

<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>
<%


	if(request.getParameter("Logout")!=null)
	{
		session.removeValue("userID");
		
		Cookie[] login = request.getCookies(); //쿠키제거
	    if(login!=null){
	        for(Cookie tempCookie : login){
	            if(tempCookie.getName().equals("userID")){
	                tempCookie.setMaxAge(0);
	                tempCookie.setPath("/");
	                response.addCookie(tempCookie);
	            }
	        }
	    }
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = document.referrer;");
		script.println("</script>");
		script.close();
	}
%>
	<head>
		<meta charset="utf-8">		
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">
		<title>Curve - Sign In</title>
		
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
	<!-- Signup Start -->
	<div class="sign_in_up_bg">
		<div class="container">
			<div class="row justify-content-lg-center justify-content-md-center">
				<div class="col-lg-12">
					<div class="main_logo25" id="logo">
						<a href="index.jsp"><img src="images/logo.svg" alt=""></a>
						<a href="index.jsp"><img class="logo-inverse" src="images/ct_logo.svg" alt=""></a>
					</div>
				</div>
			
				<div class="col-lg-6 col-md-8">
					<div class="sign_form">
						<h2>돌아오신 것을 환영합니다!</h2>
						<p>이메일을 통해 로그인을 해주세요.</p>
						<button class="social_lnk_btn color_btn_fb"><i class="uil uil-facebook-f"></i>Facebook</button>
						<button class="social_lnk_btn mt-15 color_btn_tw"><i class="uil uil-twitter"></i>Twitter</button>
						<button class="social_lnk_btn mt-15 color_btn_go"><i class="uil uil-google"></i>Google</button>
							<div class="ui search focus mt-15">
								<div class="ui left icon input swdh95">
									<input class="prompt srch_explore" type="text" name="id" value="" id="id" required="" maxlength="64" placeholder="ID Address">															
									<i class="uil uil-user icon icon2"></i>
								</div>
							</div>
							<div class="ui search focus mt-15">
								<div class="ui left icon input swdh95">
								<input class="prompt srch_explore" type="password" name="password" value="" id="password" required="" maxlength="64" placeholder="Password">
									<i class="uil uil-key-skeleton-alt icon icon2"></i>
								</div>
							</div>
							<div class="ui form mt-30 checkbox_sign">
								<div class="inline field">
									<div class="ui checkbox mncheck">
										<input type="checkbox" tabindex="0" name="autoLogin" id="auto" value="auto" class="hidden">
										<label>자동 로그인</label>
									</div>
								</div>
							</div>
    						<span id="alert-danger-1" style="display: none; color: #d92742;">비밀번호 또는 아이디가 일치하지 않습니다.</span>
							<button class="login-btn" id="sign_in" type="">Sign In</button>
						<p class="sgntrm145">비밀번호를 잃어버리셨나요? <a href="forgot_password.jsp">비밀번호 찾기</a>.</p>
						<p class="mb-0 mt-30 hvsng145">계정이 없으신가요? <a href="sign_up.jsp">회원가입</a></p>
					</div>
					<div class="sign_footer"><img src="images/sign_logo.png" alt="">© 2020 <strong>Cursus</strong>. All Rights Reserved.</div>
				</div>				
			</div>				
		</div>				
	</div>
	<!-- Signup End -->	

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/semantic/semantic.min.js"></script>
	<script src="js/custom.js"></script>	
	<script src="js/night-mode.js"></script>
	
	<script>
		$('.input').focusout(function () {
			$('#alert-danger-1').css('display','none');
			//$(signBtn).attr('disabled',true);
		})
	
		$(function() {
			var signBtn = document.getElementById('sign_in');
			$(signBtn).on('click', () => {
		        $.ajax({
		            type:'POST',
		            async:false, //false가 기본값임 - 비동기
		            url:'http://localhost:8080/CRUVE/login',
		            dataType:'text',
		            data:{'id':$('#id').val(),'password':$('#password').val(),'auto':$('#auto').is(":checked")},
		            success: function(data, textStatus) {
		                if(data.indexOf("true")!=-1) {  
		                	location.href='index.jsp';
		                } else if(data.indexOf("false")!=-1) {
		                	$('#alert-danger-1').css('display','inline-block');
		                	//$(signBtn).attr('disabled',false);
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
	
</body>
</html>
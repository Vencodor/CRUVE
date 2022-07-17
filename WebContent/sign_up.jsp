<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>

	<head>
		<meta charset="utf-8">		
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">
		<title>Cursus - Sign Up</title>
		
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

	int err = 0;
	int err1 = 0;
	
	if(request.getParameter("err")!=null)
		err = Integer.parseInt(request.getParameter("err"));
	
	if(request.getParameter("err1")!=null)
		err1 = Integer.parseInt(request.getParameter("err1"));

	if(session.getAttribute("userID")!=null)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인을 하셨기에 접근이 불가합니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
%>
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
						<h2>오신것을 환영합니다.</h2>
						<p>회원가입을 한 뒤, 거래를 시작하세요!</p>
						<form action="sign_up_email.jsp" method="post">
							<div class="ui search focus">
								<div class="ui left icon input swdh11 swdh19">
									<input class="prompt srch_explore userName" type="text" name="name" value="" id="userName" required="" maxlength="16" placeholder="이름">															
								</div>
								<%if(err1==1) {%>				<span id="alert-danger-name" style="color: #d92742; display: inline-block;">동일한 이름이 존재합니다.</span><%}%>
								<div id="alert-name" style="color: #d92742; display: none;">동일한 이름이 존재합니다.</div>
								<div id="alert-name-pattern" style="color: #d92742; display: none;">한글 , 영어 또는 숫자만 사용 가능합니다.</div>
							</div>
							<div class="ui search focus mt-15">
								<div class="ui left icon input swdh11 swdh19">
									<input class="prompt srch_explore userID" type="text" name="id" value="" id="userID" required="" maxlength="32" placeholder="아이디">															
								</div>
								<%if(err==1) {%>				<span id="alert-danger-id" style="color: #d92742;  display: inline-block;">동일한 ID가 존재합니다.</span><%}%>
								<div id="alert-id" style="color: #d92742;  display: none;">동일한 ID가 존재합니다.</div>
							</div>
							<div class="ui search focus mt-15">
								<div class="ui left icon input swdh11 swdh19">
									<input class="prompt srch_explore" type="email" name="email" value="" id="email" required="" maxlength="64" placeholder="이메일">															
								</div>
							</div>
							<div class="ui search focus mt-15">
								<div class="ui left icon input swdh11 swdh19">
									<input class="prompt srch_explore pw" type="password" name="password" value="" id="password" required="" maxlength="64" placeholder="비밀번호">															
								</div>
							</div>
							<div class="ui search focus mt-15">
								<div class="ui left icon input swdh11 swdh19">
									<input class="prompt srch_explore pw mb-2" type="password" name="" value="" id="password2" required="" maxlength="48" placeholder="비밀번호 재확인">															
								</div>
								<span id="alert-success" style="display: none; color: green">비밀번호가 일치합니다.</span>
    							<span id="alert-danger-1" style="display: none; color: #d92742;">비밀번호가 일치하지 않습니다.</span>
    							<span id="alert-danger-2" style="display: none; color: #d92742;">8 ~ 48자리 이내로 입력 해주세요.</span>
    							<span id="alert-danger-3" style="display: none; color: #d92742;">비밀번호에는 공백없이 입력 해주세요.</span>
    							<span id="alert-danger-4" style="display: none; color: #d92742;">영문, 숫자를 혼합하여 입력해주세요.</span>
							</div>
							<div class="ui form mt-30 checkbox_sign">
								<div class="inline field">
									<div class="ui checkbox mncheck">
										<input type="checkbox" tabindex="0" class="hidden">
										<label>개인정보 수집이용에 동의 하십니까?</label>
									</div>
								</div>
							</div>
							<button class="login-btn" type="submit" id="next">다음</button>
						</form>
						<p class="sgntrm145">가입하면 <a href="terms_of_use.jsp">이용약관</a> 및 <a href="terms_of_use.jsp">개인 정보 보호 정책</a>에 동의하게 됩니다.</p>
						<p class="mb-0 mt-30">이미 계정이 있습니까? <a href="sign_in.jsp">로그인</a></p>
					</div>
					<div class="sign_footer"><img src="images/sign_logo.png" alt="">© 2021 <strong>CRUVE</strong>. All Rights Reserved.</div>
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
    $('.pw').focusout(function () {
        var pwd1 = $("#password").val();
        var pwd2 = $("#password2").val();
        
        var num = pwd1.search(/[0-9]/g);
        var eng = pwd1.search(/[a-z]/ig)
 
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
            	$("#alert-success").css('display', 'none');
                $("#alert-danger-1").css('display', 'none');
                $("#alert-danger-2").css('display', 'none');
                $("#alert-danger-3").css('display', 'none');
                $("#alert-danger-4").css('display', 'none');

                if(pwd1.length < 6 || pwd1.length > 48){
                	$("#alert-danger-2").css('display', 'inline-block');
                }else if(pwd1.search(/\s/) != -1){
                	$("#alert-danger-3").css('display', 'inline-block');
                }else if(num < 0 || eng < 0){
                	$("#alert-danger-4").css('display', 'inline-block');
                }else {
                    $("#alert-success").css('display', 'inline-block');
                    $("#next").attr("disabled",false);
                }
                
            } else {
                $("#alert-success").css('display', 'none');
                $("#alert-danger-1").css('display', 'inline-block');
                $("#alert-danger-2").css('display', 'none');
                $("#alert-danger-3").css('display', 'none');
                $("#alert-danger-4").css('display', 'none');
                $("#next").attr("disabled",true);
            }
        }
    });
    
    $('.userName').focusout(function () {
        $("#alert-danger-name").css('display','none');
    });
    
    $('.userID').focusout(function () {
        $("#alert-danger-id").css('display','none');
    });
	</script>
	
	<script>
    $('input').focusout(function () {
    	$.ajax({
			type:'POST',
			async:false,
			url:'http://localhost:8080/CRUVE/registerCheck',
            dataType:'text',
            data:{'name':$('#userName').val(),'id':$('#userID').val(),'email':$('#email').val()},
            success: function(data, textStatus) {
            	if(data.indexOf('err=1')!=-1) {
            		$('#alert-name').show();
            		$('#alert-id').hide();
            	} else if(data.indexOf('err=2')!=-1){
            		$('#alert-id').show();
            		$('#alert-name').hide();
            	} else if(data.indexOf('err=3')!=-1) {
            		$('#alert-id').show();
            		$('#alert-name').show();
            	} else {
            		$('#alert-id').hide();
            		$('#alert-name').hide();
            	}
            },
            error:function (data, textStatus) {
                console.log('Err'+data);
            }
		})
		
		var pattern = /^[가-힣a-zA-Z0-9]*$/;    //한글과 영어만
    	if(!pattern.test( $("#userName").val() )){
    	  $("#alert-name-pattern").show();
    	}else{
    		$("#alert-name-pattern").hide();
    	}
		
    });
    
    $('.userName').focusout(function () {
        $("#alert-danger-name").css('display','none');
    });
    
    $('.userID').focusout(function () {
        $("#alert-danger-id").css('display','none');
    });
	</script>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.UserDAO" %>
<%@ page import="commodity.CommodityDAO" %>
<%@ page import="commodity.CommodityDTO" %>
<%@ page import="util.AES128" %>

<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>

	<head>
		<meta charset="utf-8">		
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="description" content="Gambolthemes">
		<meta name="author" content="Gambolthemes">
		<title>Cursus - Shopping Cart</title>
		
		<!-- Favicon Icon -->
		<link rel="icon" type="image/png" href="images/fav.png">
		
		<!-- Stylesheets -->
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,500' rel='stylesheet'>
		<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
		<link href="css/vertical-responsive-menu.min.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<link href="css/responsive.css" rel="stylesheet">
		<link href="css/night-mode.css" rel="stylesheet">
		
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		
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
	int totalPrice=0;	
	if(session.getAttribute("userID")!=null)
		userID=(String)session.getAttribute("userID");
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='sign_in.jsp';");
		script.println("</script>");
		script.close();
	}
	
	CommodityDAO commodityDAO = new CommodityDAO();
	UserDAO userDAO = new UserDAO();
	AES128 aes = new AES128();
%>
	<!-- Header Start -->
	<header class="header clearfix">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="back_link">
						<a href="index.jsp" class="hde151">홈으로</a>
						<a href="index.jsp" class="hde152">Back</a>
					</div>
					<div class="ml_item">
						<div class="main_logo main_logo15" id="logo">
							<a href="index.jsp"><img src="images/logo.svg" alt=""></a>
							<a href="index.jsp"><img class="logo-inverse" src="images/ct_logo.svg" alt=""></a>
						</div>				
					</div>				
					<div class="header_right pr-0">
						<ul>				
							<li class="ui top right pointing dropdown">
								<a href="#" class="opts_account">
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
									<a href="dashboard.jsp" class="item channel_item">Cursus Dashboard</a>						
									<a href="sign_in.jsp" class="item channel_item">Sign Out</a>
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
		<div class="_215b15">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">						
						<div class="title125">						
							<div class="titleleft">					
								<div class="ttl121">
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
											<li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
										</ol>
									</nav>
								</div>
							</div>
						</div>
						<div class="title126">	
							<h2>장바구니</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mb4d25" id="cartContainer">
			<div class="container" id="cartContainerHTML">			
				<div class="row">
					<div class="col-lg-6">
<%
	ArrayList<Integer> list=null;
	int listSize=0;
	try {
		list = (ArrayList)session.getAttribute("cart");
		listSize = list.size();
	}catch(Exception e) {}
		for(int i=0; i<listSize; i++) {
			if(list.get(i)==0||list.get(i)==null)
				continue;
			CommodityDTO written = commodityDAO.getWritten(list.get(i));
			totalPrice=totalPrice+written.getPrice();
			String writtenID = aes.encrypt(written.getWrittenID());
%>
						<div class="fcrse_1">
							<a href="detail_view.jsp?ID=<%=writtenID%>" class="hf_img">
								<img class="cart_img ml-5" src="<%="./CoverImage/"+written.getCoverImage()%>" style="height:130px; width:130px;">
							</a>
							<div class="hs_content">
								<div class="eps_dots eps_dots10 more_dropdown">
									<a class="removeCart" id="<%=aes.encrypt(written.getWrittenID()*-1)%>"><i class='uil uil-times'></i></a>																										
								</div>
								<a href="detail_view.jsp?ID=<%=writtenID%>" class="crse14s title900 pt-2"><%=written.getTitle()%></a>
								<a href="#" class="crse-cate"><%=written.getCategory()%> | <%=written.getSubcategory()%></a>
								<div class="auth1lnkprce">
									<p class="cr1fot">By <a href="#"><%=userDAO.getUserName(written.getUserID())%></a></p>
									<div class="prce142"><%=written.getPrice()%>원</div>
								</div>
							</div>
						</div>	
<%
		}
%>	
					</div>
					<div class="col-lg-1"><section></section></div>
					<div class="col-lg-5">
						<div class="membership_chk_bg rght1528">
								<div class="checkout_title">
									<h4>Total</h4>
									<img src="images/line.svg" alt="">
								</div>
								<div class="order_dt_section">
									<div class="order_title">
										<h4>원 가격</h4>
										<div class="order_price"><%=totalPrice%>원</div>
									</div>
									<div class="order_title">
										<h6>추가 계산</h6>
										<div class="order_price">$5</div>
									</div>
									<div class="order_title">
										<h2>총 가격</h2>
										<div class="order_price5"><%=totalPrice%>원</div>
									</div>
									<div class="coupon_code">
										<p>Learn now is applied.</p>
										<div class="coupon_input">
											<div class="ui search focus mt-15">
												<div class="ui left icon input swdh11 swdh19">
													<input class="prompt srch_explore" type="text" name="couponcode" value="" id="id_coupon_code" required="" maxlength="6" placeholder="Enter Coupon Code">
												</div>
												<button class="code-apply-btn" type="submit">Apply</button>
											</div>
										</div>
									</div>
									<a href="#" class="chck-btn22">Checkout Now</a>
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

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/semantic/semantic.min.js"></script>
	<script src="js/custom.js"></script>	
	<script src="js/night-mode.js"></script>	
	
	<script>
	const Toast = Swal.mixin({ 
		toast: true, position: 'bottom', 
		showConfirmButton: false, timer: 1300,
		timerProgressBar: true, 
		didOpen: (toast) => { toast.addEventListener('mouseenter', Swal.stopTimer) 
			toast.addEventListener('mouseleave', Swal.resumeTimer) } 
		})
	</script>
	
	<script>
	
	$(function() {
		$(document).on('click','.removeCart',function(e) {
	        $.ajax({
	            type:'GET',
	            async:false, //false가 기본값임 - 비동기
	            url:'http://localhost:8080/CRUVE/addCart',
	            dataType:'text',
	            data:{'ID':$(this).attr('id')},
	            success: function(data, textStatus) {
		        	Toast.fire({ icon: 'success',
		            		title: '성공적으로 장바구니 상품을 제거하셨습니다!'})
		           	$("#cartContainer").load(window.location.href + " #cartContainerHTML");
	            },
	            error:function (data, textStatus) {
	                console.log('cartErr'+data);
	            }
	        })    //ajax
	
	    })
	})
	</script>
	
	
</body>
</html>
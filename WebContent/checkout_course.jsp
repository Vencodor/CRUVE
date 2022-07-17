<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="commodity.CommodityDAO"%>
<%@ page import="commodity.CommodityDTO"%>
<%@ page import="util.AES256"%>
<%@ page import="util.AES128" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="userPayInfo.UserPayInfoDAO"%>
<%@ page import="userPayInfo.UserPayInfoDTO"%>

<!DOCTYPE html>
<html lang="en" <%if(session.getAttribute("mode")!=null){if((Boolean)session.getAttribute("mode")==true) {%>class=" night-mode"<%}}%>>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, shrink-to-fit=9">
<meta name="description" content="Gambolthemes">
<meta name="author" content="Gambolthemes">
<title>Cursus - Checkout</title>

<!-- Favicon Icon -->
<link rel="icon" type="image/png" href="images/fav.png">

<!-- Stylesheets -->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,500'
	rel='stylesheet'>
<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
<link href="css/vertical-responsive-menu.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/night-mode.css" rel="stylesheet">

<!-- Vendor Stylesheets -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
<link href="vendor/OwlCarousel/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="vendor/semantic/semantic.min.css">

</head>

<body>

	<%
		int writtenID = 0;
		String aesID = null;

	String userID = null;

	CommodityDAO commodityDAO = new CommodityDAO();
	UserDAO userDAO = new UserDAO();
	AES128 aes = new AES128();
	UserPayInfoDAO userPayInfo = new UserPayInfoDAO();

	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}

	if (request.getParameter("ID") != null) {
		try {
			aesID = request.getParameter("ID");
			writtenID = Integer.parseInt(aes.decrypt(aesID));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	CommodityDTO written = commodityDAO.getWritten(writtenID);
	%>

	<!-- Header Start -->
	<header class="header clearfix">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="back_link">
						<a href="index.jsp" class="hde151">Back To Home</a> <a
							href="index.jsp" class="hde152">Back</a>
					</div>
					<div class="ml_item">
						<div class="main_logo main_logo15" id="logo">
							<a href="index.jsp"><img src="images/logo.svg" alt=""></a>
							<a href="index.jsp"><img class="logo-inverse"
								src="images/ct_logo.svg" alt=""></a>
						</div>
					</div>
					<div class="header_right pr-0">
						<ul>
							<li class="ui top right pointing dropdown"><a href="#"
								class="opts_account"> <img src="images/hd_dp.jpg" alt="">
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
										<a href="my_instructor_profile_view.jsp" class="dp_link_12">View
											Instructor Profile</a>
									</div>
									<div class="night_mode_switch__btn">
										<a href="#" id="night-mode" class="btn-night-mode"> <i
											class="uil uil-moon"></i> Night mode <span
											class="btn-night-mode-switch"> <span
												class="uk-switch-button"></span>
										</span>
										</a>
									</div>
									<a href="dashboard.jsp" class="item channel_item">Cursus
										Dashboard</a> <a href="sign_in.jsp" class="item channel_item">Sign
										Out</a>
								</div></li>
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
											<li class="breadcrumb-item"><a
												href="detail_view.jsp?ID=<%=written.getWrittenID()%>"><%=written.getTitle()%></a></li>
											<li class="breadcrumb-item active" aria-current="page">Payment</li>
										</ol>
									</nav>
								</div>
							</div>
						</div>
						<div class="title126">
							<h2>Payment</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mb4d25">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
						<div class="membership_chk_bg">
							<div class="checkout_title">
								<h4>
									필독사항<span style="color: grey; font-size: 10px"> 해당 글은 상품
										작성자가 직접 작성한 글입니다.</span>
								</h4>
								<img src="images/line.svg" alt="">
							</div>
							<div class="panel-group" id="accordion" role="tablist"
								aria-multiselectable="true">
								<div class="panel panel-default">
									<%=written.getBuyerDescription()%>
								</div>
							</div>
							<div class="address_text"></div>
						</div>
						<div class="membership_chk_bg">
							<div class="checkout_title">
								<h4>결제 세부 정보</h4>
								<img src="images/line.svg" alt="">
							</div>
							<%
								UserPayInfoDTO payInfo = null;
							try {
								payInfo = userPayInfo.getInfo(userID);
							} catch (Exception e) {
							}
							%>
							<div class="panel-group" id="accordion" role="tablist"
								aria-multiselectable="true">
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="address1">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse"
												data-parent="#accordion" href="#collapseaddress1"
												aria-expanded="false" aria-controls="collapseaddress1">
												구매자 정보* <%
												if (payInfo == null) {
											%><div
													style="color: red; font-size: 18px">입력이 필요합니다.</div>
												<%
													}
												%>
											</a>
										</div>
									</div>
									<div id="collapseaddress1" class="panel-collapse collapse"
										role="tabpanel" aria-labelledby="address1">
										<div class="panel-body">
											<form action="userPayInfoSave.jsp" method="post">
												<div class="row">
													<div class="col-lg-6">
														<div class="ui search focus mt-30 lbel25">
															<label>닉네임*</label>
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text"
																	name="name"
																	value="<%if (payInfo != null) {%><%=userDAO.getUserName(userID)%><%}%>"
																	id="id_name" required="" maxlength="64"
																	placeholder="Nick Name" disabled="">
															</div>
														</div>
													</div>
													<div class="col-lg-12">
														<div class="ui search focus mt-30 lbel25">
															<label>전화번호*</label>
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="number"
																	name="phone"
																	value="<%if (payInfo != null) {%><%=payInfo.getPayPhoneNumber()%><%}%>"
																	id="id_academy" required="" maxlength="13"
																	placeholder="Phone Number">
															</div>
														</div>
													</div>
													<div class="col-lg-12">
														<div class="ui search focus mt-30 lbel25">
															<label>영수증 출력 이메일*</label>
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="email"
																	name="email"
																	value="<%if (payInfo != null) {%><%=payInfo.getPayEmail()%><%}%>"
																	id="id_academy" required="" maxlength="64"
																	placeholder="Email">
															</div>
															<div class="help-block">이메일을 정확히 입력 해주시기 바랍니다. 이메일
																오타로 생긴 피해복구는 불가능 합니다</div>
														</div>
													</div>
													<div class="col-lg-6">
														<button class="save_address_btn" type="submit">저장</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<div class="address_text">
								<%
									if (payInfo != null) {
								%>
								<%=userDAO.getUserName(payInfo.getUserID())%><br>
								<%=payInfo.getPayPhoneNumber()%><br>
								<%=payInfo.getPayEmail()%>
								<%
									}
								%>
							</div>
						</div>
						<div class="membership_chk_bg">
							<div class="checkout_title">
								<h4>결제방법 선택</h4>
								<img src="images/line.svg" alt="">
							</div>
							<div class="checkout-tabs">
								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item"><a href="#credit-method-tab"
										id="credit-tab" class="nav-link active" data-toggle="tab"><i
											class="uil uil-card-atm check_icon5"></i>Credit/Debit Card</a></li>
									<li class="nav-item"><a href="#bank-method-tab"
										id="bank-tab" class="nav-link" data-toggle="tab"><i
											class="uil uil-university check_icon5"></i>Bank Transfer</a></li>
									<li class="nav-item"><a href="#payapl-method-tab"
										id="payapl-tab" class="nav-link" data-toggle="tab"><i
											class="uil uil-paypal check_icon5"></i>Paypal</a></li>
								</ul>
							</div>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="credit-method-tab"
									role="tabpanel" aria-labelledby="credit-tab">
									<form>
										<div class="row">
											<div class="col-md-6">
												<div class="ui search focus mt-30 lbel25">
													<label>Holder Name</label>
													<div class="ui left icon input swdh11 swdh19">
														<input class="prompt srch_explore" type="text"
															name="holder[name]" value="" id="id_holdername"
															required="" maxlength="64"
															placeholder="Enter Holder Name">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="ui search focus mt-30 lbel25">
													<label>Card Number</label>
													<div class="ui left icon input swdh11 swdh19">
														<input class="prompt srch_explore" type="text"
															name="card[number]" maxlength="16" placeholder="Card #">
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="lbel25 mt-30">
													<label>Expiration Month</label> <select
														class="ui hj145 dropdown cntry152 prompt srch_explore"
														name="card[expire-month]">
														<option value="">Month</option>
														<option value="1">January</option>
														<option value="2">February</option>
														<option value="3">March</option>
														<option value="4">April</option>
														<option value="5">May</option>
														<option value="6">June</option>
														<option value="7">July</option>
														<option value="8">August</option>
														<option value="9">September</option>
														<option value="10">October</option>
														<option value="11">November</option>
														<option value="12">December</option>
													</select>
												</div>
											</div>
											<div class="col-md-4">
												<div class="ui search focus mt-30 lbel25">
													<label>Expiration Year</label>
													<div class="ui left icon input swdh11 swdh19">
														<input class="prompt srch_explore" type="text"
															name="card[expire-year]" maxlength="4" placeholder="Year">
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="ui search focus mt-30 lbel25">
													<label>Expiration Year</label>
													<div class="ui left icon input swdh11 swdh19">
														<input class="prompt srch_explore" type="text"
															name="card[cvc]" maxlength="3" placeholder="CVC">
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="tab-pane fade" id="bank-method-tab" role="tabpanel"
									aria-labelledby="bank-tab">
									<form>
										<div class="row">
											<div class="col-md-6">
												<div class="ui search focus mt-30 lbel25">
													<label>Account Holder Name</label>
													<div class="ui left icon input swdh11 swdh19">
														<input class="prompt srch_explore" type="text"
															name="account[holdername}" value="" required=""
															maxlength="64" placeholder="Enter Your Full Name">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="ui search focus mt-30 lbel25">
													<label>Account Number</label>
													<div class="ui left icon input swdh11 swdh19">
														<input class="prompt srch_explore" type="text"
															name="Account[number]" maxlength="10"
															placeholder="Enter Account Number">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="lbel25 mt-30">
													<label>Bank Name</label> <select
														class="ui hj145 dropdown cntry152 prompt srch_explore"
														name="Bank[name]">
														<option value="">State Bank of India</option>
														<option value="1">Indian Bank</option>
														<option value="2">ICICI Bank</option>
														<option value="3">HDFC Bank</option>
														<option value="4">Yes Bank</option>
														<option value="5">Oriental Bank</option>
														<option value="6">Punjab National Bank</option>
													</select>
												</div>
											</div>
											<div class="col-md-6">
												<div class="ui search focus mt-30 lbel25">
													<label>IFSC Code</label>
													<div class="ui left icon input swdh11 swdh19">
														<input class="prompt srch_explore" type="text"
															name="IFSC[code]" maxlength="10"
															placeholder="Enter IFSC Code">
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="tab-pane fade" id="payapl-method-tab"
									role="tabpanel" aria-labelledby="payapl-tab">
									<div class="row">
										<div class="col-md-12">
											<p class="t-body">After payment via PayPal's secure
												checkout, we will send you a link to download your files.</p>
											<div class="media h-mt2">
												<div class="media__item -align-center">
													<p class="t2-body h-m0">PayPal accepts</p>
												</div>
												<div class="media__body">
													<ul id="paypal-gateway" class="financial-institutes">
														<li class="financial-institutes__logo"><img
															alt="Visa" title="Visa"
															src="images/membership/pyicon-1.svg"></li>
														<li class="financial-institutes__logo"><img
															alt="MasterCard" title="MasterCard"
															src="images/membership/pyicon-2.svg"></li>
														<li class="financial-institutes__logo"><img
															alt="American Express" title="American Express"
															src="images/membership/pyicon-3.svg"></li>
														<li class="financial-institutes__logo"><img
															alt="Discover" title="Discover"
															src="images/membership/pyicon-4.svg"></li>
														<li class="financial-institutes__logo"><img
															alt="China UnionPay" title="China UnionPay"
															src="images/membership/pyicon-5.svg"></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="chckout_order_dt">
								<div class="checkout_title">
									<h4>주문 정보</h4>
									<img src="images/line.svg" alt="">
								</div>
								<div class="order_dt_section">
									<div class="order_title">
										<h4><%=written.getTitle()%></h4>
										<div class="order_price"><%=written.getPrice()%></div>
									</div>
									<div class="order_title">
										<h6>할인</h6>
										<div class="order_price"><%=written.getSaleAmount()%>%
										</div>
									</div>
									<div class="order_title">
										<h3>총 가격</h3>
										<div class="order_price"><%=written.getPrice() - (written.getPrice() / 100 * written.getSaleAmount())%></div>
									</div>
									<button class="chckot_btn" type="submit">결제 확인</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="membership_chk_bg rght1528">
							<div class="checkout_title">
								<h4>주문 요약</h4>
								<img src="images/line.svg" alt="">
							</div>
							<div class="order_dt_section">
								<div class="order_title">
									<h4>원가</h4>
									<div class="order_price"><%=written.getPrice()%></div>
								</div>
								<div class="order_title">
									<h6>할인</h6>
									<div class="order_price"><%=written.getSaleAmount()%>%
									</div>
								</div>
								<div class="order_title">
									<h2>총 가격</h2>
									<div class="order_price5"><%=written.getPrice() - (written.getPrice() / 100 * written.getSaleAmount())%></div>
								</div>
								<div class="scr_text">
									<i class="uil uil-lock-alt"></i>보안 적용
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
							<a href="about_us.jsp">About</a> <a href="our_blog.jsp">Blog</a>
							<a href="career.jsp">Careers</a> <a href="press.jsp">Press</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6">
						<div class="item_f1">
							<a href="help.jsp">Help</a> <a href="coming_soon.jsp">Advertise</a>
							<a href="coming_soon.jsp">Developers</a> <a href="contact_us.jsp">Contact
								Us</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6">
						<div class="item_f1">
							<a href="terms_of_use.jsp">Copyright Policy</a> <a
								href="terms_of_use.jsp">Terms</a> <a href="terms_of_use.jsp">Privacy
								Policy</a> <a href="sitemap.jsp">Sitemap</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6">
						<div class="item_f3">
							<a href="#" class="btn1542">Teach on Cursus</a>
							<div class="lng_btn">
								<div class="ui language bottom right pointing dropdown floating"
									id="languages" data-content="Select Language">
									<a href="#"><i class='uil uil-globe lft'></i>Language<i
										class='uil uil-angle-down rgt'></i></a>
									<div class="menu">
										<div class="scrolling menu">
											<div class="item" data-percent="100" data-value="en"
												data-english="English">
												<span class="description">English</span> English
											</div>
											<div class="item" data-percent="94" data-value="da"
												data-english="Danish">
												<span class="description">dansk</span> Danish
											</div>
											<div class="item" data-percent="94" data-value="es"
												data-english="Spanish">
												<span class="description">Español</span> Spanish
											</div>
											<div class="item" data-percent="34" data-value="zh"
												data-english="Chinese">
												<span class="description">简体中文</span> Chinese
											</div>
											<div class="item" data-percent="54" data-value="zh_TW"
												data-english="Chinese (Taiwan)">
												<span class="description">中文 (臺灣)</span> Chinese (Taiwan)
											</div>
											<div class="item" data-percent="79" data-value="fa"
												data-english="Persian">
												<span class="description">پارسی</span> Persian
											</div>
											<div class="item" data-percent="41" data-value="fr"
												data-english="French">
												<span class="description">Français</span> French
											</div>
											<div class="item" data-percent="37" data-value="el"
												data-english="Greek">
												<span class="description">ελληνικά</span> Greek
											</div>
											<div class="item" data-percent="37" data-value="ru"
												data-english="Russian">
												<span class="description">Русский</span> Russian
											</div>
											<div class="item" data-percent="36" data-value="de"
												data-english="German">
												<span class="description">Deutsch</span> German
											</div>
											<div class="item" data-percent="23" data-value="it"
												data-english="Italian">
												<span class="description">Italiano</span> Italian
											</div>
											<div class="item" data-percent="21" data-value="nl"
												data-english="Dutch">
												<span class="description">Nederlands</span> Dutch
											</div>
											<div class="item" data-percent="19" data-value="pt_BR"
												data-english="Portuguese">
												<span class="description">Português(BR)</span> Portuguese
											</div>
											<div class="item" data-percent="17" data-value="id"
												data-english="Indonesian">
												<span class="description">Indonesian</span> Indonesian
											</div>
											<div class="item" data-percent="12" data-value="lt"
												data-english="Lithuanian">
												<span class="description">Lietuvių</span> Lithuanian
											</div>
											<div class="item" data-percent="11" data-value="tr"
												data-english="Turkish">
												<span class="description">Türkçe</span> Turkish
											</div>
											<div class="item" data-percent="10" data-value="kr"
												data-english="Korean">
												<span class="description">한국어</span> Korean
											</div>
											<div class="item" data-percent="7" data-value="ar"
												data-english="Arabic">
												<span class="description">العربية</span> Arabic
											</div>
											<div class="item" data-percent="6" data-value="hu"
												data-english="Hungarian">
												<span class="description">Magyar</span> Hungarian
											</div>
											<div class="item" data-percent="6" data-value="vi"
												data-english="Vietnamese">
												<span class="description">tiếng Việt</span> Vietnamese
											</div>
											<div class="item" data-percent="5" data-value="sv"
												data-english="Swedish">
												<span class="description">svenska</span> Swedish
											</div>
											<div class="item" data-precent="4" data-value="pl"
												data-english="Polish">
												<span class="description">polski</span> Polish
											</div>
											<div class="item" data-percent="6" data-value="ja"
												data-english="Japanese">
												<span class="description">日本語</span> Japanese
											</div>
											<div class="item" data-percent="0" data-value="ro"
												data-english="Romanian">
												<span class="description">românește</span> Romanian
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
										<li><a href="index.jsp">
												<div class="footer_logo">
													<img src="images/logo1.svg" alt="">
												</div>
										</a></li>
										<li>
											<p>
												© 2020 <strong>Cursus</strong>. All Rights Reserved.
											</p>
										</li>
									</ul>
								</div>
								<div class="col-md-6">
									<div class="edu_social_links">
										<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
											class="fab fa-twitter"></i></a> <a href="#"><i
											class="fab fa-google-plus-g"></i></a> <a href="#"><i
											class="fab fa-linkedin-in"></i></a> <a href="#"><i
											class="fab fa-instagram"></i></a> <a href="#"><i
											class="fab fa-youtube"></i></a> <a href="#"><i
											class="fab fa-pinterest-p"></i></a>
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


</body>
</html>
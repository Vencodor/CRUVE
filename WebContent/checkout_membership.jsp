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
		<title>Cursus - Checkout</title>
		
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
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="back_link">
						<a href="index.jsp" class="hde151">Back To Cursus</a>
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
											<li class="breadcrumb-item"><a href="membership.jsp">Paid Membership</a></li>
											<li class="breadcrumb-item active" aria-current="page">Checkout</li>
										</ol>
									</nav>
								</div>
							</div>
						</div>
						<div class="title126">	
							<h2>Checkout</h2>
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
								<h4>Billing Details</h4>
								<img src="images/line.svg" alt="">
							</div>
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="address1">
										<div class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseaddress1" aria-expanded="false" aria-controls="collapseaddress1">
												Edit Address
											</a>
										</div>
									</div>
									<div id="collapseaddress1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="address1">
										<div class="panel-body">
											<form>
												<div class="row">
													<div class="col-lg-6">
														<div class="ui search focus mt-30 lbel25">
															<label>First Name*</label>
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="name" value="Joginder" id="id_name" required="" maxlength="64" placeholder="First Name">															
															</div>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="ui search focus mt-30 lbel25">
															<label>Last Name*</label>
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="surname" value="Singh" id="id_surname" required="" maxlength="64" placeholder="Last Name">															
															</div>
														</div>
													</div>
													<div class="col-lg-12">													
														<div class="ui search focus mt-30 lbel25">	
															<label>Academy Name*</label>
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="academyname" value="Gambolthemes" id="id_academy" required="" maxlength="64" placeholder="Academy Name">															
															</div>
															<div class="help-block">If you want your invoices addressed to a academy. Leave blank to use your full name.</div>
														</div>
													</div>												
													<div class="col-lg-12">
														<div class="mt-30 lbel25">	
															<label>Country*</label>
														</div>
														<div class="ui fluid search selection dropdown focus cntry152">														
															<input type="hidden" name="country" class="prompt srch_explore">
															<i class="dropdown icon"></i>
																<div class="default text">Select Country</div>
																<div class="menu">
																<div class="item" data-value="af"><i class="af flag"></i>Afghanistan</div>
																<div class="item" data-value="ax"><i class="ax flag"></i>Aland Islands</div>
																<div class="item" data-value="al"><i class="al flag"></i>Albania</div>
																<div class="item" data-value="dz"><i class="dz flag"></i>Algeria</div>
																<div class="item" data-value="as"><i class="as flag"></i>American Samoa</div>
																<div class="item" data-value="ad"><i class="ad flag"></i>Andorra</div>
																<div class="item" data-value="ao"><i class="ao flag"></i>Angola</div>
																<div class="item" data-value="ai"><i class="ai flag"></i>Anguilla</div>
																<div class="item" data-value="ag"><i class="ag flag"></i>Antigua</div>
																<div class="item" data-value="ar"><i class="ar flag"></i>Argentina</div>
																<div class="item" data-value="am"><i class="am flag"></i>Armenia</div>
																<div class="item" data-value="aw"><i class="aw flag"></i>Aruba</div>
																<div class="item" data-value="au"><i class="au flag"></i>Australia</div>
																<div class="item" data-value="at"><i class="at flag"></i>Austria</div>
																<div class="item" data-value="az"><i class="az flag"></i>Azerbaijan</div>
																<div class="item" data-value="bs"><i class="bs flag"></i>Bahamas</div>
																<div class="item" data-value="bh"><i class="bh flag"></i>Bahrain</div>
																<div class="item" data-value="bd"><i class="bd flag"></i>Bangladesh</div>
																<div class="item" data-value="bb"><i class="bb flag"></i>Barbados</div>
																<div class="item" data-value="by"><i class="by flag"></i>Belarus</div>
																<div class="item" data-value="be"><i class="be flag"></i>Belgium</div>
																<div class="item" data-value="bz"><i class="bz flag"></i>Belize</div>
																<div class="item" data-value="bj"><i class="bj flag"></i>Benin</div>
																<div class="item" data-value="bm"><i class="bm flag"></i>Bermuda</div>
																<div class="item" data-value="bt"><i class="bt flag"></i>Bhutan</div>
																<div class="item" data-value="bo"><i class="bo flag"></i>Bolivia</div>
																<div class="item" data-value="ba"><i class="ba flag"></i>Bosnia</div>
																<div class="item" data-value="bw"><i class="bw flag"></i>Botswana</div>
																<div class="item" data-value="bv"><i class="bv flag"></i>Bouvet Island</div>
																<div class="item" data-value="br"><i class="br flag"></i>Brazil</div>
																<div class="item" data-value="vg"><i class="vg flag"></i>British Virgin Islands</div>
																<div class="item" data-value="bn"><i class="bn flag"></i>Brunei</div>
																<div class="item" data-value="bg"><i class="bg flag"></i>Bulgaria</div>
																<div class="item" data-value="bf"><i class="bf flag"></i>Burkina Faso</div>
																<div class="item" data-value="mm"><i class="mm flag"></i>Burma</div>
																<div class="item" data-value="bi"><i class="bi flag"></i>Burundi</div>
																<div class="item" data-value="tc"><i class="tc flag"></i>Caicos Islands</div>
																<div class="item" data-value="kh"><i class="kh flag"></i>Cambodia</div>
																<div class="item" data-value="cm"><i class="cm flag"></i>Cameroon</div>
																<div class="item" data-value="ca"><i class="ca flag"></i>Canada</div>
																<div class="item" data-value="cv"><i class="cv flag"></i>Cape Verde</div>
																<div class="item" data-value="ky"><i class="ky flag"></i>Cayman Islands</div>
																<div class="item" data-value="cf"><i class="cf flag"></i>Central African Republic</div>
																<div class="item" data-value="td"><i class="td flag"></i>Chad</div>
																<div class="item" data-value="cl"><i class="cl flag"></i>Chile</div>
																<div class="item" data-value="cn"><i class="cn flag"></i>China</div>
																<div class="item" data-value="cx"><i class="cx flag"></i>Christmas Island</div>
																<div class="item" data-value="cc"><i class="cc flag"></i>Cocos Islands</div>
																<div class="item" data-value="co"><i class="co flag"></i>Colombia</div>
																<div class="item" data-value="km"><i class="km flag"></i>Comoros</div>
																<div class="item" data-value="cg"><i class="cg flag"></i>Congo Brazzaville</div>
																<div class="item" data-value="cd"><i class="cd flag"></i>Congo</div>
																<div class="item" data-value="ck"><i class="ck flag"></i>Cook Islands</div>
																<div class="item" data-value="cr"><i class="cr flag"></i>Costa Rica</div>
																<div class="item" data-value="ci"><i class="ci flag"></i>Cote Divoire</div>
																<div class="item" data-value="hr"><i class="hr flag"></i>Croatia</div>
																<div class="item" data-value="cu"><i class="cu flag"></i>Cuba</div>
																<div class="item" data-value="cy"><i class="cy flag"></i>Cyprus</div>
																<div class="item" data-value="cz"><i class="cz flag"></i>Czech Republic</div>
																<div class="item" data-value="dk"><i class="dk flag"></i>Denmark</div>
																<div class="item" data-value="dj"><i class="dj flag"></i>Djibouti</div>
																<div class="item" data-value="dm"><i class="dm flag"></i>Dominica</div>
																<div class="item" data-value="do"><i class="do flag"></i>Dominican Republic</div>
																<div class="item" data-value="ec"><i class="ec flag"></i>Ecuador</div>
																<div class="item" data-value="eg"><i class="eg flag"></i>Egypt</div>
																<div class="item" data-value="sv"><i class="sv flag"></i>El Salvador</div>
																<div class="item" data-value="gb"><i class="gb flag"></i>England</div>
																<div class="item" data-value="gq"><i class="gq flag"></i>Equatorial Guinea</div>
																<div class="item" data-value="er"><i class="er flag"></i>Eritrea</div>
																<div class="item" data-value="ee"><i class="ee flag"></i>Estonia</div>
																<div class="item" data-value="et"><i class="et flag"></i>Ethiopia</div>
																<div class="item" data-value="eu"><i class="eu flag"></i>European Union</div>
																<div class="item" data-value="fk"><i class="fk flag"></i>Falkland Islands</div>
																<div class="item" data-value="fo"><i class="fo flag"></i>Faroe Islands</div>
																<div class="item" data-value="fj"><i class="fj flag"></i>Fiji</div>
																<div class="item" data-value="fi"><i class="fi flag"></i>Finland</div>
																<div class="item" data-value="fr"><i class="fr flag"></i>France</div>
																<div class="item" data-value="gf"><i class="gf flag"></i>French Guiana</div>
																<div class="item" data-value="pf"><i class="pf flag"></i>French Polynesia</div>
																<div class="item" data-value="tf"><i class="tf flag"></i>French Territories</div>
																<div class="item" data-value="ga"><i class="ga flag"></i>Gabon</div>
																<div class="item" data-value="gm"><i class="gm flag"></i>Gambia</div>
																<div class="item" data-value="ge"><i class="ge flag"></i>Georgia</div>
																<div class="item" data-value="de"><i class="de flag"></i>Germany</div>
																<div class="item" data-value="gh"><i class="gh flag"></i>Ghana</div>
																<div class="item" data-value="gi"><i class="gi flag"></i>Gibraltar</div>
																<div class="item" data-value="gr"><i class="gr flag"></i>Greece</div>
																<div class="item" data-value="gl"><i class="gl flag"></i>Greenland</div>
																<div class="item" data-value="gd"><i class="gd flag"></i>Grenada</div>
																<div class="item" data-value="gp"><i class="gp flag"></i>Guadeloupe</div>
																<div class="item" data-value="gu"><i class="gu flag"></i>Guam</div>
																<div class="item" data-value="gt"><i class="gt flag"></i>Guatemala</div>
																<div class="item" data-value="gw"><i class="gw flag"></i>Guinea-Bissau</div>
																<div class="item" data-value="gn"><i class="gn flag"></i>Guinea</div>
																<div class="item" data-value="gy"><i class="gy flag"></i>Guyana</div>
																<div class="item" data-value="ht"><i class="ht flag"></i>Haiti</div>
																<div class="item" data-value="hm"><i class="hm flag"></i>Heard Island</div>
																<div class="item" data-value="hn"><i class="hn flag"></i>Honduras</div>
																<div class="item" data-value="hk"><i class="hk flag"></i>Hong Kong</div>
																<div class="item" data-value="hu"><i class="hu flag"></i>Hungary</div>
																<div class="item" data-value="is"><i class="is flag"></i>Iceland</div>
																<div class="item" data-value="in"><i class="in flag"></i>India</div>
																<div class="item" data-value="io"><i class="io flag"></i>Indian Ocean Territory</div>
																<div class="item" data-value="id"><i class="id flag"></i>Indonesia</div>
																<div class="item" data-value="ir"><i class="ir flag"></i>Iran</div>
																<div class="item" data-value="iq"><i class="iq flag"></i>Iraq</div>
																<div class="item" data-value="ie"><i class="ie flag"></i>Ireland</div>
																<div class="item" data-value="il"><i class="il flag"></i>Israel</div>
																<div class="item" data-value="it"><i class="it flag"></i>Italy</div>
																<div class="item" data-value="jm"><i class="jm flag"></i>Jamaica</div>
																<div class="item" data-value="jp"><i class="jp flag"></i>Japan</div>
																<div class="item" data-value="jo"><i class="jo flag"></i>Jordan</div>
																<div class="item" data-value="kz"><i class="kz flag"></i>Kazakhstan</div>
																<div class="item" data-value="ke"><i class="ke flag"></i>Kenya</div>
																<div class="item" data-value="ki"><i class="ki flag"></i>Kiribati</div>
																<div class="item" data-value="kw"><i class="kw flag"></i>Kuwait</div>
																<div class="item" data-value="kg"><i class="kg flag"></i>Kyrgyzstan</div>
																<div class="item" data-value="la"><i class="la flag"></i>Laos</div>
																<div class="item" data-value="lv"><i class="lv flag"></i>Latvia</div>
																<div class="item" data-value="lb"><i class="lb flag"></i>Lebanon</div>
																<div class="item" data-value="ls"><i class="ls flag"></i>Lesotho</div>
																<div class="item" data-value="lr"><i class="lr flag"></i>Liberia</div>
																<div class="item" data-value="ly"><i class="ly flag"></i>Libya</div>
																<div class="item" data-value="li"><i class="li flag"></i>Liechtenstein</div>
																<div class="item" data-value="lt"><i class="lt flag"></i>Lithuania</div>
																<div class="item" data-value="lu"><i class="lu flag"></i>Luxembourg</div>
																<div class="item" data-value="mo"><i class="mo flag"></i>Macau</div>
																<div class="item" data-value="mk"><i class="mk flag"></i>Macedonia</div>
																<div class="item" data-value="mg"><i class="mg flag"></i>Madagascar</div>
																<div class="item" data-value="mw"><i class="mw flag"></i>Malawi</div>
																<div class="item" data-value="my"><i class="my flag"></i>Malaysia</div>
																<div class="item" data-value="mv"><i class="mv flag"></i>Maldives</div>
																<div class="item" data-value="ml"><i class="ml flag"></i>Mali</div>
																<div class="item" data-value="mt"><i class="mt flag"></i>Malta</div>
																<div class="item" data-value="mh"><i class="mh flag"></i>Marshall Islands</div>
																<div class="item" data-value="mq"><i class="mq flag"></i>Martinique</div>
																<div class="item" data-value="mr"><i class="mr flag"></i>Mauritania</div>
																<div class="item" data-value="mu"><i class="mu flag"></i>Mauritius</div>
																<div class="item" data-value="yt"><i class="yt flag"></i>Mayotte</div>
																<div class="item" data-value="mx"><i class="mx flag"></i>Mexico</div>
																<div class="item" data-value="fm"><i class="fm flag"></i>Micronesia</div>
																<div class="item" data-value="md"><i class="md flag"></i>Moldova</div>
																<div class="item" data-value="mc"><i class="mc flag"></i>Monaco</div>
																<div class="item" data-value="mn"><i class="mn flag"></i>Mongolia</div>
																<div class="item" data-value="me"><i class="me flag"></i>Montenegro</div>
																<div class="item" data-value="ms"><i class="ms flag"></i>Montserrat</div>
																<div class="item" data-value="ma"><i class="ma flag"></i>Morocco</div>
																<div class="item" data-value="mz"><i class="mz flag"></i>Mozambique</div>
																<div class="item" data-value="na"><i class="na flag"></i>Namibia</div>
																<div class="item" data-value="nr"><i class="nr flag"></i>Nauru</div>
																<div class="item" data-value="np"><i class="np flag"></i>Nepal</div>
																<div class="item" data-value="an"><i class="an flag"></i>Netherlands Antilles</div>
																<div class="item" data-value="nl"><i class="nl flag"></i>Netherlands</div>
																<div class="item" data-value="nc"><i class="nc flag"></i>New Caledonia</div>
																<div class="item" data-value="pg"><i class="pg flag"></i>New Guinea</div>
																<div class="item" data-value="nz"><i class="nz flag"></i>New Zealand</div>
																<div class="item" data-value="ni"><i class="ni flag"></i>Nicaragua</div>
																<div class="item" data-value="ne"><i class="ne flag"></i>Niger</div>
																<div class="item" data-value="ng"><i class="ng flag"></i>Nigeria</div>
																<div class="item" data-value="nu"><i class="nu flag"></i>Niue</div>
																<div class="item" data-value="nf"><i class="nf flag"></i>Norfolk Island</div>
																<div class="item" data-value="kp"><i class="kp flag"></i>North Korea</div>
																<div class="item" data-value="mp"><i class="mp flag"></i>Northern Mariana Islands</div>
																<div class="item" data-value="no"><i class="no flag"></i>Norway</div>
																<div class="item" data-value="om"><i class="om flag"></i>Oman</div>
																<div class="item" data-value="pk"><i class="pk flag"></i>Pakistan</div>
																<div class="item" data-value="pw"><i class="pw flag"></i>Palau</div>
																<div class="item" data-value="ps"><i class="ps flag"></i>Palestine</div>
																<div class="item" data-value="pa"><i class="pa flag"></i>Panama</div>
																<div class="item" data-value="py"><i class="py flag"></i>Paraguay</div>
																<div class="item" data-value="pe"><i class="pe flag"></i>Peru</div>
																<div class="item" data-value="ph"><i class="ph flag"></i>Philippines</div>
																<div class="item" data-value="pn"><i class="pn flag"></i>Pitcairn Islands</div>
																<div class="item" data-value="pl"><i class="pl flag"></i>Poland</div>
																<div class="item" data-value="pt"><i class="pt flag"></i>Portugal</div>
																<div class="item" data-value="pr"><i class="pr flag"></i>Puerto Rico</div>
																<div class="item" data-value="qa"><i class="qa flag"></i>Qatar</div>
																<div class="item" data-value="re"><i class="re flag"></i>Reunion</div>
																<div class="item" data-value="ro"><i class="ro flag"></i>Romania</div>
																<div class="item" data-value="ru"><i class="ru flag"></i>Russia</div>
																<div class="item" data-value="rw"><i class="rw flag"></i>Rwanda</div>
																<div class="item" data-value="sh"><i class="sh flag"></i>Saint Helena</div>
																<div class="item" data-value="kn"><i class="kn flag"></i>Saint Kitts and Nevis</div>
																<div class="item" data-value="lc"><i class="lc flag"></i>Saint Lucia</div>
																<div class="item" data-value="pm"><i class="pm flag"></i>Saint Pierre</div>
																<div class="item" data-value="vc"><i class="vc flag"></i>Saint Vincent</div>
																<div class="item" data-value="ws"><i class="ws flag"></i>Samoa</div>
																<div class="item" data-value="sm"><i class="sm flag"></i>San Marino</div>
																<div class="item" data-value="gs"><i class="gs flag"></i>Sandwich Islands</div>
																<div class="item" data-value="st"><i class="st flag"></i>Sao Tome</div>
																<div class="item" data-value="sa"><i class="sa flag"></i>Saudi Arabia</div>
																<div class="item" data-value="sn"><i class="sn flag"></i>Senegal</div>
																<div class="item" data-value="cs"><i class="cs flag"></i>Serbia</div>
																<div class="item" data-value="rs"><i class="rs flag"></i>Serbia</div>
																<div class="item" data-value="sc"><i class="sc flag"></i>Seychelles</div>
																<div class="item" data-value="sl"><i class="sl flag"></i>Sierra Leone</div>
																<div class="item" data-value="sg"><i class="sg flag"></i>Singapore</div>
																<div class="item" data-value="sk"><i class="sk flag"></i>Slovakia</div>
																<div class="item" data-value="si"><i class="si flag"></i>Slovenia</div>
																<div class="item" data-value="sb"><i class="sb flag"></i>Solomon Islands</div>
																<div class="item" data-value="so"><i class="so flag"></i>Somalia</div>
																<div class="item" data-value="za"><i class="za flag"></i>South Africa</div>
																<div class="item" data-value="kr"><i class="kr flag"></i>South Korea</div>
																<div class="item" data-value="es"><i class="es flag"></i>Spain</div>
																<div class="item" data-value="lk"><i class="lk flag"></i>Sri Lanka</div>
																<div class="item" data-value="sd"><i class="sd flag"></i>Sudan</div>
																<div class="item" data-value="sr"><i class="sr flag"></i>Suriname</div>
																<div class="item" data-value="sj"><i class="sj flag"></i>Svalbard</div>
																<div class="item" data-value="sz"><i class="sz flag"></i>Swaziland</div>
																<div class="item" data-value="se"><i class="se flag"></i>Sweden</div>
																<div class="item" data-value="ch"><i class="ch flag"></i>Switzerland</div>
																<div class="item" data-value="sy"><i class="sy flag"></i>Syria</div>
																<div class="item" data-value="tw"><i class="tw flag"></i>Taiwan</div>
																<div class="item" data-value="tj"><i class="tj flag"></i>Tajikistan</div>
																<div class="item" data-value="tz"><i class="tz flag"></i>Tanzania</div>
																<div class="item" data-value="th"><i class="th flag"></i>Thailand</div>
																<div class="item" data-value="tl"><i class="tl flag"></i>Timorleste</div>
																<div class="item" data-value="tg"><i class="tg flag"></i>Togo</div>
																<div class="item" data-value="tk"><i class="tk flag"></i>Tokelau</div>
																<div class="item" data-value="to"><i class="to flag"></i>Tonga</div>
																<div class="item" data-value="tt"><i class="tt flag"></i>Trinidad</div>
																<div class="item" data-value="tn"><i class="tn flag"></i>Tunisia</div>
																<div class="item" data-value="tr"><i class="tr flag"></i>Turkey</div>
																<div class="item" data-value="tm"><i class="tm flag"></i>Turkmenistan</div>
																<div class="item" data-value="tv"><i class="tv flag"></i>Tuvalu</div>
																<div class="item" data-value="ug"><i class="ug flag"></i>Uganda</div>
																<div class="item" data-value="ua"><i class="ua flag"></i>Ukraine</div>
																<div class="item" data-value="ae"><i class="ae flag"></i>United Arab Emirates</div>
																<div class="item" data-value="us"><i class="us flag"></i>United States</div>
																<div class="item" data-value="uy"><i class="uy flag"></i>Uruguay</div>
																<div class="item" data-value="um"><i class="um flag"></i>Us Minor Islands</div>
																<div class="item" data-value="vi"><i class="vi flag"></i>Us Virgin Islands</div>
																<div class="item" data-value="uz"><i class="uz flag"></i>Uzbekistan</div>
																<div class="item" data-value="vu"><i class="vu flag"></i>Vanuatu</div>
																<div class="item" data-value="va"><i class="va flag"></i>Vatican City</div>
																<div class="item" data-value="ve"><i class="ve flag"></i>Venezuela</div>
																<div class="item" data-value="vn"><i class="vn flag"></i>Vietnam</div>
																<div class="item" data-value="wf"><i class="wf flag"></i>Wallis and Futuna</div>
																<div class="item" data-value="eh"><i class="eh flag"></i>Western Sahara</div>
																<div class="item" data-value="ye"><i class="ye flag"></i>Yemen</div>
																<div class="item" data-value="zm"><i class="zm flag"></i>Zambia</div>
																<div class="item" data-value="zw"><i class="zw flag"></i>Zimbabwe</div>
															</div>
														</div>
													</div>
													<div class="col-lg-12">
														<div class="ui search focus mt-30 lbel25">
															<label>Address1*</label>
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="addressname" value="#1234 Street No. 45, Ward No. 60, Phase 3" id="id_address1" required="" maxlength="300" placeholder="Address Line 1">															
															</div>
														</div>
													</div>
													<div class="col-lg-12">
														<div class="ui search focus mt-30 lbel25">
															<label>Address2*</label>
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="addressname2"  value="Shahid Karnail Singh Nagar, Near Pakhowal Road" id="id_address2" required="" maxlength="300" placeholder="Address Line 2">															
															</div>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="ui search focus mt-30 lbel25">
															<label>City*</label>
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="city" value="Ludhiana" id="id_city" required="" maxlength="64" placeholder="City">															
															</div>							
														</div>
													</div>
													<div class="col-lg-6">
														<div class="ui search focus mt-30 lbel25">
															<label>State / Province / Region*</label>
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="state" value="Punjab" id="id_state" required="" maxlength="64" placeholder="State / Province / Region">															
															</div>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="ui search focus mt-30 lbel25">
															<label>Zip/Postal Code*</label>
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="zip" value="141013" id="id_zip" required="" maxlength="64" placeholder="Zip / Postal Code">															
															</div>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="ui search focus mt-30 lbel25">
															<label>Phone Number*</label>
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="phone" value="+91123456789" id="id_phone" required="" maxlength="12" placeholder="Phone Number">															
															</div>
														</div>
													</div>
													<div class="col-lg-6">
														<button class="save_address_btn" type="submit">Save Changes</button>
													</div>												
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<div class="address_text">
								Joginder Singh<br>
								#1234 Street No. 45, Ward No. 60, Phase 3,<br> Shahid Karnail Singh Nagar, Near Pakhowal<br> Road.<br>
								Ludhiana, Punjab, 141013<br>
								India
							</div>
						</div>
						<div class="membership_chk_bg">
							<div class="checkout_title">
								<h4>Select Payment Method</h4>
								<img src="images/line.svg" alt="">
							</div>
							<div class="checkout-tabs">
								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item">
										<a href="#credit-method-tab" id="credit-tab" class="nav-link active" data-toggle="tab"><i class="uil uil-card-atm check_icon5"></i>Credit/Debit Card</a>
									</li>
									<li class="nav-item">
										<a href="#bank-method-tab" id="bank-tab" class="nav-link" data-toggle="tab"><i class="uil uil-university check_icon5"></i>Bank Transfer</a>
									</li>
									<li class="nav-item">
										<a href="#payapl-method-tab" id="payapl-tab" class="nav-link" data-toggle="tab"><i class="uil uil-paypal check_icon5"></i>Paypal</a>
									</li>
								</ul>									
							</div>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="credit-method-tab" role="tabpanel" aria-labelledby="credit-tab">
									<form>
										<div class="row">
											<div class="col-md-6">	
												<div class="ui search focus mt-30 lbel25">
													<label>Holder Name</label>
													<div class="ui left icon input swdh11 swdh19">
														<input class="prompt srch_explore" type="text" name="holder[name]" value="" id="id_holdername" required="" maxlength="64" placeholder="Enter Holder Name">															
													</div>
												</div>										
											</div>
											<div class="col-md-6">	
												<div class="ui search focus mt-30 lbel25">
													<label>Card Number</label>
													<div class="ui left icon input swdh11 swdh19">														
														<input class="prompt srch_explore" type="text" name="card[number]" maxlength="16" placeholder="Card #">									
													</div>
												</div>												
											</div>
											<div class="col-md-4">
												<div class="lbel25 mt-30">
													<label>Expiration Month</label>
													<select class="ui hj145 dropdown cntry152 prompt srch_explore" name="card[expire-month]">
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
														<input class="prompt srch_explore" type="text" name="card[expire-year]" maxlength="4" placeholder="Year">
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="ui search focus mt-30 lbel25">
													<label>Expiration Year</label>
													<div class="ui left icon input swdh11 swdh19">	
														<input class="prompt srch_explore"  type="text" name="card[cvc]" maxlength="3" placeholder="CVC">
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="tab-pane fade" id="bank-method-tab" role="tabpanel" aria-labelledby="bank-tab">
									<form>
										<div class="row">
											<div class="col-md-6">	
												<div class="ui search focus mt-30 lbel25">
													<label>Account Holder Name</label>
													<div class="ui left icon input swdh11 swdh19">
														<input class="prompt srch_explore" type="text" name="account[holdername}" value="" required="" maxlength="64" placeholder="Enter Your Full Name">															
													</div>
												</div>										
											</div>
											<div class="col-md-6">	
												<div class="ui search focus mt-30 lbel25">
													<label>Account Number</label>
													<div class="ui left icon input swdh11 swdh19">														
														<input class="prompt srch_explore" type="text" name="Account[number]" maxlength="10" placeholder="Enter Account Number">									
													</div>
												</div>												
											</div>
											<div class="col-md-6">
												<div class="lbel25 mt-30">
													<label>Bank Name</label>
													<select class="ui hj145 dropdown cntry152 prompt srch_explore" name="Bank[name]">
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
														<input class="prompt srch_explore" type="text" name="IFSC[code]" maxlength="10" placeholder="Enter IFSC Code">
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="tab-pane fade" id="payapl-method-tab" role="tabpanel" aria-labelledby="payapl-tab">
									<div class="row">
										<div class="col-md-12">	
											<p class="t-body">After payment via PayPal's secure checkout, we will send you a link to download your files.</p>
											<div class="media h-mt2">
												<div class="media__item -align-center">
													<p class="t2-body h-m0">PayPal accepts</p>
												</div>
												<div class="media__body">
													<ul id="paypal-gateway" class="financial-institutes">
														<li class="financial-institutes__logo">
														  <img alt="Visa" title="Visa" src="images/membership/pyicon-1.svg">
														</li>
														<li class="financial-institutes__logo">
														  <img alt="MasterCard" title="MasterCard" src="images/membership/pyicon-2.svg">
														</li>
														<li class="financial-institutes__logo">
														  <img alt="American Express" title="American Express" src="images/membership/pyicon-3.svg">
														</li>
														<li class="financial-institutes__logo">
														  <img alt="Discover" title="Discover" src="images/membership/pyicon-4.svg">
														</li>
														<li class="financial-institutes__logo">
														  <img alt="China UnionPay" title="China UnionPay" src="images/membership/pyicon-5.svg">
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="chckout_order_dt">
								<div class="checkout_title">
									<h4>Order Details</h4>
									<img src="images/line.svg" alt="">
								</div>
								<div class="order_dt_section">
									<div class="order_title">
										<h4>Baby Plan</h4>
										<div class="order_price">$49</div>
									</div>
									<div class="order_title">
										<h6>Taxes(GST)</h6>
										<div class="order_price">$2</div>
									</div>
									<div class="order_title">
										<h3>Total</h3>
										<div class="order_price">$51</div>
									</div>
									<button class="chckot_btn" type="submit">Confirm Checkout</button>
								</div>
							</div>
						</div>									
					</div>
					<div class="col-lg-4">
						<div class="membership_chk_bg rght1528">
								<div class="checkout_title">
									<h4>Order Summary</h4>
									<img src="images/line.svg" alt="">
								</div>
								<div class="order_dt_section">
									<div class="order_title">
										<h4>Baby Plan</h4>
										<div class="order_price">$49</div>
									</div>
									<div class="order_title">
										<h6>Taxes(GST)</h6>
										<div class="order_price">$2</div>
									</div>
									<div class="order_title">
										<h2>Total</h2>
										<div class="order_price5">$51</div>
									</div>
									<div class="scr_text"><i class="uil uil-lock-alt"></i>Secure checkout</div>
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
	
	
</body>
</html>
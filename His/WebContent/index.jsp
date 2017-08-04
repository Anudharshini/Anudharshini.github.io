<%@page import="org.apache.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<%@include file="header.jsp"%>

<%final Logger LOGGER = Logger.getLogger("index_jsp.class"); %>
<body id="load" onload="userSession()">
	<%LOGGER.info("New Session : "+request.getSession().getId()+" from device : "+request.getRemoteAddr()); %>
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top topnav"
		role="navigation">
	<div class="container topnav">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">

			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<ul class="nav navbar-nav navbar-left">
				<li><a href="#home">Home</a>
				</li>
			</ul>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#about">About us</a>
				</li>

				<li><a href="#contact">Contact us</a>
				</li>
				<li><a href="#login" onclick="getfocus()">Login</a>
				</li>
			</ul>
		</div>

	</div>
	</nav>

	<a name="home"></a>
	<div class="intro-header">
		<div class="container">

			<div class="row">
				<div class="col-lg-12">
					<div class="intro-message">
						<h1>Health Insurance</h1>

						<br> <br> <br>

						<p style="color: #fff">
							<font size="3.5"><p align="justify">Health insurance
									is insurance against the risk of incurring medical expenses
									among individuals. By estimating the overall risk of health
									care and health system expenses, among a targeted group, an
									insurer can develop a routine finance structure, such as a
									monthly premium or payroll tax, to ensure that money is
									available to pay for the health care benefits specified in the
									insurance agreement. The benefit is administered by a central
									organization such as a government agency, private business, or
									not-for-profit entity. According to the Health Insurance
									Association of America, health insurance is defined as coverage
									that provides for the payments of benefits as a result of
									sickness or injury. Includes insurance for losses from
									accident, medical expense, disability, or accidental death and
									dismemberment</p>
							</font> <br> <br>
					</div>
				</div>
			</div>

		</div>
	</div>
	

	<a name="about"></a>
	<div class="content-section-a">

		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-sm-6">
					<hr class="section-heading-spacer4">
					<div class="clearfix"></div>
					<h2 class="section-heading1">
						About Us:<br>
					</h2>
					<p class="lead">
						<marquee behavior="scroll">
							<p
								style="float: left; font-size: 14px; clear: both; color: #29abe2; font-family: Arial; font-weight: bold;">
								For prompt assistance related to policy claims, call
								1800-102-446</p>
						</marquee>
						<br>
					<h4>About Health Insurance</h4>
					<p align="justify">Health insurance is insurance against the
						risk of incurring medical expenses among individuals. By
						estimating the overall risk of health care and health system
						expenses, among a targeted group, an insurer can develop a routine
						finance structure, such as a monthly premium or payroll tax, to
						ensure that money is available to pay for the health care benefits
						specified in the insurance agreement. The benefit is administered
						by a central organization such as a government agency, private
						business, or not-for-profit entity. According to the Health
						Insurance Association of America, health insurance is defined as
						"coverage that provides for the payments of benefits as a result
						of sickness or injury. Includes insurance for losses from
						accident, medical expense, disability, or accidental death and
						dismemberment</p>
					<br> <br>
					<h4>Health Insurance Policy</h4>
					<nbps>
					<p align="justify">A contract between an insurance provider and
						an individual or his/her sponsor . The contract can be renewable
						or lifelong in the case of private insurance, or be mandatory for
						all citizens in the case of national plans. The type and amount of
						health care costs that will be covered by the health insurance
						provider are specified in writing, in a member contract or
						"Evidence of Coverage" booklet for private insurance, or in a
						national health policy for public insurance.</p>
				</div>

				<br> <br>
				<div class="col-lg-5 col-lg-offset-2 col-sm-6">
					<h4 class="section1-heading" align="center">
						Trust Us and Explore Life<br> <br>
					</h4>
					<img class="img-responsive" src="img/index-img.png" alt="">
				</div>
			</div>

		</div>
		<!-- /.container -->

	</div>
	<!-- /.content-section-a -->



	<a name="contact"></a>
	<div class="banner">

		<div class="container">

			<div class="row">
				<div class="col-lg-5 col-sm-6">
					<hr class="section-heading-spacer4">
					<div class="clearfix"></div>
					<h2 class="section-heading">
						Customer Support<br>
					</h2>
					<marquee behavior="scroll">
						<p
							style="float: left; font-size: 14px; clear: both; color: #29abe2; font-family: Arial; font-weight: bold;">
							For prompt assistance related to policy claims, call 1800-102-446</p>
					</marquee>
					<br>

					<h3>
						<strong>Customer Support</strong>
					</h3>
					<strong>Email:</strong>&nbsp;<strong><a
						href="mailto:customerservice@teamthree.com">customerservice@teamthree.com</a>
					</strong><br /> <strong>Phone:</strong>&nbsp;<a href="tel:+91-124-4584333">+91-124-4584333</a><br />
					<strong>Fax:</strong>&nbsp;<a href="tel:+91-124-4584111">+91-124-4584111</a><br />
					<strong>Support Toll Free:</strong>&nbsp;<a
						href="tel:1800-102-0333">1800-102-0333</a>
					<h3>Strategic Alliances</h3>
					<strong>Email:</strong>&nbsp;<strong><a
						href="mailto:anu@teamthree.com">anu@teamthree.com</a> </strong><br />
					<strong>Phone:</strong>&nbsp;<a href="tel:+91-124-4584373">+91-124-4584373</a>
					<br>
					<br>
					<button id="button1" class="btn">Locate Us</button>
					<br>

				</div>
				<div class="col-lg-5 col-lg-offset-2 col-sm-6" id="map" hidden>
					<br>
					<br>
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15661.726661166109!2d76.9888473!3d11.081171!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xe4c632007ced9e42!2sKCT+Tech+Park!5e0!3m2!1sen!2sin!4v1457679261266"
						width="440" height="300" frameborder="10" style="border: 10"></iframe>
				</div>




			</div>

		</div>
		<!-- /.container -->

	</div>
	<!-- /.banner -->

	<a name="login"></a>
	<div class="content-section-a">

		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-sm-6">
					<hr class="section-heading-spacer4">
					<div class="clearfix"></div>
					<h2 class="section-heading1">
						 Login<br>
					</h2>
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3 form-box">
							<div class="form-top">
								<div class="form-top-left">
									

								</div>
								
							</div>
							<section id="loginpage" onfocus="getfocus()">
							<div class="form-bottom">
								<form role="form" id="defaultForm" action="Login" method="post"
									class="login-form">
									<div class="form-group">
									<label class="sr-only" for="form-username">Username</label> <input
											type="text" name="username" placeholder="Username"
											class="form-username form-control" autocomplete="off"
											id="username">
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-password">Password</label> <input
											type="password" name="password" placeholder="Password"
											class="form-password form-control" autocomplete="off"
											id="password" onKeyDown="return DisableControlKey(event)"
											onMouseDown="return DisableControlKey(event)">
									</div>
									<!-- <div class="form-group">
                                                      <input type="checkbox" name="remember" id="remember" />
                                                      <label for="remember">Remember me</label>
                                                      </div> -->

									<button type="submit" class="btn">Sign in!</button>
									<br> New User <a href="register.jsp" class="btn"
										style="color: #31708f">Register Here</a> Nominee &nbsp;&nbsp;
									<a href="nominee.jsp" class="btn" style="color: #31708f">Login
										Here</a>
								</form>
							</div>
							</section>
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-lg-offset-2 col-sm-6">
					<img class="img-responsive" src="img/ipad.png" alt="">
				</div>
			</div>

		</div>
		<!-- /.container -->

	</div>
	
	<div class="container" align="center">
		<div class="row">
			<div class="col-lg-12">
				<!-- <ul class="list-inline">
					<li><a href="#" style="color: #31708f">Home</a></li>
					<li class="footer-menu-divider">&sdot;</li>
					<li><a href="#about" style="color: #31708f">About us</a></li>

					<li class="footer-menu-divider">&sdot;</li>
					<li><a href="#contact" style="color: #31708f">Contact us</a></li>
				</ul> -->
				</div></div></div>
	<!-- /.content-section-a -->
	<%@include file="footer.jsp"%>
	
<script type="text/javascript">
	function getfocus(){
		$('#username').focus();
	}
	</script>
</body>
<script type="text/javascript">
 /* document.getElementById('#login').onclick = function() {
	    document.getElementById('username').focus();
	}; */
	function DisableControlKey(e) {
	    // Message to display
	    var message = "Cntrl key/ Right Click Option disabled";
	    // Condition to check mouse right click / Ctrl key press
	    if (e.which == 17 || e.button == 2) {
	    alert("Copy Paste Disabled :)");
	    return false;
	    }
	    }
	$(document).ready(function(){
        $("#button1").click(function(){
            $("#map").toggle();
        });
    });

 	function disp(){
	$("#login").click(function() {
		$("input[name=username]").focus();
	});
	}
 	

 $(document).ready(function() {  
	 
              $('#defaultForm').formValidation({  
                    fields:{
              
                          username: {
                          validators: {
                  notEmpty: {
                      message: 'The User name is required'
                  } ,
                  regexp:{
                	  regexp: /^([Admins_001||0-9]{10})$/,
                	  message : 'Username has to be 10 character/digits.'
                  } 
                        }
                    },
                    password: {
                          validators:{
                                notEmpty:
                                      {
                                      message: 'The Password is required'
                                      }
                          }
                    }
                    }
              });
             /*  var remember = $.cookie('remember');
              if ( remember == 'true' ) {
              var username = $.cookie('username');
              var password = $.cookie('password');
              // autofill the fields
              $('#username').attr("value", username);
              $('#password').attr("value", password);
              }
              if ($('#remember').attr('checked')) {
            	  console.log("check");
                  var username = $('#username').attr("value");
                  var password = $('#password').attr("value");
                  // set cookies to expire in 14 days
                  $.cookie('username', username, { expires: 14 });
                  $.cookie('password', password, { expires: 14 });
                  $.cookie('remember', true, { expires: 14 });
                  } else {
                  // reset cookies
                  $.cookie('username', null);
                  $.cookie('password', null);
                  $.cookie('remember', null);
                  } */

      });
      </script>

</html>

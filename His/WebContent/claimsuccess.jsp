<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<%@include file="header.jsp"%>
<body>

	<nav class="navbar navbar-default navbar-fixed-top topnav"
		role="navigation">
	<div class="container topnav">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>


		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="home1.jsp">User Home</a>
				</li>
				<li><a href="logout.jsp">Logout</a>
				</li>
			</ul>
		</div>

	</div>
	</nav>


	<div class="intro-header">

		<div class="container">
			<br> <br> <br>
			<div class="row" align="right">

				<h4>
					Customer Id :
					<%=session.getAttribute("ses_customer_id")%></h4>


				<ul class="nav navbar-nav navbar-center">
					<li><a href="newpolicy.jsp">New Policy</a>
					</li>
					<li><a href="ViewPolicyController">Policy Details</a>
					</li>
					<li><a href="edituser.jsp">Edit User</a>
					</li>
					<li><a href="EditPolicyCheck">Edit Policy</a>
					</li>
					<li><a href="renew.jsp">Renew Policy</a>
					</li>
					<li><a href="claim.jsp">Claim Policy</a>
					</li>
				</ul>
			</div>
			<hr class="section-heading-spacer1">
		</div>



		<br>
		<br>
		<br>
		<br>
		<br>
		<div align="center">
			<h3>Your Claim has been requested successfully!!</h3>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>

		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>

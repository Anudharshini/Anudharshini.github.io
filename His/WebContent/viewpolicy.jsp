<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<%@include file="header.jsp"%>

<body id="load" onload="sessionvalidate()">

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

			<a class="navbar-brand topnav">Welcome <%=request.getAttribute("msg")%></a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="home1.jsp">User Home</a></li>
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<div class="intro-header">

		<div class="container">
			<br> <br> <br>
			<div class="row" align="right">
				<h4>
					Customer Id :
					<%=session.getAttribute("ses_customer_id")%></h4>


				<ul class="nav navbar-nav navbar-center">
					<li><a href="newpolicy.jsp">New Policy</a></li>

					<li><a href="ViewPolicy">Policy Details</a>
					</li>
					<li><a href="edituser.jsp">Edit User</a></li>
					<li><a href="EditPolicyCheck">Edit Policy</a></li>
					<li><a href="renew.jsp">Renew Policy</a></li>
					<li><a href="claim.jsp">Claim Policy</a></li>
				</ul>
			</div>

		</div>
	</div>
	</body>
	<%@include file="footer.jsp"%>
	</html>
<%@page import="com.cognizant.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@include file="header.jsp"%>
<body>

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
			<%
				UserBean ub = (UserBean)request.getAttribute("msg");
			%>
			<a class="navbar-brand topnav">Thank you for picking us <%=ub.getFirst_name() %></a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">

				<li><a href="index.jsp">Home</a>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<div class="banner">

		<div class="container">

			<div class="row">
				<div class="col-lg-5 col-sm-6">
					<hr class="section-heading-spacer">
					<div class="clearfix"></div>
					<h2 class="section-heading">
						Registration Completed Successfully<br>
					</h2>


					<br> <br> <br> <br>
					<h4>
						Your Customer ID is
						<%=ub.getCustomer_id() %></h4>

					<br> <a href="index.jsp#login" class="btn" style="color: #fff"><h5>Login
						Here</h5></a>
				</div>
			</div>
		</div>
		<div class="banner">
			<p class="lead">
			<div align="center">
				<marquee behavior="scroll">
					<p style="float: left; font-size: 14px; clear: both; color: #29abe2; font-family: Arial; font-weight: bold;">
						Do remember your Customer ID</p>
				</marquee>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>

</html>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%try{ %>
<%@include file="header.jsp"%>
<body id="load" onload="sessionvalidate()">

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

			<a class="navbar-brand topnav">Welcome Admin</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="admin.jsp">Admin Home</a></li>
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="intro-header">

		<div class="container">
			<br> <br> <br>
			<div class="row" align="right">

				<ul class="nav navbar-nav navbar-center">
					<li><a href="AdminApprove">Approved Policies</a></li>

					<li><a href="AdminReject">Rejected Policies</a>
					</li>
					<li><a href="AdminHome">Pending Policies</a></li>
					<!-- <li><a href="ViewClaim">View Claims</a></li> -->
					<li><a href="ViewApprovedClaim">Approved Claims</a></li>
					<li><a href="ViewRejectedClaim">Rejected Claims</a></li>
					<li><a href="ViewClaim">Pending Claims</a>
				</ul>
			</div>
			<hr class="section-heading-spacer">
		</div>
		<br> <br> <br> <br> <br> <br>

		<div align="center">
			<p
				style="color: #fff; font-family: Orbitron; font-style: italic; font-size: 27px;">"You
				can't connect the dots looking forward,</p>
			<p
				style="color: #fff; font-family: Orbitron; font-style: italic; font-size: 27px;">you
				can only connect them looking</p>
			<p
				style="color: #fff; font-family: Orbitron; font-style: italic; font-size: 27px;">backwards.
				So you have to trust that the</p>
			<p
				style="color: #fff; font-family: Orbitron; font-style: italic; font-size: 27px;">dots
				will somehow connect in the future"</p>
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
	</div>
	<%@include file="footer.jsp"%>

</body>
<%}catch(Exception e){
	   RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
	//request.setAttribute("policy", usermap);
	disp.forward(request, response);}%>
</html>


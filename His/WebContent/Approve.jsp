<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<%@include file="header.jsp"%>


<body>

	<div align="center">

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
				<a class="navbar-brand topnav">Welcome Admin</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">

					<li><a href="admin.jsp">Admin Home</a></li>


					<li><a href="logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
		</nav>

		<div class="intro-header1">
			<div class="container">
				<br> <br> <br>
				<div class="row" align="right">

					<ul class="nav navbar-nav navbar-center">
						<li><a href="AdminApprove">Approved Policies</a>
						</li>

						<li><a href="AdminReject">Rejected Policies</a></li>
						<li><a href="AdminHome">Pending Policies</a>
						</li>
						<!-- <li><a href="ViewClaim">View Claims</a></li> -->
						<li><a href="ViewApprovedClaim">Approved Claims</a>
						</li>
						<li><a href="ViewRejectedClaim">Rejected Claims</a>
						</li>
						<li><a href="ViewClaim">Pending Claims</a>
					</ul>
				</div>
	<hr class="section-heading-spacer">
			</div>

			<div class="intro-header">
				<div class="container">

								<h3>You have successfully approved the policy</h3>
								<br /> <br />
								<h3>
									The Policy No:<%=request.getAttribute("policy_id") %></h3>
								<br /> <br />

							</div>
						</div>
					</div>

				</div>
		
	<%@include file="footer.jsp"%>

</body>

</html>
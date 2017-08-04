<%@page import="com.cognizant.beans.UserBean"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.cognizant.beans.ClaimBean"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="header.jsp"%>

<body id="load" onload="sessionvalidate()">

	<div align="center">
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
	</div>
	</nav>
	<!-- Header -->
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
					<!-- <li><a href="ViewClaim">View Claims</a> -->
					<li><a href="ViewApprovedClaim">Approved Claims</a></li>
					<li><a href="ViewRejectedClaim">Rejected Claims</a></li>
					<li><a href="ViewClaim">Pending Claims</a>
				</ul>
			</div>



			<%
				Map<Integer, ClaimBean> empmap = (Map<Integer, ClaimBean>) request.getAttribute("claim");
					if(!empmap.isEmpty()){
			%>
			<div class="container">
				<div class="row" align="center">
					<hr class="section-heading-spacer">
					<div class="clearfix"></div>
					<h1>
						<font color="#fff">Registered Claim Details</font>
					</h1>
					<table id="mytable" class="display" cellspacing="0" width="100%">
						<thead bgcolor="#ffffff">
							<tr>
								<th>S.no</th>
								<th>Customer ID</th>
								<th>Policy ID</th>
								<th>Claim Type</th>
								<th>Claim Amount</th>

								<th>Death Certificate</th>
								<th>Police Verification Document</th>
								<th>Check</th>




							</tr>
						</thead>
						<tbody>
							<%
								Iterator<Map.Entry<Integer,ClaimBean>> it = empmap.entrySet().iterator();
																	while(it.hasNext()){
																	Map.Entry<Integer,ClaimBean> myentry = it.next();
							%>
							<tr>
								<td><%=myentry.getKey() %></td>
								<td><%=myentry.getValue().getCustomer_id() %></td>
								<td><%=myentry.getValue().getPolicy_id() %></td>
								<td><%=myentry.getValue().getClaim_type() %></td>
								<td><%=myentry.getValue().getClaim_amount() %></td>

								<td><a
									href="Download?customer_id=<%=myentry.getValue().getCustomer_id() %>&file1=<%=myentry.getValue().getFile1() %>"><font
										color=#3385ff>View</font> </a>
								</td>
								<%if(myentry.getValue().getFile2()==null || myentry.getValue().getFile2().equals("")) {%>
								<td>Not Applicable</td>
								<%}
      else
      {%>
								<td><a
									href="Download?customer_id=<%=myentry.getValue().getCustomer_id() %>&file1=<%=myentry.getValue().getFile2() %>"><font
										color=#3385ff>View</font> </a>
								</td>

								<%    }
      
%>


								<td>
									<form action="Claim" method="post">
										<input type="hidden" name="id"
											value="<%=myentry.getValue().getPolicy_id() %>"> <input
											type="submit" class="claim form-control" value="Check">
									</form></td>

							</tr>
							<%}
}
else
{%>
							<div class="container">
								<!-- <div class="row" align="center"> -->
								<hr class="section-heading-spacer">
								<div class="clearfix"></div>
								<br> <br>
								<br>
								<br>
								<br> <br>
								<h1>
									<font color="#fff">No Pending Claims</font>
								</h1>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br>
								<br>
							</div>
							<%} %>
						</tbody>
					</table>

				</div>
			</div>
		</div>

<br><br><br><br><br><br>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			//testing
			$('#mytable').dataTable();
		});
	</script>
	
	<%@include file="footer.jsp"%>
</body>
</html>

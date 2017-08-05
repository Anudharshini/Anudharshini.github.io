<%@page import="com.ours.beans.UserBean"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.ours.beans.ClaimBean"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="header.jsp"%>

<body id="load" onload="sessionvalidate()">

	<div align="center">

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

					<li><a href="admin.jsp">Admin Home</a>
					</li>


					<li><a href="logout.jsp">Logout</a>
					</li>

				</ul>
			</div>
		</div>
	</div>
	</nav>

	<div class="intro-header1">
		<div class="container">
			<br> <br> <br>
			<div class="row" align="right">

				<ul class="nav navbar-nav navbar-center">
					<li><a href="AdminApprove">Approved Policies</a></li>

					<li><a href="AdminReject">Rejected Policies</a>
					</li>
					<li><a href="AdminHome">Pending Policies</a></li>

					<li><a href="ViewApprovedClaim">Approved Claims</a>
					</li>
					<li><a href="ViewRejectedClaim">Rejected Claims</a>
					</li>
					<li><a href="ViewClaim">Pending Claims</a>
				</ul>
			</div>



			<%
				Map<Integer, ClaimBean> empmap = (Map<Integer, ClaimBean>) request.getAttribute("approveclaim");
					if(!empmap.isEmpty()){
			%>
			<div class="container">
				<!-- <div class="row" align="center"> -->
				<hr class="section-heading-spacer">
				<div class="clearfix"></div>
				<h1>
					<font color="#fff">Approved Claim Details</font>
				</h1>
				<table id="mytable" class="display" cellspacing="0" width="100%">
					<thead bgcolor="#ffffff">
						<tr>
							<th>S.no</th>
							<th>Customer ID</th>
							<th>Policy ID</th>
							<th>Claim Type</th>
							<th>Claim Amount</th>

							<th>Status</th>
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
							<td><%=myentry.getValue().getStatus() %></td>

							<%}
}
else
{%>
							<br>
							<br>
							<h1>
								<font color="#fff">No Approved Claims</font>
							</h1>
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
							<%} %>
						
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>


</body>

<script type="text/javascript">
		$(document).ready(function() {
			//testing
			$('#mytable').dataTable();
		});
	</script>
</html>

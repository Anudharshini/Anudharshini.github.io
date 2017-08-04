<%@page import="com.cognizant.beans.UserBean"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.cognizant.beans.PolicyBean"%>
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

			</div>
			<%
  	Map<Integer, PolicyBean> empmap = (Map<Integer, PolicyBean>) request.getAttribute("approvepolicy");
      if(!empmap.isEmpty()){
  %>

			<div class="container">

				<hr class="section-heading-spacer">
				<div class="clearfix"></div>

				<h1>
					<font color="#fff">Approved Policy Details</font>
				</h1>

				<table id="tab" class="display" cellspacing="0" width="100%">
					<thead bgcolor="#ffffff">
						<tr>
							<th>S.no</th>
							<th>Customer ID</th>
							<th>Policy ID</th>
							<th>Insurance Name</th>
							<th>Policy Amount</th>
							<th>Policy Duration</th>
							<th>Premium Type</th>
							<th>Policy Start Date</th>
							<th>Discount</th>
							<th>Premium Amount</th>
							<th>Maturity Date</th>
							<th>Status</th>

						</tr>
					</thead>
					<tbody bgcolor="#ffffff">
						<%
		Iterator<Map.Entry<Integer,PolicyBean>> it = empmap.entrySet().iterator();
			while(it.hasNext()){
			Map.Entry<Integer,PolicyBean> myentry = it.next();
	%>
						<tr>
							<td><%=myentry.getKey() %></td>
							<td><%=myentry.getValue().getCustomer_id() %></td>
							<td><%=myentry.getValue().getPolicy_id() %></td>
							<td><%=myentry.getValue().getInsurance_name() %></td>
							<td><%=myentry.getValue().getPolicy_amount() %></td>
							<td><%=myentry.getValue().getPolicy_duration() %></td>
							<td><%=myentry.getValue().getPremium_type() %></td>
							<td><%=myentry.getValue().getPolicy_start_date() %></td>
							<td><%=myentry.getValue().getDiscount() %></td>
							<td><%=myentry.getValue().getPremium_amount() %></td>
							<td><%=myentry.getValue().getMaturity_date() %></td>
							<td><%=myentry.getValue().getStatus() %></td>
							<%-- <form action="Approve" method="post">
<input type="hidden" name="id" value="<%=myentry.getValue().getPolicy_id() %>">
<input type="submit" class="approve form-control" value="Approve"></form>
</td>
<td>
<form action="Reject" method="post">
<input type="hidden" name="id" value="<%=myentry.getValue().getPolicy_id() %>">
<input type="submit" class="reject form-control" value="Reject"></form>
</td> --%>
						</tr>
						<%}}
else
{%>
						<br>
						<br>
						<h1>
							<font color="#fff">No Approved Policies</font>
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


	<script type="text/javascript">
		$(document).ready(function() {
			//testing
			$('#tab').DataTable();
		});
	</script>
	<%@include file="footer.jsp"%>
</body>
</html>

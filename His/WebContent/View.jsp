<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.cognizant.beans.PolicyBean"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@include file="header.jsp"%>
<body id="load" onload="sessionvalidate()">
<div align="center">
<!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <div class="container topnav">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand topnav">Welcome <%=session.getAttribute("ses_first_name")%></a> 
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="userhome.jsp">User Home</a></li>
                    <li>
                    	
                        <a href="logout.jsp">Logout</a>
                    </li>
                    
                </ul>
            </div>
            </div></div>
    </nav>
<!-- Header -->
    
    <div class="intro-header1">
		<br><br><br>
		<div class="container">
		
			<div class="row" align="right">
				
				<h4><font color=#fff>	Customer Id :
					<%=session.getAttribute("ses_customer_id")%></font></h4>
			<%
				if(session.getAttribute("insured_type").equals("dependant")) {
			%>

				<ul class="nav navbar-nav navbar-center">
					<li><a href="newpolicy.jsp">New Policy</a></li>
					<li><a href="ViewPolicy">Policy Details</a></li>
					<li><a href="edituser.jsp">Edit User</a></li>
					<li><a href="EditPolicyCheck">Edit Policy</a></li>
					<li><a href="renew.jsp">Renew Policy</a></li>
					<li><a href="claim.jsp">Claim Policy</a></li>
					 <li><a href="ViewUserClaims">Claim Details</a>
                              </li>
				</ul>
				 </div>
					<hr class="section-heading-spacer1">
					</div> 
				 <%
 				 	} else if(session.getAttribute("insured_type").equals("self")) {
 				 %>
                      
                        
                         <ul class="nav navbar-nav navbar-center">
                              <li><a href="newpolicy.jsp">New Policy</a>
                              </li>

                              <li><a href="ViewPolicy">Policy Details</a></li>
                              <li><a href="edituser.jsp">Edit User</a>
                              </li>
                              <li><a href="editpolicy.jsp">Edit Policy</a>
                              </li>
                              <li><a href="renew.jsp">Renew Policy</a>
                              </li>
                        </ul>
                        </div>
                            <hr class="section-heading-spacer2">
            </div>
                        <%
                        	}
                        %>
			
			<%
							Map<Integer, PolicyBean> empmap = (Map<Integer, PolicyBean>) request.getAttribute("policy");
															if(!empmap.isEmpty()){
						%>
			<div class="container">

			<div class="row"  align="center">
				
					<!-- <hr class="section-heading-spacer1">
					<div class="clearfix"></div> -->
					 
				<h2><font color="#fff">Registered Policy Details</font></h2>
		
		<table id="tab" class="display" cellspacing="0" width="100%">
		<thead bgcolor="#ffffff">
			<tr>
				<th>S.no</th>
				
				<th>Policy Id</th>
				 <th>Insurance Name</th>
				 <th>Policy Amount</th>
				  <th>Policy Duration</th> 
				  <th>Premium Type</th> 
				 <th>Policy Start Date</th> 
				 <th>Discount</th> 
				  <th>Premium Amount</th> 
				  <th>Maturity Date</th> 
				  <th>Status</th> 
				  
			</tr></thead>
			<tbody>
			<%
				Iterator<Map.Entry<Integer,PolicyBean>> it = empmap.entrySet().iterator();
						while(it.hasNext()){
						Map.Entry<Integer,PolicyBean> myentry = it.next();
			%>
			<tr align="center">
				<td><h5><%=myentry.getKey() %></h5></td>
				
				<td><h5><%=myentry.getValue().getPolicy_id() %></h5></td>
				<td><h5><%=myentry.getValue().getInsurance_name() %></h5></td>
				<td><h5><%=myentry.getValue().getPolicy_amount() %></h5></td>
				<td><h5><%=myentry.getValue().getPolicy_duration() %></h5></td>
				<td><h5><%=myentry.getValue().getPremium_type() %></h5></td>
				<td><h5><%=myentry.getValue().getPolicy_start_date() %></h5></td>
				<td><h5><%=myentry.getValue().getDiscount() %></h5></td>
				<td><h5><%=myentry.getValue().getPremium_amount() %></h5></td>
				<td><h5><%=myentry.getValue().getMaturity_date() %></h5></td>
				<td><h5><%=myentry.getValue().getStatus() %></h5></td>
				<%}}
else
{%>
<br><br>
<h1><font color="#fff">You have no Registered Policies</font></h1>
<br><br><br><br><br><br><br><br><br><br><br><br>
<%} %>
				
				</tr>
				</tbody>
				</table>
				</div></div></div>
				</div>
				<script type="text/javascript">
		$(document).ready(function() {
			//testing
			$('#tab').DataTable();
		});
	</script>
	
</body>
<%@include file="footer.jsp"%>
</html>
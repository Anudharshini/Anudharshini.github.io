<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<%@include file="header.jsp"%>
<body id="load" onload="sessionvalidate()">


	<div class="navbar navbar-default navbar-fixed-top topnav"
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
				<a class="navbar-brand topnav">Welcome <%=session.getAttribute("ses_first_name")%></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="userhome.jsp">User Home</a>
					</li>
					<li><a href="logout.jsp">LogOut</a>
					</li>
				</ul>
			</div>

		</div>

	</div>

	<div class="intro-header">

		<div class="container">
			<br> <br> <br>
			<div class="row" align="right">
				<h4>
					Customer Id :
					<%=session.getAttribute("ses_customer_id")%></h4>

<% if(session.getAttribute("insured_type").equals("dependant")) {%>
				<ul class="nav navbar-nav navbar-center">
					<li><a href="newpolicy.jsp">New Policy</a>
					</li>
					<li><a href="ViewPolicy">Policy Details</a>
					</li>
					<li><a href="edituser.jsp">Edit User</a>
					</li>
					<li><a href="EditPolicyCheck">Edit Policy</a>
					</li>
					<li><a href="renew.jsp">Renew Policy</a>
					</li>
					<li><a href="claim.jsp">Claim Policy</a></li>
					<li><a href="ViewUserClaims">Claim Details</a></li>
				</ul>
			</div>

		</div>
		<% } else if(session.getAttribute("insured_type").equals("self")) { %>
                      
           <!--            <div class="container">
			<br> <br> <br>
			<div class="row" align="right"> -->
                        
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
                        <%} %>
		<br>
		<br>
		<br>
		
		<h3 class="section-heading">
			Policy Edited Successfully<br>
		</h3>

		<div align="center">

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

</body>
<%@include file="footer.jsp"%>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%try{ %>
<%@include file="header.jsp"%>

<body id="load" onload="sessionvalidate()">

	<!-- Navigation -->
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
				<a class="navbar-brand topnav" href="userhome.jsp">User Home</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">

					<li><a href="logout.jsp">LogOut</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</div>
	 <!-- Header -->
    <a name="home"></a>
    <div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                <br><br><br>
                   <h1 class="section-heading">
						Success Policy<br>
					</h1>
					<div class="tab">
						<br><br><br><br>
						<table align="center"  style="width:30%" style="height:30%" style="color:grey" >
						<tr><td align="left"><font color: #fff>Policy Number </font></td><td><font color: #fff><%=request.getAttribute("policy_no") %></font></td></tr>
						<tr><td align="left"><font color: #fff>Premium Amount </font></td><td><font color: #fff><%=request.getAttribute("premium_amount") %></font></td></tr>
						<tr><td align="left"><font color: #fff>Maturity Date</font></td><td><font color: #fff><%=request.getAttribute("maturity_date") %></font></td></tr></table>
						<br><br><br><br><br>
						<a href="UserDownload?customer_id=<%=session.getAttribute("ses_customer_id")%>&file1=<%=request.getAttribute("policy_no") %>">Download Policy Report</a>				
						<br><br>
						</div>
						<div align="center">
						<marquee behavior="scroll">
							<p
								style="float: left; font-size: 14px; clear: both; color: #29abe2; font-family: Arial; font-weight: bold;">
								Do remember your POLICY NUMBER</p>
						</marquee></div>
                </div>
            </div>

        </div>
   </div>
   </body>
   <%@include file="footer.jsp"%>
   <%}catch(Exception e){
	   RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
	//request.setAttribute("policy", usermap);
	disp.forward(request, response);}%>
   
   </html>
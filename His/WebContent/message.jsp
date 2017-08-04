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

                  <a class="navbar-brand topnav">Welcome <%=session.getAttribute("ses_first_name")%></a>
            </div>

            <div class="collapse navbar-collapse"
                  id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav navbar-right">
                        <li><a href="userhome.jsp">User Home</a>
                        </li>
                        <li><a href="logout.jsp">Logout</a>
                        </li>
                  </ul>
            </div>
            <!-- /.navbar-collapse -->
      </div>
      <!-- /.container --> </nav>
	 <!-- Header -->
    <a name="home"></a>
    <div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                <br><br><br><br><br><br><br><br><br>
                   <h1 class="section-heading">
						<%=request.getAttribute("mess") %><br><br><br><br><br><br><br>
					</h1>
					
            </div>

        </div>
        <!-- /.container -->
</div></div>
<%@include file="footer.jsp"%>
</body></html>
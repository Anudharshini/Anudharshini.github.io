
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
      pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<%@include file="header.jsp"%>
<style>
body {
      background-image: url(img/intro-bg.jpg);
}
</style>

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

                  <a class="navbar-brand topnav">Welcome <%=session.getAttribute("ses_nominee_name")%></a>
            </div>

            <div class="collapse navbar-collapse"
                  id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav navbar-right">
                        <li><a href="nomineehome.jsp">Nominee Home</a>
                        </li>
                        <li><a href="logout.jsp">Logout</a>
                        </li>
                  </ul>
            </div>
            <!-- /.navbar-collapse -->
      </div>
      <!-- /.container --> </nav>



      <!-- Header -->
      <!-- <a name="account"></a> -->
      <div class="intro-header">
   
            <div class="container">
                  <br> <br> <br>
                  <div class="row" align="right">
                        <h4>
                              Customer Id :
                              <%=session.getAttribute("ses_customer_id")%></h4>


	
                        <ul class="nav navbar-nav navbar-center">
                              <li><a href="nomineeclaim.jsp">Claim Policy</a>
                              </li>
                              <li><a href="ViewUserClaims">Claim Details</a>
                              </li>
                             
                        </ul>
                       
                        
                        
                        
                  </div>
                  <hr class="section-heading-spacer3">
            </div>
            <br> <br> <br> <br>
          <div align="center"><p style="color:#fff; font-family: Orbitron; font-style:italic; font-size: 27px; ">"Life is a one Time </p>
      <p style="color:#fff; font-family: Orbitron; font-style:italic; font-size: 27px; ">Offer</p>
      <p style="color:#fff; font-family: Orbitron; font-style:italic; font-size: 27px; ">Use it WELL"</p>
            
   
      </div>

<br> <br> <br> <br>
            <br> <br> </div>

     <%@include file="footer.jsp"%>

</body>
</html>



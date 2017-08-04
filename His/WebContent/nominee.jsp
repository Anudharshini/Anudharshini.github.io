
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<%@include file="header.jsp"%>

<body id="load" onload="userSession()">

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

			<%-- <a class="navbar-brand topnav">Welcome <%=request.getAttribute("msg")%></a> --%>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<!-- <li><a href="home1.jsp">User Home</a></li> -->
				<%-- <li><a>Welcome <%=request.getAttribute("msg")%></a></li> --%>
				<li><a href="index.jsp">Home</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>



	<!-- Header -->
	<!-- <a name="account"></a> -->
	<div class="intro-header">

		<div class="container">
			<br> 
			<div class="row" align="right">
				<%-- <h4>
					Customer Id :
					<%=session.getAttribute("ses_customer_id")%></h4> --%>
					<div class="col-lg-5 col-sm-6">
					<hr class="section-heading-spacer4">
					<div class="clearfix"></div>
					<h2 class="section-heading" align="left">
						Nominee Login<br>
					</h2>
					<br> 
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3 form-box">


				 <div class="form-bottom" align="left">
			                    <form role="form"   action="NomineeLogin" method="post" class="login-form" id="defaultForm">
			                    <div class="form-group">
			                    		<label>Customer ID<font color="red">*</font></label>
			                        	<input type="text" name="customerid" class="form-customerid form-control" maxlength="10" id="customerid" autocomplete="off">
			                        </div>
			                    	<div class="form-group">
			                    		<label>Nominee name<font color="red">*</font></label>
			                        	<input type="text" name="nominee_name" class="form-username form-control" id="nominee_name" autocomplete="off">
			                        </div>
			                        <div class="form-group">
			                        	<label>Password<font color="red">*</font></label>
			                        	<input type="password" name="password" class="form-password form-control" id="password">
			                        </div>
			                        <button type="submit" class="btn">Sign in!</button><br>
			                       
			                    </form>
		                    </div></div></div></div>
			</div>

		</div>
		<br>
	<br>
	<br>
	
<br><br>	
	
	</div>
	

	
 <script type="text/javascript">
  $(document).ready(function() {  
	 
              $('#defaultForm').formValidation({  
            	  button:{
                    	selector: '[type="submit"]',
                    	disabled: ''
                    },
                    fields:{
              customerid:{
            	  validators:{
            		  notEmpty: {
            			  message: 'Enter Customer ID'
            		  },
            		  regexp: {
                          regexp: /^([0-9]{10,10})?$/,
                          message : 'Customer id incorrect'
                    }
            	  }
              },
                    	nominee_name: {
                          validators: {
                  notEmpty: {
                      message: 'The Nominee name is required'
                  } ,
                  regexp:{
                	  regexp: /^([a-z||A-Z]{4,50})$/,
                	  message : 'Check Nominee name'
                  } 
                        }
                    },
                    password: {
                          validators:{
                                notEmpty:
                                      {
                                      message: 'The Password is required'
                                      }
                          }
                    }
                    }
              });
      });</script>
   <%@include file="footer.jsp"%>
</body>
</html>

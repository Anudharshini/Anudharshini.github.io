
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%try{ %>
<%@include file="header.jsp"%>

<body id="load" onload="getRenewpolicy();sessionvalidate()">

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
	<!-- <a name="account"></a> -->
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

					<li><a href="ViewPolicy">Policy Details</a></li>
					<li><a href="edituser.jsp">Edit User</a>
					</li>
					<li><a href="EditPolicyCheck">Edit Policy</a>
					</li>
					<li><a href="renew.jsp">Renew Policy</a>
					</li>
					<li><a href="claim.jsp">Claim Policy</a>
					</li>
					<li><a href="ViewUserClaims">Claim Details</a></li>
				</ul>
			</div>
			<hr class="section-heading-spacer1">
		</div>
		<% } else if(session.getAttribute("insured_type").equals("self")) { %>


		<ul class="nav navbar-nav navbar-center">
			<li><a href="newpolicy.jsp">New Policy</a></li>

			<li><a href="ViewPolicy">Policy Details</a>
			</li>
			<li><a href="edituser.jsp">Edit User</a></li>
			<li><a href="editpolicy.jsp">Edit Policy</a></li>
			<li><a href="renew.jsp">Renew Policy</a></li>
		</ul>
	</div>
	<hr class="section-heading-spacer2">
	</div>
	<%} %>
	<div class="container">

		<div class="row">
			<div class="col-lg-5 col-sm-6">

				<h2 class="section-heading">
					Renew Policy &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
				</h2>

				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<br>
						<div class="form-bottom" align="left">
							<form id="defaultForm" action="RenewPolicy" method="post">
								<div class="form-group">
									<label>Policy ID</label> <select name="policy_id"
										class="form-control" id="policy_id" required
										autocomplete="off">
										<option value="">--Select Policy ID--</option>
									</select> <input type="hidden" id="cust_id" name="cust_id"
										value="<%=session.getAttribute("ses_customer_id") %>">
								</div>
								<input type="submit" class="btn" id="submit-button" name="Renew"
									value="Renew"> <input type="reset" class="btn"
									value="Reset">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	</div>

	<script src="js/jquery.js"></script>
	<script type="text/javascript">
      $(document).ready(function() {
            $('#defaultForm').formValidation({
                  button : {
                        selector : '[type="submit"]',
                        disabled : ''
                  },
                  fields : {
                        policy_id : {
                              validators : {
                                    notEmpty : {
                                          message : 'The Policy ID is required'
                                    },
                                    stringLength : {
                                          min : 4,
                                          max : 4,
                                          message : 'The Policy ID should have 4 digits'
                                    }
                              }
                        }
                  }
            });

      });
      
      </script>
	<script type="text/javascript">
     function getRenewpolicy(){
		 
		 var xhttp;
		 document.getElementById("cust_id").value="<%=session.getAttribute("ses_customer_id")%> "; 
		 var val=document.getElementById("cust_id").value;
		
		
		 xhttp = new XMLHttpRequest();
		 xhttp.onreadystatechange = function() {
		 if (xhttp.readyState == 4 && xhttp.status == 200) {

			
		 var resp1 = JSON.parse(xhttp.responseText);
		
		for(var i=0;i<resp1.details.length;i++)
		 document.getElementById("policy_id").innerHTML+="<option value="+resp1.details[i].value+">"+resp1.details[i].value+"</option>";
		
		 }
		 };
		 xhttp.open("GET", "GetPolicyDetailRenew?customer_id="+val, true);
		 xhttp.send();
		
		 
		 }
    
        
</script>
	<%@include file="footer.jsp"%>
</body>
<%}catch(Exception e){
	   RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
	//request.setAttribute("policy", usermap);
	disp.forward(request, response);}%>
</html>

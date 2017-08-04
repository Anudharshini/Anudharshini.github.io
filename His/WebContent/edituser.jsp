
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%try{ %>
<%@include file="header.jsp"%>

<body onload="setHide()">

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
					 <li><a href="ViewUserClaims">Claim Details</a>
                              </li>
				</ul>
				
				 </div>
					<hr class="section-heading-spacer1">
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
			
	<div class="container">

			<div class="row">
				<div class="col-lg-5 col-sm-6"> 
					
						
					<h2 class="section-heading">
						Edit User Details<br>
					</h2>

					<div class="row">
						<div class="col-sm-6 col-sm-offset-3 form-box">
							<br>
							<div class="form-bottom" align="left">
								<form role="form" id="defaultForm" action="EditUser"
									method="post">
									<div class="form-group">
										<label>Customer ID</label> <input type="text" name="cust_id"
											class="form-control" readonly="readonly"
											value="<%=session.getAttribute("ses_customer_id")%>">
									</div>
									<input type="hidden" name="customer_id" value="<%=session.getAttribute("ses_customer_id")%>">
									<div class="form-group">
										<label>Change Password</label> <select name="change_pass"
											class="change_pass form-control" onchange="getPassword()"
											id="change_pass">
											<option value=" ">--</option>
											<option value="yes">Yes</option>
											<option value="no">No</option>

										</select>

									</div>
									<div class="form-group">
										<label id=label1>New Password</label> <input type="password"
											name="password" class="form-control" id="password">
									</div>
									<div class="form-group">
										<label id=label2>Retype-Password</label> <input
											type="password" name="retype" class="form-control"
											id="retype">
									</div>
									<div class="form-group">
										<label>Email</label> <input type="email" name="email"
											class="form-control" id="email"
											value="<%=session.getAttribute("ses_email_id")%>">
									</div>

									<div class="form-group">
										<label>Mobile Number</label> <input type="text"
											name="contact_no" class="contact_no form-control"
											id="contact_no"
											value="<%=session.getAttribute("ses_contact_no")%>">
									</div>
									<div class="form-group">
										<label>UserName</label> <input type="text" name="user_name"
											class="form-control" id="user_name"
											value="<%=session.getAttribute("ses_user_name")%>">
									</div>
									<input type="submit" class="btn" id="submit-button"
										name="Update" value="Update"> <input type="reset"
										class="btn" value="Reset">

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<!-- <script src="js/jquery.js"></script> -->
<script type="text/javascript">
      $(document).ready(function() {  
    	
              $('#defaultForm').formValidation({            
                  button: {            
                        selector: '[type="submit"]',            
                        disabled: ''
                    },
        fields: { 
            user_name: {               
                validators: {
                    notEmpty: {
                        message: 'The user name is required'
                    }
                ,stringLength: {                      
                    min: 5,
                    max: 50,
                    message: 'The user name should be between 5-50 characters'
                }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required'
                    },
                    different: {
                        field: 'user_name',
                        message: 'The password cannot be the same as first name'
                    },
                    stringLength: {
                        min: 8,
                        max: 20,
                        message: 'The password must be more than 8 characters.'
                    },
                    regexp: {
                        regexp: /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}$/,
                        message: 'The password should have a Uppercase, Lowercase & Number'
                    }
                }
            },
            retype: {
                validators: {
                    notEmpty: {
                        message: 'The password is required.'
                    },
                    identical: {
                        field: 'password',
                        message: ' The password should be same'
                    }
                }
            },
           email: {
                validators: {
                  regexp: {
                        regexp:  /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/,
                        message: 'The email format is incorrect'
                    },
                    notEmpty: {
                        message: 'The email is required.'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }                    
                    } 
              },
            
              contact_no: {                 
                  validators: {
                      notEmpty: {
                          message: 'The contact number is required'
                      },regexp: {
                          regexp: /^([7-9]{1})([0-9]{9,9})?$/,
                          message : 'Mobile number incorrect'
                    }
                  }
              }
        }    
                });

                  });   
      function getPassword(){
			var type=document.getElementById("change_pass").value;
			
			if(type == "no" || type==" ")
				{
				
				$("#label1").hide(300);
				$("#password").hide(300);
				$("#label2").hide(300);
				$("#retype").hide(300);
				}
			else
			{
				$("#label1").show(300);
				$("#password").show(300);
				$("#label2").show(300);
				$("#retype").show(300);
				}
		}
      </script>
      <script type="text/javascript">
function setHide(){
	console.log("ting");
		$("#label1").hide();
		$("#password").hide();
		$("#label2").hide();
		$("#retype").hide();
}
</script>
<%@include file="footer.jsp"%>
<%}catch(Exception e){
	   RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
	//request.setAttribute("policy", usermap);
	disp.forward(request, response);}%>
</html>

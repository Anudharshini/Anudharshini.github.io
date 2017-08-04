<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
<%try{
	%>
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
					<li><a id="active" href="newpolicy.jsp">New Policy</a>
					</li>
					<li><a href="ViewPolicy">Policy Details</a>
					</li>
					<li><a href="edituser.jsp">Edit User</a>
					</li>
					<li><a href="editpolicy.jsp">Edit Policy</a>
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

				<!-- <div class="clearfix"></div> -->
				<h2 class="section-heading">
					Policy Registration<br>
				</h2>
				<br>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">


						<div class="form-bottom">
							<form role="form" id="defaultForm" action="Policy" method="post"
								class="login-form">
								<div class="form-group" align="left">
									<label>Insurance Name<font color="red">*</font>
									</label> <select name="insurance_name"
										class="insurance_name form-control" id="insurance_name"
										onchange="getDetail(this.value)">
										<option value="">--Select Insurance Type--</option>
										<option value="Accident related ">Accident related</option>
										<option value="Physical condition">Physical condition</option>

										<option value="Occupational related ">Occupational
											related</option>
										<option value="Environment related ">Environment
											related</option>
										<option value="Life style related ">Life style
											related</option>
										<option value="Travel related ">Travel related</option>

									</select>
								</div>
								<div class="form-group" align="left">

									<label>Policy Amount<font color="red">*</font>
									</label> <select name="policy_amount" class="policy_name form-control"
										id="policy_amount">
										<option value=""></option>
									</select>
								</div>
								<div class="form-group" align="left">

									<label>Policy Duration<font color="red">*</font>
									</label> <select name="policy_duration"
										class="policy_duration form-control" id="policy_duration">
										<option value=""></option>
									</select>
								</div>
								<div class="form-group" align="left">

									<label>Premium Type<font color="red">*</font>
									</label> <select name="premium_type" class="premium_type form-control"
										id="premium_type">
										<option value="">--Select Insurance Type--</option>
										<option value="Yearly">Yearly</option>
										<option value="Half-yearly">Half-yearly</option>

									</select>
								</div>

								<div class="form-group" align="left">

									<label>Policy Start Date<font color="red">*</font>
									</label> <input type="date" name="policy_date"
										class="policy_date form-control" id="policy_date">
								</div>
								<input type="submit" id="submit-btn" class="btn"
									value="Register"> <input type="reset" class="btn"
									value="Reset">

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<script type="text/javascript">
      $(document).ready(function() {  
        console.log("hello");
              $('#defaultForm').formValidation({            
                button:{
                  selector: '[type="submit"]',
                  disabled: ''
                }, 
        fields: { 
            insurance_name:{
                  validators: {
                        notEmpty:{
                              message: 'Select Insurance type'
                        }
                  }
            },
            premium_type:{
                validators: {
                      notEmpty:{
                            message: 'Select Premium type'
                      }
                }
          },
            policy_date: {
                  validators: {
                    notEmpty: {
                        message: 'The date is required'
                    },
                   date: {
                        format: 'MM/DD/YYYY',
                        message: 'The date is not a valid'
                    }
                }
            } 
        }
              });
             /*  $('#defaultForm').keyup(function(){
                    $("input[type=submit]").removeAttr('disabled');
              });  */
      });
        </script>
	<script type="text/javascript">
            function getDetail(str) {
                  var xhttp;

                  xhttp = new XMLHttpRequest();
                  xhttp.onreadystatechange = function() {
                        if (xhttp.readyState == 4 && xhttp.status == 200) {

                              var resp = JSON.parse(xhttp.responseText);
                              document.getElementById("policy_amount").innerHTML = "<option value="+resp.details[0].value0+">"
                                          + resp.details[0].value0 + "</option>";
                              document.getElementById("policy_amount").innerHTML += "<option value="+resp.details[0].value1+">"
                                          + resp.details[0].value1 + "</option>";
                              document.getElementById("policy_duration").innerHTML = "<option value="+resp.details[0].valuex0+">"
                                          + resp.details[0].valuex0 + "</option>";
                              document.getElementById("policy_duration").innerHTML += "<option value="+resp.details[0].valuex1+">"
                                          + resp.details[0].valuex1 + "</option>";
                              console.log(resp.details.length);
                        }
                  };
                  xhttp.open("GET", "GetInsuranceDetail?iname=" + str, true);
                  xhttp.send();
            }
            /* function getDuration(int)
            {
            var xhttp;

            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
            if (xhttp.readyState == 4 && xhttp.status == 200) {

            var resp1 = JSON.parse(xhttp.responseText);
            document.getElementById("policy_duration").innerHTML="<option value="+resp.details[0].valuex0+">"+resp.details[0].valuex0+"</option>";
            document.getElementById("policy_duration").innerHTML+="<option value="+resp.details[1].valuex1+">"+resp.details[1].valuex1+"</option>";
            }
            xhttp.open("GET", "GetInsuranceDetail?iname="+int, true);
            xhttp.send();
            
            }
            } */
      </script>

<%@include file="footer.jsp"%>
</body>
<%}catch
(Exception e){
	RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
	//request.setAttribute("policy", usermap);
	disp.forward(request, response);
	}%>


</html>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<%@include file="header.jsp"%>
<body id="load" onload="getpolicyDetail();sessionvalidate()">

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
						Edit Policy Details<br>
					</h2>
					<br>
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3 form-box">


							<div class="form-bottom" align="left">
								<form role="form" action="EditPolicy" method="post"
									class="login-form" id="defaultForm">
									<div class="form-group">
										<label>Customer ID</label> <input type="text" name="cust_id"
											id="cust_id" class="form-control" readonly="readonly"
											value="">
									</div>
									<div class="form-group">
										<label>Policy ID</label> <select name="policy_id"
											class="poicy_id form-control" id="policy_id">
											<option value="">--Policy Id--</option>
										</select>
									</div>
									<div class="form-group" align="left">
										<label>Insurance Name</label> <select name="insurance_name"
											class="insurance_name form-control" id="insurance_name"
											onchange="getDetail(this.value)">
											<option value="">--Select Insurance name--</option>
											<option value="Accident related ">Accident related</option>
											<option value="Physical condition">Physical
												condition</option>

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

										<label>Policy Amount</label> <select name="policy_amount"
											class="policy_name form-control" id="policy_amount">
											<option value=""></option>
										</select>
									</div>
									<div class="form-group" align="left">

										<label>Policy Duration</label> <select name="policy_duration"
											class="policy_duration form-control" id="policy_duration">
											<option value=""></option>
										</select>
									</div>
									<div class="form-group" align="left">

										<label>Premium Type</label> <select name="premium_type"
											class="premium_type form-control" id="premium_type">
											<option value="">--Select a type--</option>
											<option value="Yearly">Yearly</option>
											<option value="Half-yearly">Half-yearly</option>

										</select>
									</div>

									<input type="submit" id="submit1" class="btn" value="Update">
									<input type="reset" class="btn" value="Reset">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

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
		 function getpolicyDetail()
		 {
		 var xhttp;
		 document.getElementById("cust_id").value="<%=session.getAttribute("ses_customer_id")%>";
		var val=document.getElementById("cust_id").value;
		
		//console.log("val;ue"+val);
		 xhttp = new XMLHttpRequest();
		 xhttp.onreadystatechange = function() {
		 if (xhttp.readyState == 4 && xhttp.status == 200) {

			// var i=0;
		 var resp1 = JSON.parse(xhttp.responseText);
		//console.log(resp1.details.length);
		for(var i=0;i<resp1.details.length;i++)
		 document.getElementById("policy_id").innerHTML+="<option value="+resp1.details[i].value+">"+resp1.details[i].value+"</option>";
		//document.getElementById("policy_id").innerHTML+="<option value="+resp1.details[0].value1+">"+resp1.details[0].valuex1+"</option>";
		 }
		 };
		 xhttp.open("GET", "GetPolicyDetail?customer_id="+val, true);
		 xhttp.send();
		
		 
		 }
	</script>
	<script type="text/javascript">
      $(document).ready(function() {  
        
              $('#defaultForm').formValidation({            
                button:{
                  selector: '[type="submit"]',
                  disabled: ''
                }, 
        fields: { 
        	policy_id:{
                validators: {
                      notEmpty:{
                            message: 'Select Policy ID'
                      }
                }
          },
            insurance_name:{
                  validators: {
                        notEmpty:{
                              message: 'Select Insurance type'
                        }
                  }
            } ,
            premium_type:{
                validators: {
                      notEmpty:{
                            message: 'Select Premium type'
                      }
                }
          } 
             
        }
              });
            /*  $('#defaultForm').keyup(function(){
                    $("input[type=submit]").removeAttr('disabled');
              });   */
      });
        </script>
</body>
<%@include file="footer.jsp"%>
</html>

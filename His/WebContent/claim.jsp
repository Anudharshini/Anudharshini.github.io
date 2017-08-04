<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%try{ %>
<%@include file="header.jsp"%>

<script type="text/javascript">
function setHide(){
	$("#label1").hide();
	$("#police").hide();
}
</script>
<body id="load" onload="getpolicyDetail();sessionvalidate();setHide()">

	<nav class="navbar navbar-default navbar-fixed-top topnav"
		role="navigation">
	<div class="container topnav">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="userhome.jsp">User Home</a></li>
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		</div>

	</div>
	</nav>

	<div class="intro-header">

		<div class="container">
			<br> <br> <br>
			<div class="row" align="right">
				<h4>
					Customer Id :
					<%=session.getAttribute("ses_customer_id")%></h4>
				<% if(session.getAttribute("insured_type").equals("dependant")) {%>

				<ul class="nav navbar-nav navbar-center">
					<li><a href="newpolicy.jsp">New Policy</a></li>
					<li><a href="ViewPolicy">Policy Details</a></li>
					<li><a href="edituser.jsp">Edit User</a></li>
					<li><a href="EditPolicyCheck">Edit Policy</a></li>
					<li><a href="renew.jsp">Renew Policy</a></li>
					<li><a href="claim.jsp">Claim Policy</a></li>
					<li><a href="ViewUserClaims">Claim Details</a></li>
				</ul>
				<% } else if(session.getAttribute("insured_type").equals("self")) { %>


				<ul class="nav navbar-nav navbar-center">
					<li><a href="newpolicy.jsp">New Policy</a></li>

					<li><a href="ViewPolicy">Policy Details</a>
					</li>
					<li><a href="edituser.jsp">Edit User</a></li>
					<li><a href="editpolicy.jsp">Edit Policy</a></li>
					<li><a href="renew.jsp">Renew Policy</a></li>
				</ul>
				<%} %>
			</div>

		</div>
		<div class="container">

			<div class="row">
				<div class="col-lg-5 col-sm-6">
					<hr class="section-heading-spacer1">
					<div class="clearfix"></div>
					<h2 class="section-heading">
						Claiming Policy<br>
					</h2>
					<br>
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3 form-box">


							<div class="form-bottom">
								<form role="form" id="defaultForm" action="Upload" method="post"
									enctype="multipart/form-data" class="login-form" align="left">
									<div class="form-group">
										<label>Customer ID</label> <input type="text" name="cust_id"
											class="form-control" readonly="readonly" id="cust_id"
											value="<%=session.getAttribute("ses_customer_id")%>">
									</div>
									<div class="form-group">
										<label>Policy ID</label> <select name="policy_id"
											class="poicy_id form-control" id="policy_id">
											<option value="">--Policy Id--</option>
										</select>
									</div>
									<div class="form-group" align="left">
										<label>Claim Type<font color="red">*</font>
										</label> <select name="claim_type" class="insurance_name form-control"
											id="claim_type" onchange="getDetail()">
											<option value="">--Select Insurance Type--</option>
											<option value="Physical Condition">Physical
												Condition</option>
											<option value="Accident related">Accident related</option>

											<option value="Occupational related ">Occupational
												related</option>
											<option value="Environment related ">Environment
												related</option>
											<option value="Life style related ">Life style
												related</option>
											<option value="Travel related ">Travel related</option>

										</select>
									</div>

									<div class="form-group">
										<label>Claim Amount<font color="red">*</font>
										</label> <input type="text" name="claim_amount"
											class="claim_amount form-control" id="claim_amount">
									</div>



									<div class="form-group">
										<label>Death Certificate<font color="red">*</font>
										</label> <input type="file" name="uploadDC" class="form-control"
											id="death_certificate" />
									</div>
									<div class="form-group">
										<label id="label1">Police Verification Document<font
											color="red">*</font>
										</label> <input type="file" name="uploadPVD" class="form-control"
											id="police" />
									</div>
									<input type="submit" id="submit-2" class="btn" value="Register">
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
        				message: 'Enter policy id'
        			}
        		}
        	},
        	claim_type:{
        		validators: {
        			notEmpty:{
        				message: 'Select Claim type'
        			}
        		}
        	},
        	claim_amount:{
        		validators: {
        			notEmpty:{
        				message: 'Specify your claim Amount'
        			}
        		}
        	}
        }
              });
          
      });
        </script>
	<script type="text/javascript">
	
		function getDetail(){
			var type=document.getElementById("claim_type").value;
			if(type == "Physical Condition")
				{
				$("#label1").hide(300);
				$("#police").hide(300);
				}
			else
			{
				$("#label1").show(300);
				$("#police").show(300);
				}
		}
		
		
		
		
		
		function getpolicyDetail()
		 {
		 var xhttp;
		 document.getElementById("cust_id").value="<%=session.getAttribute("ses_customer_id")%>";
		var val=document.getElementById("cust_id").value;
		
	
		 xhttp = new XMLHttpRequest();
		 xhttp.onreadystatechange = function() {
		 if (xhttp.readyState == 4 && xhttp.status == 200) {

		
		 var resp1 = JSON.parse(xhttp.responseText);
		
		for(var i=0;i<resp1.details.length;i++)
		 document.getElementById("policy_id").innerHTML+="<option value="+resp1.details[i].value+">"+resp1.details[i].value+"</option>";
		
		 }
		 };
		 xhttp.open("GET", "GetClaimPolicyDetail?customer_id="+val, true);
		 xhttp.send();
		
		 
		 }
	</script>
	<%@include file="footer.jsp"%>
</body>
<%}catch(Exception e){
	   RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
	
	disp.forward(request, response);}%>
</html>
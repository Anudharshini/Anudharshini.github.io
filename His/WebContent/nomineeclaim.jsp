<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<%@include file="header.jsp"%>
<!-- <style>
body {
	background-image: url(img/intro-bg.jpg);
}
</style> -->
<script type="text/javascript">
function setHide(){
	$("#label1").hide();
	$("#police").hide();
}
</script>
<body id="load" onload="getpolicyDetail();sessionvalidate();setHide()">

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
				<li><a href="nomineehome.jsp">Nominee Home</a></li>
				<li><a href="logout.jsp">Logout</a></li>
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
					<li><a href="nomineeclaim.jsp">Claim Policy</a></li>
					<li><a href="ViewUserClaims">Claim Details</a></li>
				</ul>
			</div>

		</div>
		<div class="container">

			<div class="row">
				<div class="col-lg-5 col-sm-6">
					<hr class="section-heading-spacer3">
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
	<!-- <script src="media/js/jquery.js"></script> -->
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
           /*  $('#defaultForm').keyup(function(){
            	  $("input[type=submit]").removeAttr('disabled');
              }); */
      });
        </script>
	<script type="text/javascript">
	/* 	function getDetail(str) {
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
		} */
		
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

			// var i=0;
		 var resp1 = JSON.parse(xhttp.responseText);
		//console.log(resp1.details.length);
		for(var i=0;i<resp1.details.length;i++)
		 document.getElementById("policy_id").innerHTML+="<option value="+resp1.details[i].value+">"+resp1.details[i].value+"</option>";
		//document.getElementById("policy_id").innerHTML+="<option value="+resp1.details[0].value1+">"+resp1.details[0].valuex1+"</option>";
		 }
		 };
		 xhttp.open("GET", "GetClaimPolicyDetail?customer_id="+val, true);
		 xhttp.send();
		
		 
		 }
	</script>
<%@include file="footer.jsp"%>
</body>
</html>
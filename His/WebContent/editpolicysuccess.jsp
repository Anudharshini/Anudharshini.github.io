<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@include file="header.jsp"%>
<body>
	<img src="images/health.jpg" width="1350" height="350">
	<div align="center">
		<h1>Edit Policy Details</h1>
	</div>
	<form align="center" action="EditPolicy" method="post">
		<div align="center">

			<table Border="0" cellpadding="5" cellspacing="1">
				<tr>
					<td>
				<tr>
					<td>Customer ID</td>
					<td><input type="text" name="customer_id"
						value="<%=session.getAttribute("ses_customer_id")%>">
					</td>
				</tr>
				<tr>
					<td>Policy ID</td>
					<td><input type="text" name="policy_id" value="">
					</td>
				</tr>
				<tr>
					<td>Insurance Name</td>
					<td><select name="insurance_name" id="insurance"
						onchange="getDetail(this.value)">
							<option value="">--Select a Value--</option>
							<option value="Accident related ">Accident related</option>
							<option value="Physical condition">Physical condition</option>

							<option value="Occupational related ">Occupational
								related</option>
							<option value="Environment related ">Environment related
							</option>
							<option value="Life style related ">Life style related</option>
							<option value="Travel related ">Travel related</option>

					</select></td>
				</tr>
				<tr>
					<td>Policy Amount</td>
					<td><select name="policy_amount" id="policy_amount">
							<option value=""></option>
					</select>
					</td>
				</tr>
				<tr>
					<td>Policy Duration</td>
					<td><select name="policy_duration" id="policy_duration">
							<option value=""></option>

					</select> <br>
					</td>
				</tr>
				<tr>
					<td>Premium Type</td>
					<td><select name="premium_type" id="premium_type">
							<option value="Yearly">Yearly</option>
							<option value="Half-yearly">Half-yearly</option>

					</select></td>
				</tr>
				<!-- <tr>
					<td>Policy Start Date</td>
					<td><input type="date" name="policy_start_date"
						id="policy_start_date" style="width: 170px""><br> <br>
					</td>
				</tr> -->



				<tr>
					<td align="center"><input type="submit" name="Update"
						value="Update" id="submit"></td>
					<td align="center">
						<button value="Reset" type="reset">Reset</button>
					</td>
				</tr>
			</table>
		</div>

	</form>
	<script type="text/javascript">
		function getDetail(str) {
			var xhttp;

			xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {

					var resp = JSON.parse(xhttp.responseText);
					
					document.getElementById("policy_amount").innerHTML="<option value="+resp.details[0].value0+">"+resp.details[0].value0+"</option>";
					document.getElementById("policy_amount").innerHTML+="<option value="+resp.details[0].value1+">"+resp.details[0].value1+"</option>";
					document.getElementById("policy_duration").innerHTML="<option value="+resp.details[0].valuex0+">"+resp.details[0].valuex0+"</option>";
					document.getElementById("policy_duration").innerHTML+="<option value="+resp.details[0].valuex1+">"+resp.details[0].valuex1+"</option>";
				
					console.log(resp.details.length);
					
				}
			};
			xhttp.open("GET", "GetInsuranceDetail?iname="+str, true);
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
</body>
<%@include file="footer.jsp"%>
</html>


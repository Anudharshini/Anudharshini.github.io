<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Health Insurance</title>

<script src="js/jquery.min.js"></script>
<!-- css fileS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/formValidation.css" type="text/css" rel="stylesheet">
<!-- js fileS -->
<script src="js/bootstrap.min.js"></script>

<script src="js/formValidation.js"></script>
<script src="js/bootstrapFormValidation.js"></script>
<script type="text/javascript">
            function setHide(){
            $("#nominee_label").hide();
            
            $("#nominee_label1").hide();
            $("#nominee_label2").hide();
            $("#nominee_name").hide();
            $("#nominee_address").hide();
            $("#nominee_contact").hide();
      }
      </script>


<!-- Bootstrap Core CSS -->


<!-- Custom CSS -->
<link href="css/landing-page.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<%
      Calendar cal = Calendar.getInstance();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      cal.add(Calendar.YEAR, 0);
      String max = sdf.format(cal.getTime());
      cal.add(Calendar.YEAR, -89);
      String min = sdf.format(cal.getTime());
      
%>
<body onload="setHide()">

	<!-- Navigation -->
	<div class="navbar navbar-default navbar-fixed-top topnav"
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
				<a class="navbar-brand topnav" href="index.jsp"></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
				<li><a href="index.jsp#about">About us</a>
				</li>

				<li><a href="index.jsp#contact">Contact us</a>
				</li>
				<li><a href="index.jsp#login" onclick="getfocus()">Login</a>
				</li>
			</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</div>
	<a name="contact"></a>
	<div class="banner">

		<div class="container">

			<div class="row">
				<div class="col-lg-5 col-sm-6">
					<hr class="section-heading-spacer4">
					<div class="clearfix"></div>
					<h2 class="section-heading">
						Registration<br>
					</h2>

					<div class="row">
						<div class="col-sm-6 col-sm-offset-3 form-box">
							<br> <br> <br>
							<div class="form-bottom">
								<form role="form" id="defaultForm" action="Register"
									method="post" class="login-form" autocomplete="off">
									<div class="form-group">
										<label>FirstName<font color="red">*</font> </label> <input
											type="text" name="first_name" class="form-control"
											id="first_name" autocomplete="off">
									</div>
									<div class="form-group">
										<label>LastName<font color="red">*</font> </label> <input
											type="text" name="last_name" class="form-control"
											id="last_name" autocomplete="off">
									</div>
									<div class="form-group">
										<label>UserName<font color="red">*</font> </label> <input
											type="text" name="user_name" class="form-control"
											id="user_name" autocomplete="off">
									</div>
									<div class="form-group">
										<label>Password<font color="red">*</font> </label> <input
											type="password" name="password" class="password form-control"
											id="password" onKeyDown="return DisableControlKey(event)"
											onMouseDown="return DisableControlKey(event)">
									</div>
									<div class="form-group">
										<label>Retype-Password<font color="red">*</font> </label> <input
											type="password" name="retype" class="retype form-control"
											id="retype" onKeyDown="return DisableControlKey(event)"
											onMouseDown="return DisableControlKey(event)">
									</div>
									<div class="form-group">
										<label>Address<font color="red">*</font> </label>
										<textarea type="text" name="address"
											class="address form-control" id="address" autocomplete="off"></textarea>
									</div>
									<div class="form-group">
										<label>City<font color="red">*</font> </label> <input
											type="text" name="city" class="city form-control" id="city"
											autocomplete="off">
									</div>
									<div class="form-group">
										<label>State<font color="red">*</font> </label> <input
											type="text" name="state" class="state form-control"
											id="state" autocomplete="off">
									</div>
									<div class="form-group">
										<label>Country<font color="red">*</font> </label> <input
											type="text" name="country" class="country form-control"
											id="country" autocomplete="off">
									</div>
									<div class="form-group">
										<label>Pincode<font color="red">*</font> </label> <input
											type="text" name="pincode" class="pincode form-control"
											maxlength="6" id="pincode" autocomplete="off">
									</div>
									<div class="form-group">
										<label>Email<font color="red">*</font> </label> <input
											type="text" name="email" class="email form-control"
											id="email" autocomplete="off">
									</div>
									<div class="form-group">
										<label>Gender<font color="red">*</font> </label> <select
											name="gender" class="gender form-control" id="gender">
											<option value="">--Select Gender--</option>
											<option value="Male">Male</option>
											<option value="Female">Female</option>
											<option value="Transgender">Transgender</option>
										</select>

									</div>
									<div class="form-group">
										<label>Mobile Number<font color="red">*</font> </label> <input
											type="text" name="contact_no" maxlength="10"
											class="contact_no form-control" id="contact_no"
											autocomplete="off">
									</div>
									<div class="form-group">
										<label>Date of Birth<font color="red">*</font> </label> <input
											type="date" name="date_of_birth"
											class="date_of_birth form-control" id="date_of_birth"
											onchange="getAge()" max="<%=max%>" min="<%=min %>">
									</div>
									<div class="form-group">
										<label>Age<font color="red">*</font> </label> <input
											type="text" name="age" class="age form-control" id="age"
											readonly>
									</div>
									<div class="form-group">
										<label>Insured Type<font color="red">*</font> </label> <select
											name="insured_type" class="insured_type form-control"
											onchange="getNominee()" id="insured_type">
											<option value="">--Select a Type--</option>
											<option value="self">Self</option>
											<option value="dependant">Dependant</option>
										</select>
									</div>

									<div id="nominee" class="form-group">
										<label id="nominee_label">Nominee Name<font
											color="red">*</font> </label> <input type="text" name="nominee_name"
											class="nominee_name form-control" id="nominee_name"
											autocomplete="off">
									</div>
									<div id="add" class="form-group">
										<label id="nominee_label1">Nominee Address<font
											color="red">*</font> </label>
										<textarea type="text" name="nominee_address"
											class="nominee_address form-control" id="nominee_address"
											autocomplete="off"></textarea>
									</div>
									<div id="mobile" class="form-group">
										<label id="nominee_label2">Nominee Mobile Number<font
											color="red">*</font> </label> <input type="text"
											name="nominee_contact" class="nominee_contact form-control"
											maxlength="10" id="nominee_contact" autocomplete="off">
									</div>

									<input type="submit" class="btn" id="submit-button"
										name="signup" value="Register"> <input type="reset"
										class="btn" value="Reset">

								</form>
							</div>


						</div>

					</div>
				</div>
				<!-- <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                              <h4 class="section1-heading" align="center">
                                    Trust Us and Explore Life<br>
                                    <br>
                              </h4>
                              <img class="img-responsive" src="img/dive1.png" alt="">
                        </div> -->
			</div>
		</div>
		<!-- /.container -->

	</div>
</body>

<script type="text/javascript">

/* var target = $('#insured_type option:selected').val();
console.log(target); */


/* if(target == "dependant")
      {
      $("#nominee").hide();
      
      }
else if (target == "self")
{
      $("#nominee").show();
} */


function DisableControlKey(e) {
    // Message to display
    var message = "Cntrl key/ Right Click Option disabled";
    // Condition to check mouse right click / Ctrl key press
    if (e.which == 17 || e.button == 2) {
    alert("Copy Paste Disabled :)");
    return false;
    }
    }

      $(document).ready(function() {  
            $('#contact_no').keydown(function(event) {
            // Allow special chars + arrows 
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 
                || event.keyCode == 27 || event.keyCode == 13 
                || (event.keyCode == 65 && event.ctrlKey === true) 
                || (event.keyCode >= 35 && event.keyCode <= 39)){
                    return;
            }else {
                // If it's not a number stop the keypress
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
                    event.preventDefault(); 
                }   
            }
        });
            $('#nominee_contact').keydown(function(event) {
                // Allow special chars + arrows 
                if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 
                    || event.keyCode == 27 || event.keyCode == 13 
                    || (event.keyCode == 65 && event.ctrlKey === true) 
                    || (event.keyCode >= 35 && event.keyCode <= 39)){
                        return;
                }else {
                    // If it's not a number stop the keypress
                    if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
                        event.preventDefault(); 
                    }   
                }
            });
            $('#pincode').keydown(function(event) {
            // Allow special chars + arrows 
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 
                || event.keyCode == 27 || event.keyCode == 13 
                || (event.keyCode == 65 && event.ctrlKey === true) 
                || (event.keyCode >= 35 && event.keyCode <= 39)){
                    return;
            }else {
                // If it's not a number stop the keypress
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
                    event.preventDefault(); 
                }   
            }
        });
            
              $('#defaultForm').formValidation({            
                  button: {            
                        selector: '[type="submit"]',            
                        disabled: ''
                    },
        fields: {             
            first_name: {                
                validators: {
                    notEmpty: {
                        message: 'The first name is required'
                    },
                    regexp: {
                        regexp: /^([A-Z||a-z]){1}([A-Z ||a-z]){2,50}$/,
                        message: 'The first name should be between 3-50 characters. The firstname should not start with a space'
                    }
                }
            },
           last_name: {               
                validators: {
                    notEmpty: {
                        message: 'The last name is required'
                    },regexp: {
                        regexp: /^([A-Z||a-z]){4,50}$/,
                        message: 'The last name should be between 4-50 characters without space'
                    }
                }
            },
            user_name: {               
                validators: {
                    notEmpty: {
                        message: 'The user name is required'
                    }
                ,regexp: {
                    regexp: /^([A-Z||a-z||0-9]){4,50}$/,
                    message: 'The user name should be between 4-50 characters without space.The username does not accept special characters.'
                }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required'
                    },
                    different: {
                        field: 'first_name',
                        message: 'The password cannot be the same as first name'
                    },
                    stringLength: {
                        min: 8,
                        max: 20,
                        message: 'The password must be more than 8 characters.'
                    },
                    regexp: {
                        regexp: /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}$/,
                        message: 'The password should have a Uppercase, Lowercase, Number ,'
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
            address: {              
                validators: {
                    notEmpty: {
                        message: 'Fill your address'
                    },stringLength: {
                        min: 25,
                        max: 200,
                        message: 'The address must be more than 25 characters.'
                    }
                   
                }
            },
            city: {                 
                validators: {
                    notEmpty: {
                        message: 'Fill your city'
                    }
            ,regexp: {
                regexp: /^([A-Z||a-z]){2,20}$/,
                message: 'The city name should be min of 2 alphabets'
            }
                }
            },
            state: {                
                validators: {
                    notEmpty: {
                        message: 'Fill your state'
                    }
            ,regexp: {
                regexp: /^([A-Z || a-z]){2,20}$/,
                message: 'The State name should be min of 2 alphabets'
            }
                }
            },
            country: {              
                validators: {
                    notEmpty: {
                        message: 'Fill your country'
                    }
            ,regexp: {
                regexp: /^([A-Z || a-z]){2,20}$/,
                message: 'The country name should be min of 2 alphabets'
            }
                }
            },
            pincode: {              
                validators: {
                    notEmpty: {
                        message: 'Fill your pincode'
                    },
                    regexp: {
                        regexp: /^([1-6]{1})([0-9]{5,5})?$/,
                        message : 'Pincode number incorrect'
                  }
                }
            },
            email: {
                validators: {
                  regexp: {
                        regexp: /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/,
                        message : 'Email format incorrect'
                  },
                
                    notEmpty: {
                        message: 'The email address is required'
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
                        message : 'Phone number incorrect'
                  }
                }
            },
                  date_of_birth: {
                  validators: {
                    notEmpty: {
                        message: 'The date is required'
                    },
                    date: {
                        format: 'MM/DD/YYYY',
                       
                        message: 'The date is not a valid'
                    }
                }
            },
            age: {                  
                validators: {
                    notEmpty: {
                        message: ''
                    }
                }
            },
            insured_type : {
                validators : {
                      notEmpty : {
                            message : 'select Insured type'
                      }
                }
          },
          nominee_contact : {
                validators : {
                      notEmpty : {
                            message : 'The  nominee contact number is required'
                      },
                      regexp: {
                          regexp: /^([7-9]{1})([0-9]{9,9})?$/,
                          message : 'Mobile number incorrect'
                    }
                }
          },
          nominee_name : {
                validators : {
                      notEmpty : {
                            message : 'The nominee name is required'
                      },
                      regexp: {
                          regexp: /^([A-Z||a-z]){4,50}$/,
                          message: 'The nominee name should be between 4-50 characters without space'
                      }
                }
          },
          nominee_address : {
                validators : {
                      notEmpty : {
                            message : 'Fill nominee address'
                      },stringLength: {
                          min: 25,
                          max: 200,
                          message: 'The address must be more than 25 characters.'
                      }
                }
          }

      }    
    });

      });   
      function getAge() {
          var date1 = new Date();
          var dob = document.getElementById("date_of_birth").value;
          var date2 = new Date(dob);
          var pattern =  /^\d{4}\-\d{2}\-\d{2}$/;
          //Regex to validate date format (dd/mm/yyyy)       
          if (pattern.test(dob)) {
              var d1=date1.getDate();
            var m1=date1.getMonth();
              var y1 = date1.getFullYear();
              //getting current year  
              var d2=date1.getDate();
              var m2=date2.getMonth();
             var y2 = date2.getFullYear();
              //getting dob year            
              var age;
              if((m2<m1 || m2==m1)){
                        if(m2==m1 && (d2<d1)){
                              age=y1-y2;
                        }
                        else if(m2==m1||m2<m1){
                              age=y1-y2;
                        }
                        else
                              age=-1;
                  }
              else
                  age=(y1-y2-1);
              if(age>=0){
              //calculating age   
              document.getElementById("age").value = age;
              
              return true;}
              else{
                  alert("Invalid date of birth");
                  false;
              }
          }
      }
            
      function getNominee() {
          var type = document.getElementById("insured_type").value;
          console.log(type);
          if (type == "dependant" || type == " ") {
                $("#nominee_label").hide(400);
                $("#nominee_label1").hide(400);
                $("#nominee_label2").hide(400);
                $("#nominee").hide(400);
                $("#add").hide(400);
                $("#mobile").hide(400);
          } else {
                $("#nominee_label").show(300);
                $("#nominee_label1").show(300);
                $("#nominee_label2").show(300);
                $("#nominee").show(300);
                $("#add").show(300);
                $("#mobile").show(300);
                $("#nominee_name").show(300);
                $("#nominee_address").show(300);
                $("#nominee_contact").show(300);
          }

    }

          </script>

</html>


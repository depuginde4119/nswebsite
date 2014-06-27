<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/nrg.css">

<style>
#volunteer-form 
{
    width:100%;
    height:auto;
    margin-top:40px;
    margin-bottom:20px;
    color:#323D43;
    float:left;
    padding:10px;
    *border:solid 10px #7F9B4E;
   
}
/* Form */

#form_wrapper
{
    margin:0 auto;
    height:auto;
    width:100%;
}

 
/* -----------FORM LAYOUT  ----------- */
 
#form_wrapper h1
{
    font-size:24px;
    font-family:font-bold;
    margin-bottom:20px;
    color:#0066cc;
    text-align:center;
}

#form_wrapper h3
{
    font-family:font-bold;
    margin-bottom:15px;
    color:#7F9B4E;
    text-align:left;
}
#form_wrapper select 
{
    width:220px;
}
#form_wrapper label{
 
margin-bottom:18px;
font-weight:bold;
text-align:right;
display:block;
}
#form_wrapper .small{
color:#666666;
font-size:11px;
font-weight:normal;
text-align:right;
display:block;
}

.col-1
{
 
    width:40%;
    float:left;
}
.col-2
{
    width:55%;
    float:right;  
}

.inputfield input[type=text] {
	width:350px;
	}
	
.inputfield select {
	width:380px !important;
	}

/* Form */

</style>

  <script type="text/javascript" src="./js/jquery-1.9.1.js"></script>
          <script type="text/javascript" src="./js/jquery.validate.js"></script>
<script type="text/javascript" src="./js/jquery-form.js"></script>
 <script type="text/javascript">
        $(document).ready(function(){
        
		$("#registerForm").validate({
				rules : {
					name : {
						required : true
					},

					phone : {
						required : true
					},
					email : {
						required : true,
						email : true,
 						checkUserName : true
					},
					
					password : {
						required : true
					},
					cpassword : {
						equalTo : "#password"
					}

				},
				messages : {
					name : {
						required : "Name is required"
					},
					
					phone : {
						required : "Phone number is required"
					},
					email : {
						required : " Email is required",
						email : "Enter valid email"
					},
					password : {
						required : "Password is required"
					},
					cpassword : {
						equalTo : "Passwords did not match"
					}

				},
				errorElement : "div",
				errorPlacement : function(error, element) {
					element.before(error);
					offset = element.offset();
					error.css('left', offset.left);
					error.css('bottom', offset.top - element.outerHeight());
				},
				submitHandler : function(form) {
					$(form).ajaxSubmit({
						url : "user/userRegistration",
						type : "POST",
						data : $("#registerForm").serialize(),
						success : function(msg) {
							alert('Account Added Successfully');
							$("#registerForm").resetForm();
							
						},
						error : function(e) {
							alert("Please try again later");
						}
					});
				}
			});
			$.validator.addMethod("checkUserName", function(value, element) {
				var result = false;
				$.ajax({
					type : "POST",
					async : false,
					data : {"email":$("#email").val()},
					url : "user/check_email_availability",
					success : function(data) {
						result = (data == 'Y') ? false : true;
					},
					error : function(e) {
						alert("Please try again later");
					}
				});

				return result;
			}, "This email is already taken! Try another.");
		});
	</script>
   
</head>
<body>

<%@include file="/WEB-INF/jsp/header.jsp" %>
<div class="bodyContent">
<div class="constrain contactus_banner banner centered " >
</div>
<div class="contact_us_container constrain centered ">
<!-- <div id="form_container" style="padding:50px;"> -->
	
		
<!-- 		<form id="registerForm" name="registerForm" method="post" action="" autocomplete="off"> -->
<!-- 		<table style="margin-left: auto;margin-right: auto;"> -->
<!-- 		<tr><td>Name <font color="red">*</font></td> -->
<!-- 		<td>:</td> -->
<!-- 		<td><input type="text" id="name" name="name"/></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 		<td>Phone <font color="red">*</font></td> -->
<!-- 		<td>:</td> -->
<!-- 		<td><input type="text" id="phone" name="phone"/></td> -->
		
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 		<td>E-mail <font color="red">*</font></td> -->
<!-- 		<td>:</td> -->
<!-- 		<td><input type="text" id="email" name="email"/></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 		<td>Password <font color="red">*</font></td> -->
<!-- 		<td>:</td> -->
<!-- 		<td><input type="password" id="password" name="password"/></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 		<td>Re-Type Password <font color="red">*</font></td> -->
<!-- 		<td>:</td> -->
<!-- 		<td><input type="password" id="cpassword" name="cpassword"/></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
		
<!-- 		<td colspan="3" style="text-align: center;"><input type="submit"/></td> -->
<!-- 		</tr> -->
		
		
<!-- 	</table> -->
<!-- 	</form> -->
<!-- </div> -->



<div id="volunteer-form">
                <div id="form_wrapper">
                    <form id="volunteerForm" name="volunteerForm" method="post" action="" autocomplete="off">

                            <table class="inputfield" style="margin-left: auto;margin-right: auto;">
                                
                                <tr>
                                    <td class="col-1">
                                        <label> Name
                                        <span class="small">Add Your Name</span>
                                        </label>
                                    </td>
                                    <td class="col-2">
                                       
                                         <input type="text" id="name" name="name" maxlength="35" value=""/>                         
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col-1">
                                        <label >Phone
                                        <span class="small">Add Your Phone Number</span>
                                        </label>
                                    </td>
                                    <td class="col-2">
                                         
                                         <input type="text" id="phone" name="phone" value=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col-1">
                                        <label >Email
                                        <span class="small">Enter Your Email Id</span>
                                        </label>
                                    </td>
                                    <td class="col-2">
                                      
                                       <input type="text" id="email" name="email" value=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col-1">
                                        <label >Password
                                        <span class="small">Enter Your Password</span>
                                        </label>
                                    </td>
                                    <td class="col-2">
                                      
                                        <input type="password" id="password" name="password" value=""/>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="col-1">
                                        <label >Re-Type Password
                                        <span class="small">Re Enter Your Password</span>
                                        </label>
                                    </td>
                                    <td class="col-2">
                                      
                                       <input type="password" id="cpassword" name="cpassword" value=""/>
                                    </td>
                                </tr>
                               
                        </table>
                       
                        <center>
                          <input type="image" src="./images/submit.png" value="SUBMIT" />
                        </center>
                    </form>
                </div>
            </div>
            
            
       </div>     
</div>

<%@include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
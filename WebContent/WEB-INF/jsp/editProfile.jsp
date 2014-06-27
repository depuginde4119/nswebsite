<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/nrg.css">

  <script type="text/javascript" src="./js/jquery-1.9.1.js"></script>
          <script type="text/javascript" src="./js/jquery.validate.js"></script>
<script type="text/javascript" src="./js/jquery-form.js"></script>
 <script type="text/javascript">
        $(document).ready(function(){
        
		$("#profileEditForm").validate({
				rules : {
					name : {
						required : true
					},

					phone : {
						required : true
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
						url : "user/saveEditedProfile",
						type : "POST",
						data : $("#profileEditForm").serialize(),
						success : function(msg) {
							alert('Profile Edited Successfully');
							$("#profileEditForm").resetForm();
							
						},
						error : function(e) {
							alert("Please try again later");
						}
					});
				}
			});
// 			$.validator.addMethod("checkUserName", function(value, element) {
// 				var result = false;
// 				$.ajax({
// 					type : "POST",
// 					async : false,
// 					data : {"email":$("#email").val()},
// 					url : "user/check_email_availability",
// 					success : function(data) {
// 						result = (data == 'Y') ? false : true;
// 					},
// 					error : function(e) {
// 						alert("Please try again later");
// 					}
// 				});

// 				return result;
// 			}, "This email is already taken! Try another.");
		});
	</script>
   
</head>
<body>

<%@include file="/WEB-INF/jsp/header.jsp" %>
<div class="bodyContent">
<div class="constrain register_banner banner centered " >
</div>
<div class="contact_us_container constrain centered ">
<div id="form_container" style="padding:50px;">
	
		
		<form id="profileEditForm" name="profileEditForm" method="post" action="" autocomplete="off">
		<table style="margin-left: auto;margin-right: auto;">
		<tr><td>Name <font color="red">*</font></td>
		<td>:</td>
		<td><input type="text" id="name" name="name" value="${userDetails.name}"/></td>
		</tr>
		<tr>
		<td>Phone <font color="red">*</font></td>
		<td>:</td>
		<td><input type="text" id="phone" name="phone" value="${userDetails.phone}"/>
		<input type="hidden" id="email" name="email" value="${userDetails.email}"/></td>
		
		</tr>
		
		<tr>
		<td>Password <font color="red">*</font></td>
		<td>:</td>
		<td><input type="password" id="password" name="password"/></td>
		</tr>
		<tr>
		<td>Re-Type Password <font color="red">*</font></td>
		<td>:</td>
		<td><input type="password" id="cpassword" name="cpassword"/></td>
		</tr>
		<tr>
		
		<td colspan="3" style="text-align: center;"><input type="submit"/></td>
		</tr>
		
		
	</table>
	</form>
</div>
</div>
</div>

<%@include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
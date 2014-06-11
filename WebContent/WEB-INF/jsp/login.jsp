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
        
		$("#loginForm").validate({
				rules : {
					username : {
						required : true
					},
					password : {
						required : true
					}

				},
				messages : {
					username : {
						required : "Enter UserName"
					},
					password : {
						required : "Enter Password"
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
						url : "user/userLogin",
						type : "POST",
						data : $("#loginForm").serialize(),
						success : function(msg) {
							if(msg == "Success")
								{
								window.location.href="./home";
								}
							else{
								alert("Enter Correct Username & Password ");
							}
							$("#loginForm").resetForm();
							
						},
						error : function(e) {
							alert("Please try again later");
						}
					});
				}
			});
		
		});
	</script>
   
</head>
<body>

<%@include file="/WEB-INF/jsp/header.jsp" %>
<div class="bodyContent">
<div class="constrain contactus_banner banner centered " >
</div>
<div class="contact_us_container constrain centered ">
<div id="form_container" style="padding:50px;">
	
		
		<form id="loginForm" name="loginForm" method="post" action="" autocomplete="off">
		<table style="margin-left: auto;margin-right: auto;">
		<tr><td>UserName </td>
		<td>:</td>
		<td><input type="text" id="username" name="username"/></td>
		</tr>
		
		<tr>
		<td>Password </td>
		<td>:</td>
		<td><input type="password" id="password" name="password"/></td>
		</tr>
		
		<tr>
		
		<td colspan="3" style="text-align: center;"><input type="submit" value="Login"/></td>
		</tr>
		
		
	</table>
	</form>
</div>
<%@include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
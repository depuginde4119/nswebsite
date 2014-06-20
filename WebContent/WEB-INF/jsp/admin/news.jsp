<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New News</title>
<link rel="stylesheet" type="text/css" href="./css/nrg.css">

   <script type="text/javascript" src="./js/jquery-1.9.1.js"></script>
          <script type="text/javascript" src="./js/jquery.validate.js"></script>
<script type="text/javascript" src="./js/jquery-form.js"></script>
 <script type="text/javascript">
        $(document).ready(function(){
        
		$("#newsForm").validate({
				rules : {
					news_title : {
						required : true
					}

				},
				messages : {
					news_title : {
						required : "Title is required"
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
						url : "admin/addNews",
						type : "POST",
						data : $("#newsForm").serialize(),
						success : function(msg) {
							alert('News Added Successfully');
							$("#newsForm").resetForm();
							
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
	
		
		<form id="newsForm" name="newsForm" method="post" action="" autocomplete="off">
		<table style="margin-left: auto;margin-right: auto;">
		<tr><td>Title </td>
		<td>:</td>
		<td><input type="text" id="news_title" name="news_title"/></td>
		</tr>
		<tr>
		<td>Description </td>
		<td>:</td>
		<td><input type="text" id="news_desc" name="news_desc"/></td>
		
		</tr>
		<tr>
		<td>URL </td>
		<td>:</td>
		<td><input type="text" id="news_url" name="news_url"/></td>
		</tr>
		
		<tr>
		
		<td colspan="3" style="text-align: center;"><input type="submit" value="Save"/></td>
		</tr>
		
		
	</table>
	</form>
</div>
</div>
</div>
<%@include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
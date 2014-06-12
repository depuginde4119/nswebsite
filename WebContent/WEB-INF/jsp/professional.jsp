<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
<title>Professional Installation</title>
<link rel="stylesheet" type="text/css" href="./css/nrg.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="./script/nrg.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="./css/form.css"> -->
<script type="text/javascript">

$(document).ready(function(){
	
	$('#service').change(function(){
		var value=$('#service').val();
		$(".serviceDetails").addClass("hide");
		$("#service_"+value).removeClass("hide");
		
	});
	
});

function validate()
{
	
	alert("validating");
	
	return false;
	}

</script>
</head>
<body>

<%@include file="/WEB-INF/jsp/header.jsp" %>
<div class="bodyContent">
<div class="constrain banner centered professional_banner " >
</div>
<div class="body_container constrain centered ">

<div id="centered constrain width50 ">

  <h1>Get your Quote now</h1>
  
  <form action="" onsubmit="validate()">
	
	<div class="row">
	<label>Name</label><input type="text" id="name" >
	</div>
	<div class="row">
	<label>Email</label><input type="text" id="email"  >
	</div>
	
	<div class="row">
	<label>Contact #</label><input type="text" id="contact" >
	</div>
	
	<div class="row">
	<label>Select the Service</label>
	</div>
	
	<div class="row">
	<select  id="service" name="service"> 
			<option value="1" selected="selected">General Installation</option>
			<option value="2" >Waste Water Reclammation</option>
			<option value="3" >Heat Pump</option>
			<option value="4" >Gardening</option>
			<option value="5" >Air CondiDoning System</option>

		</select>
	</div>
	
	<div class="serviceDetails" id="service_1">
	<div class="row">
		<label>Product Type</label><select id="productType"> </select>
		
	</div>
	<div class="row">
		<label>Product</label><select id="product"> </select>
	</div>
	<div class="row">
		<label>Units</label><input type="text"/>
	</div>
	</div>
	
	<div class="serviceDetails hide" id="service_2">
	service 2
	</div>

	<div class="serviceDetails hide" id="service_3">
	service 3
	</div>
	
	<div class="serviceDetails hide" id="service_4">
	<div class="row">
		<label>Area</label><input type="text"/>
		
	</div>
	<div class="row">
		<label>Avg Trees Per square Feet</label><input type="text"/>
	</div>
	<div class="row">
		<label>Avg dip Per square Feet</label><input type="text"/>
	</div>
	<div class="row">
		<label>Green House</label>
		<select> <option value="0">NO</option>   <option value="1">YES</option></select>
	</div>
	</div>
	
	<div class="serviceDetails hide" id="service_5">
	service 5
	</div>
	<input type="submit" value="SUBMIT" >
	

	
	</form>


</div>
</div>
</div>

<%@include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
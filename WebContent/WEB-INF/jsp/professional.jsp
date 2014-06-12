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

 <script type="text/javascript" src="./js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="./js/jquery.validate.js"></script>
<script type="text/javascript" src="./js/jquery-form.js"></script>
<script src="./js/Constant.js"></script>
<script src="./js/nrg.js"></script>

<!-- <link rel="stylesheet" type="text/css" href="./css/form.css"> -->
<script type="text/javascript">

$(document).ready(function(){
	
// 	console.log("sample");
	
	/*
	Get product Type as options HTML
	*/
	$('#productType').change(function(){
		
		var productType=$("#productType").val();
		getProducts(productType,NRGConstant.FORAMTE_PRODUCTTYPE_OPTIONS,"#product");
		
	});
	
	$.ajax({
		async:false,
	    url: 'product/'+NRGConstant.MC_PRODUCT_PRODUCTTYPE,
	    data:"format="+NRGConstant.FORAMTE_PRODUCTTYPE_OPTIONS,
        cache: false,
        success : function(html) {
        	$("#productType").html(html);
        	 $('#productType').trigger('change');

        },
	error: function(error)
	{
			alert("Error at call ");
	}
	});
	

	
	$('#service').change(function(){
		var value=$('#service').val();
		$(".serviceDetails").addClass("hide");
		$("#service_"+value).removeClass("hide");
		
	});
	
	
	
	$("#professionalform").validate({
		rules : {
			name : {
				required : true
			},
			email : {
				required : true,
				validemail:true
			},
			contact : {
				required : true,
				validcontact :true
			},
			units_1 :
			{
			   isNumeric :true,
			 },
		area_2 :
			{
			   isNumeric :true,
			},
		units_1 :
			{
			isNumeric: true
			},
			capacity_3:
			{
				isNumeric :true
			},
			area_4:
			{
				isNumeric :true
			},
			area_5:
			{
				isNumeric :true
			}
			

		},
		messages : {
			username : {
				required : "Enter name"
			},
			email : {
				required : "Enter email"
				
			},
			contact : {
				required : "Enter contact"
				
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
								url : "professional/"+NRGConstant.MC_PROFESSIONAL_QUOTE,
								type : "POST",
								data : $("#professionalform").serialize(),
								success : function(json) {
									console.log("json"+json);
									if(json.isException == "true" || json.isException==true)
										{
				// 							window.location.href="./home";
											alert("error");
										}
									else
									{
										var obj = jQuery.parseJSON(json);
										var servicevalue=obj.service;
										var quoteValue=obj.quote;
										
										servicevalue=$("#service option:selected").text();
										
										$("#service_responce").html(servicevalue);
										$("#quote_responce").html(quoteValue);
										$("#username_temp").val($("#name").val());
										$("#email_temp").val($("#email").val());
										$("#contact_temp").val($("#contact").val());
																				
										$(".QuoteFormContainer").addClass("hide");
										$(".QuoteResponceContainer ").removeClass("hide");
									}
									$("#professionalform").resetForm();
									
								},
								error : function(e) {
									alert("Please try again later");
								}
							});
				
		}
	});
	
	$.validator.addMethod("validemail", function(value, element) {
	
		  var x = value;
		    var atpos = x.indexOf("@");
		    var dotpos = x.lastIndexOf(".");
		    if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x.length) {
		     
		        return false;
		    }
		return true;
	}, "Enter valid email ID");
	
	$.validator.addMethod("isNumeric", function(value, element) {
		var name=$(element).attr("name");
		var service=name.substring(name.indexOf("_")+1,name.length);	
		var serviceSelected=$("#service").val();
		if(service===serviceSelected)
			{

			if(value==="" || isNaN(value))
				{
					return false;
					console.log("test failed");
				}
			
			}

		return true;
	}, "Must be Numeric");

	$.validator.addMethod("validcontact", function(value, element) {
		   var result=!isNaN(value);
		return result;
	}, "Enter Valid Contact");
	
	
});


function confirmQuote()
{
	var serviceName= $("#service_responce").html();
	var quotation=$("#quote_responce").html();
	var username=$("#username_temp").val();
	var email=$("#email_temp").val();
	var contact=$("#contact_temp").val();
	
	
	
	$.ajax({
		async:false,
	    url: 'professional/'+NRGConstant.MC_PROFESSIONAL_ACCEPTQUOTE,
	    data:"quote="+quotation+"&service="+serviceName+"&name="+username+"&email="+email+"&contact="+contact,
        cache: false,
        success : function(mes) {
//         	$("#productType").html(html);
//         	$('#productType').trigger('change');

        },
	error: function(error)
	{
			alert("Error at call ");
	}
	});
}

function cancelQuote()
{
	$(".QuoteFormContainer").removeClass("hide");
	$(".QuoteResponceContainer ").addClass("hide");
	
}

</script>
</head>
<body>

<%@include file="/WEB-INF/jsp/header.jsp" %>
<div class="bodyContent">
<div class="constrain banner centered professional_banner " >
</div>
<div class="body_container constrain centered ">

<div class="centered constrain width500px">

<div class="QuoteFormContainer">
  <h1>Get your Quote now</h1>
  
  <form id="professionalform" >
	
	<div class="row">
	<label>Name</label><input type="text" id="name" name="name" >
	</div>
	<div class="row">
	<label>Email</label><input type="text" id="email"   name="email">
	</div>
	
	<div class="row">
	<label>Contact #</label><input type="text" id="contact"  name="contact">
	</div>
	
	<div class="row">
	<label>Select the Service</label>
	</div>
	
	<div class="row">
	<select  id="service" name="service"> 
			<option value="1" selected="selected">General Installation</option>
			<option value="2" >Waste Water Redemption</option>
			<option value="3" >Heat Pump</option>
			<option value="4" >Gardening</option>
			<option value="5" >Air Conditional System</option>

		</select>
	</div>
	
	<div class="serviceDetails" id="service_1">
<!-- 	General Installation -->
	<div class="row">
		<label>Product Type</label><select id="productType" name="productType"> </select>
		
	</div>
	<div class="row">
		<label>Product</label><select id="product" name="product"> </select>
	</div>
	<div class="row">
		<label>Units</label><input type="text" name="units_1" id="units_1"/>
	</div>
	</div>
	
	<div class="serviceDetails hide" id="service_2">
<!-- 	Waste Water redeemptions -->

		<div class="row">
			<label>Area</label><input type="text" name="area_2"/>
		</div>
		
		<div class="row">
			<label>Underground Water system</label>
			<input type="radio" name="underGroundWater" value="1"  checked="checked">YES
			<input type="radio" name="underGroundWater" value="0">NO
			
		</div>
	
	</div>


	<div class="serviceDetails hide" id="service_3">
<!-- 	Heat Pump -->
		<div class="row">
			<label>Capacity</label><input type="text" name="capacity_3"/>
		</div>
		
		<div class="row">
			<label>Pump type</label>
			<input type="radio" name="pumpType_3" value="100"  checked="checked">100 KV
			<input type="radio" name="pumpType_3" value="200">200 KV
			<input type="radio" name="pumpType_3" value="300">300 KV
		</div>
		
	</div>
	
	<div class="serviceDetails hide" id="service_4">
<!-- 	Gardening -->
	<div class="row">
		<label>Area</label><input type="text" name="area_4"/>
			
	</div>
	<div class="row">
		<label>Green House</label>
		<input type="radio" name="greenHouse_4" value="1"  checked="checked">YES
			<input type="radio" name="greenHouse_4" value="0">NO
	</div>
	<div class="row">
		<label>Automatic Drip System</label> 
			<input type="radio" name="dripSystem_4" value="1"  checked="checked">YES
			<input type="radio" name="dripSystem_4" value="0">NO
	</div>
	
	</div>
	
	<div class="serviceDetails hide" id="service_5">
	<div class="row">
		<label>Area</label><input type="text" name="area_5"/>
	</div>
	<div class="row">
		<label>Variant</label>
		<select  name="variant_5"> 
			<option value="100" selected="selected">Split</option>
			<option value="200">Center</option>
		</select>
	</div>
	</div>
	
	<input type="submit" value="SUBMIT">
	
	</form>

</div>
<div class="QuoteResponceContainer hide" >

<h1> Quotation is Successfully generated  </h1>

<h3> Service : <span id="service_responce"></span> </h3>
<h3> Quotation: <span id="quote_responce"></span> </h3>

<input type="hidden" value="" id="username_temp" >
<input type="hidden" value=""  id="email_temp">
<input type="hidden" value=""  id="contact_temp">

<input type="button" value="Confirm Quote" onclick="confirmQuote()" >
<input type="button" value="Cancel" onclick="cancelQuote()" >

</div>
</div>
</div>
</div>

<%@include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
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
	    url: 'product',
	    data:"format="+NRGConstant.FORAMTE_PRODUCTTYPE_OPTIONS+"&mc="+NRGConstant.MC_PRODUCT_PRODUCTTYPE,
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
	
	
	/*
	for initial form
	*/
	$(".serviceDetails").addClass("hide");
	$(".service_1").removeClass("hide");
	
	$('#service').change(function(){
		var value=$('#service').val();
		$(".serviceDetails").addClass("hide");
		$(".service_"+value).removeClass("hide");
		
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
function restform()
{
	$("#professionalform").resetForm();
	
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
<div id="volunteer-form">
                <div id="form_wrapper">
<div class="QuoteFormContainer">
  <h1>Get your Quote now</h1>
<form id="professionalform">
  <table class="inputfield">
	
<tr>
   <td class="col-1">
	    <label>Name</label>
	   
	</td>
	<td class="col-2">
	       <input type="text" id="name" name="name" >
	</td>
</tr>
	<tr>
	
	<td class="col-1">
	  <label>Email</label>
	</td>
	<td class="col-2">
	     <input type="text" id="email"   name="email">
	</td>
</tr>
<tr>
	
 <td class="col-1">
	<label>Contact #</label>
</td>
	<td class="col-2">
	<input type="text" id="contact"  name="contact">
	</td>
</tr>
	
	<tr>
	<td class="col-1">
	<label>Select the Service</label>
	
	</td><td class="col-2">
	
	
	<select  id="service" name="service"> 
			<option value="1" selected="selected">General Installation</option>
			<option value="2" >Waste Water Redemption</option>
			<option value="3" >Heat Pump</option>
			<option value="4" >Gardening</option>
			<option value="5" >Air Conditional System</option>

		</select>
	</td>
</tr>

<!-- General installation -->

<tr colspan="2" class="serviceDetails  service_1">
<th class="serviceHeader"><b>General Installation</b></th>
</tr>

<tr class="serviceDetails  service_1">

<!-- 	<div class="serviceDetails" id="service_1"> -->
<!-- 		<!-- 	General Installation --> 
<!-- 			<div class="row"> -->
<td class="col-1">
				<label>Product Type</label>
				</td><td class="col-2">
				
				<select id="productType" name="productType"> </select>
				
</td>
</tr>
<tr class="serviceDetails  service_1">
				<td class="col-1">
				     <label>Product</label>
				</td>
				<td class="col-2">
				     <select id="product" name="product"> </select>
				</td>
</tr>				
	
<tr class="serviceDetails  service_1">
         <td class="col-1">
         
				<label>Units</label>
				</td>
				<td class="col-2">
				
				<input type="text" name="units_1" id="units_1"/>
				</td>

<tr colspan="2" class="serviceDetails  service_2">
<th class="serviceHeader">Waste Water redeemptions</th>
</tr>
	
<tr  class="serviceDetails  service_2">
     <td class="col-1">
			<label>Area</label>
	</td>
	<td class="col-2">	<input type="text" name="area_2"/></td>
</tr>
		
<tr  class="serviceDetails  service_2">
     <td class="col-1">
			<label>Underground Water system</label>
		</td>
		<td class="col-2">	
			<input type="radio" name="underGroundWater" value="1"  checked="checked">YES
			
			<input type="radio" name="underGroundWater" value="0">NO
		</td>
</tr>

<tr colspan="2" class="serviceDetails  service_3">
	<th class="serviceHeader">Heat Pump</th>
</tr>
	
<tr  class="serviceDetails  service_3">
     <td class="col-1">
		<label>Capacity</label>
			</td><td class="col-2">
			<input type="text" name="capacity_3"/>
			</td>
</tr>
		
<tr  class="serviceDetails  service_3">
     <td class="col-1">
			<label>Pump type</label>
		</td>
		<td class="col-2">
			<input type="radio" name="pumpType_3" value="100"  checked="checked">100 KV
			<input type="radio" name="pumpType_3" value="200">200 KV
			<input type="radio" name="pumpType_3" value="300">300 KV
			
		</td>
</tr>
		
	
<tr colspan="2" class="serviceDetails  service_4">
	<th class="serviceHeader">Gardening</th>
</tr>
	
<tr  class="serviceDetails  service_4">
	
<!-- 	<div class="serviceDetails hide" id="service_4"> -->
<!-- <!-- 	Gardening --> 
<!-- 	<div class="row"> -->
<td class="col-1">
		<label>Area</label>
		</td><td class="col-2">
		<input type="text" name="area_4"/>
		</td>
</tr>

<tr  class="serviceDetails  service_4">
<td class="col-1">
		<label>Green House</label>
		</td>
		<td class="col-2">
		<input type="radio" name="greenHouse_4" value="1"  checked="checked">YES
			<input type="radio" name="greenHouse_4" value="0">NO
			</td>
			</tr>
<tr  class="serviceDetails  service_4">
<td class="col-1">
		<label>Automatic Drip System</label> 
		</td> <td class="col-2">
			<input type="radio" name="dripSystem_4" value="1"  checked="checked">YES
			<input type="radio" name="dripSystem_4" value="0">NO
			</td>
</tr>

<tr colspan="2" class="serviceDetails  service_5">
<th class="serviceHeader">Air Conditional</th>
</tr>

<tr  class="serviceDetails  service_5">
<td class="col-1">
		<label>Area</label>
		</td>
		<td class="col-2">
		<input type="text" name="area_5"/>
		</td>
<tr  class="serviceDetails  service_5">
<td class="col-1">
		<label>Variant</label>
		</td>
		<td class="col-2">
		<select  name="variant_5"> 
			<option value="100" selected="selected">Split</option>
			<option value="200">Center</option>
		</select>
		</td>

<tr>
<td class="col-1">

	
	</td>
	<td class="col-2">
	<input type="image" src="./images/submit1.png" value="SUBMIT" style="margin-left:15px;margin-right:15px;">
	<input type="image" src="./images/cancel.png" value="CANCEL" onclick="restform();" style="margin-left:15px;margin-right:15px;">
	</td>
	</tr>
	
	</table>
	</form>
</div>
</div>

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
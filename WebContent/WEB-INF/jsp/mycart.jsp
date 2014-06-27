<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
<link rel="stylesheet" type="text/css" href="./css/nrg.css">
 <script type="text/javascript" src="./js/jquery-1.9.1.js"></script>
 <script src="./js/Constant.js"></script>
<script type="text/javascript">
function removeProduct(productId)
{
	var loggedUser=$("#isLogged").val();
	loggedUser=loggedUser.replace(/ /g,"_");
	var cokkieId="cart_"+loggedUser;
	var cokkie=document.cookie;
//		console.log("cokkie "+cokkie);
	var existing="";
	if(cokkie!=undefined)
		{
			var index=cokkie.indexOf(cokkieId, 0)+cokkieId.length;
			if(index!=-1)
				{
				var end=cokkie.indexOf(";", index)==-1?cokkie.length:cokkie.indexOf(";", index);
				existing= cokkie.substring(index+1,end);
				}
		}
	if(existing=="")
		{
			
		}
	else
		{
		console.log("existing "+existing);
		existing=existing.replace("__", "_");
		document.cookie=cokkieId+"="+existing;
		location.reload();		
		}
		
}

function clearCart()
{
	var loggedUser=$("#isLogged").val();
	loggedUser=loggedUser.replace(/ /g,"_");
	var cokkieId="cart_"+loggedUser;
// 	console.log("document.cookie"+document.cookie);
	document.cookie=cokkieId+"=";
	console.log("document.cookie"+document.cookie);
	location.reload();
}

function submit()
{

	$.ajax({
		async:false,
	    url: 'product',
	    data:"mc="+NRGConstant.MC_PRODUCT_CARTSUBMIT,
        cache: false,
        success : function(html) {
        	alert("Cart Submmited by  Email");
        	clearCart();

        },
	error: function(error)
	{
			alert("Error at call ");
	}
	});
		
	
}
</script>
</head>	
<body>
<%@include file="/WEB-INF/jsp/header.jsp" %>

<div class="bodyContent">
<div class="constrain banner centered cart_banner " >
</div>
<div class="body_container constrain centered ">

<div class="centered  constrain">

<%--         Id : ${product.id} <br/> --%>
<%--         Name : ${product.name} <br/> --%>
<c:if test="${!empty products}">
<table class="mycarttable" class="border">
<tr >
	<th class="border">Sno</th>
	<th class="border">Name</th>
<!-- 	<th>Description</th> -->
	<th class="border">Price</th>
	<th class="border">Action</th>
</tr>
<c:set scope="page" var="id" value="0" ></c:set>
 <c:forEach items="${products}" var="product">
 <tr id="row_${product.id}" >
 <c:set scope="page" var="id" value="${pageScope.id+1}" ></c:set>
	<td>${pageScope.id}</td>
	<td>${product.name}</td>
<%-- 	<td>${product.description}</td> --%>
	<td>${product.price}</td>
	<td><input type="button" value="remove" onclick="removeProduct(${product.id})"></td>
</tr>
 
 </c:forEach>
  <c:if test="${!empty products}">
   <tr >
	
	<th colspan="2" class="border">Total :</th> <th colspan="2" class="border"> ${totalprice} </th>
</tr>

  <tr >
	

	<td colspan="4"><center> <input type="button" value="SUBMIT" onclick="submit();" class="distence"><input type="button" value="CANCEL" onclick="clearCart();" class="distence"></center> </td>
</tr>
  
  </c:if>
 
</table>
</c:if>
<c:if test="${empty products}">

<h3>Cart is empty !! </h3>
  
  </c:if>

</div>

</div>


</div>

<%@include file="/WEB-INF/jsp/footer.jsp" %>


</body>
</html>
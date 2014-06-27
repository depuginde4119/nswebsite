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
<script type="text/javascript">

function addToCart(productId)
{
	var loggedUser=$("#isLogged").val();
	if(loggedUser!="")
		{
// 		console.log("document.cokkie "+document.cookie);
				loggedUser=loggedUser.replace(/ /g,"_");
				var cokkieId="cart_"+loggedUser;
				var cokkie=document.cookie;
// 				console.log("cokkie "+cokkie);
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
						document.cookie=cokkieId+"="+productId;
					}
				else
					{
						document.cookie=cokkieId+"="+existing+"_"+productId;
					}
				
				$("#addToCart_"+productId).prop("disabled",true);
				$("#addToCart_"+productId).val("Added to cart");
				console.log("document.cokkie "+document.cookie);
				
		}
	else
		{
			alert("Please login First");
		}
	
}

</script>
</head>	
<body>
<%@include file="/WEB-INF/jsp/header.jsp" %>

<div class="bodyContent">
<div class="constrain banner centered product_banner " >
</div>
<div class="body_container constrain centered ">

<div class="centered width750px constrain">
 <c:forEach items="${products}" var="product">
<%--         Id : ${product.id} <br/> --%>
<%--         Name : ${product.name} <br/> --%>
        
        <div class="width100 productDetails">
	        <div class="leftGrid width30">
	        	<img src="./images/product/${product.image}" class="width100">
	        </div>
        <div class="rightGrid productDetails width70">
           <div class="name"> Name : ${product.name}</div>
           <div class="description"> Description</div> 
           <div> ${product.description}</div>
           <div> Price : ${product.price}</div>
           <c:if test="${not product.addedToCart}">
           	 <input type="button" value="Add to cart" id="addToCart_${product.id}" onclick="addToCart('${product.id}')">
           </c:if>
           
           <c:if test="${product.addedToCart}">
           	 <input type="button" value="Added to cart" id="addToCart_${product.id}" disabled>
           </c:if>
           
           
        
      
           
        </div>
        
        </div>
        
 </c:forEach>
</div>

</div>


</div>

<%@include file="/WEB-INF/jsp/footer.jsp" %>


</body>
</html>
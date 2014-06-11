<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
<link rel="stylesheet" type="text/css" href="./css/nrg.css">
</head>
<body>
<%@include file="/WEB-INF/jsp/header.jsp" %>

<div class="bodyContent">
<div class="constrain banner centered product_banner " >
</div>
<div class="body_container constrain centered ">

 <c:forEach items="${products}" var="product">
<%--         Id : ${product.id} <br/> --%>
<%--         Name : ${product.name} <br/> --%>
        
        <div class="width100 productDetails">
	        <div class="leftGrid">
	        	<img src="../images/product/${product.image}" class="width100">
	        </div>
        <div class="rightGrid productDetails">
           <div class="name"> Name : ${product.name}</div>
           <div class="description"> Description</div> 
           <div> ${product.name}</div>
           <div> Price : ${product.name}</div>
           <input type="button" value="ADD TO CART" onclick="addToCart('${product.id}')">
           
        </div>
        
        </div>
        
 </c:forEach>

</div>


</div>

<%@include file="/WEB-INF/jsp/footer.jsp" %>


</body>
</html>
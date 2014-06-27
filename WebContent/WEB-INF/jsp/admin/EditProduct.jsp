<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Products</title>
<link rel="stylesheet" type="text/css" href="./css/nrg.css">
<script type="text/javascript" src="./js/jquery-1.9.1.js"></script>

</head>	
<body>
<%@include file="/WEB-INF/jsp/header.jsp" %>

<div class="bodyContent">
<div class="constrain banner centered product_banner " >
</div>
<div class="body_container constrain centered ">

<div class="centered width750px constrain">



<form id="productform" action="padmin" method="post">

<table>
<tr colspan="2">
<th> Product </th>
</tr>
<tr>
<td>ID</td>
<td> ${product.id} </td>
</tr>
<tr class="hide">
<td> <input type="hidden" name="mc" value="maup"> </td>
<td> <input type="hidden" value="${product.id}" name="pid"> </td>
</tr>

<tr>
<td>Name</td>
<td> <input type="text" name="pname" value="${product.name}"/></td>
</tr>
<tr>
<td>Product Types</td>
<td> 
<select name="ptype">

<c:forEach items="${productTypes}" var="producttype">
<c:if test="${producttype.produtTypeID != product.id}">
<option value="${producttype.produtTypeID}">${producttype.name}</option>
</c:if>
<c:if test="${producttype.produtTypeID == product.id}">
<option selected="selected" value="${producttype.produtTypeID}">${producttype.name}</option>
</c:if>
</c:forEach>

</select>
</td>
</tr>

<tr>
<td>Description</td>
<td> <textarea name="pdesc" >${product.description}</textarea></td>
</tr>
<tr>
<td>Price</td>
<td> <input type="text" name="pprice" value="${product.price}" /></td>
</tr>
<tr>
<td>Specification</td>
<td> <input type="text" name="pspec" value="${product.specification}" /></td>
</tr>
<tr>
<td>Image</td>
<td> <input type="text" disabled name="pimage" value="${product.image}" /><br> </td>
</tr>

<tr>
<td><input type="submit" value="SUBMIT" name="psubmit" /></td>
<td><input type="button" value="CANCEL" name="pcancel" onclick="window.location.href='padmin';"/></td>
</tr>

</table>

</form>
 
</div>

</div>


</div>

<%@include file="/WEB-INF/jsp/footer.jsp" %>


</body>
</html>





















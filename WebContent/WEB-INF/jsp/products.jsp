<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/nrg.css">
</head>
<body>
<%@include file="/WEB-INF/jsp/header.jsp" %>

<div class="bodyContent">
 <c:forEach items="${products}" var="product">
        Id : ${product.id} <br/>
        Name : ${product.name} <br/>
 </c:forEach>
 
 <div class="grid">
 
 	<div class=""></div>
 	<div class=""></div>
 
 </div>
 
 
</div>
<%@include file="/WEB-INF/jsp/footer.jsp" %>


</body>
</html>
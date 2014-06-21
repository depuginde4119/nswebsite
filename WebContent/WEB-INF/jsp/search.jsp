<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
<title>NRGSavers | Search</title>
<link rel="stylesheet" type="text/css" href="./css/nrg.css">
<!-- <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script> -->
<script type="text/javascript">


</script>
</head>
<body>

<%@include file="/WEB-INF/jsp/header.jsp" %>
<div class="bodyContent">
<div class="constrain banner centered search_banner " >
</div>
<div class="body_container constrain centered theme ">

 <c:if test="${!empty search}">
         
            <c:if test="${!empty search.products}">
                
                <h2>Products Result</h2>
                
                <c:forEach items="${search.products}" var="product">
                    <h3>${product.name}</h3>
                    <div>${product.description}</div>
                    
                        <a href="product?mc=${product.typeId} ">More click here  >> </a>
                </c:forEach>
                
            </c:if>
     </c:if>
        <c:if test="${empty search}">
            Can't find any item with the Keyword.
        </c:if> 

</div>


</div>
<%@include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
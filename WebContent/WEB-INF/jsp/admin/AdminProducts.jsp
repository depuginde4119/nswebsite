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
<script type="text/javascript">

</script>
</head>	
<body>
<%@include file="/WEB-INF/jsp/header.jsp" %>

<div class="bodyContent">
<div class="constrain banner centered product_banner " >
</div>
<div class="body_container constrain centered ">

<div class="centered width750px constrain">

<%@include file="/WEB-INF/jsp/admin/ProductsList.jsp" %>

 
</div>

</div>


</div>

<%@include file="/WEB-INF/jsp/footer.jsp" %>


</body>
</html>
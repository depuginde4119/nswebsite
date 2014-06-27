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
            <c:if test="${!empty search.news}">
              <h2>News Result</h2>
            
               <div class="datagrid">
                    <table>
                        <tbody>
                       
                           <c:forEach items="${search.news}" var="news">
						<tr class="alt" style="border-bottom: 1px solid #DFDDDE;">
                                    <td style="border-right:none;">
                                        <img src="./images/news_icon.png" width="50" height="50" style="border-radius:5px;"/>
                                    </td>
                                    <td style="border-left:none;">
                                        <span style="color:#24D66B;"><a target="_blank" href="http://${news.url}">
                                        ${news.title}</a></span>
                                        <p id="" style="margin-top:0px;cursor:pointer;word-wrap:break-word;width:850px;color:#2B73DD; font-size:16px;" class="wrap" >&nbsp;${news.description}</p>
                                        <p style="color:#999; font-size:13px;"> ${news.createdDate} </p>
                                    </td>
						</tr>
							
                    </c:forEach>     
                

                                               
                        </tbody>
                    </table>
					</div>
            
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
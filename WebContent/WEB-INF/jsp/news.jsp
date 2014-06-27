<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/nrg.css">

  <script type="text/javascript" src="./js/jquery-1.9.1.js"></script>
          <script type="text/javascript" src="./js/jquery.validate.js"></script>
<script type="text/javascript" src="./js/jquery-form.js"></script>
 <style>
 .datagrid 
{
    background: #fff; 
    overflow: hidden; 
    width:100%;
    margin-top:10px;

}
.datagridHeight{
    min-height:400px;
}
.datagrid table  
{
	border-collapse: collapse; 
	text-align: left; 
	color:#323D43;
	width: 960px !important;
	font-family:font-bold;
	font-size:15px;
    margin:0 auto;
}
.datagrid table tr 
{
    border-spacing:2px;
} 
.datagrid table tr td
{ 
    padding: 8px 8px; 
    width:auto;
}
.datagrid table tr td a 
{
    text-decoration:none;
    color:#323D43;
}
.datagrid table tr td span 
{
    color:#323D43;
}
.datagrid table tr td a:hover 
{
    text-decoration:underline;
}

.datagrid table thead th 
{
    height:46px;
    padding:0 10px;
/*    width:auto;*/
}
.datagrid table thead th img 
{
    margin-right:10px;
	 margin-left:10px;
}
.datagrid table thead 
{
    background-image:url(../images/tablehdrbg.png); 
    background-repeat:repeat-x;
    color:#323D43;
    font-size: 14px; 
}
.datagrid table thead th:first-child 
{ 
    border: none; 
}
.datagrid table tbody td 
{ 
    color:#323D43; 
    border-left: 1px solid #BAC7CD;
    font-size: 14px;
}
.datagrid table tbody .alt td 
{ 
    background: #F9FAFB; 
    color:#323D43;
}
.datagrid table tbody .unread td 
{ 
   /* background:url(../images/table-alt-bg.png); 
    background-repeat:repeat-x;*/
   background-color: lightskyblue;
    color:#323D43;
}
.datagrid table tbody .unread-m td 
{ 
    background:url(../images/table-m-alt-bg.png); 
    background-repeat:repeat-x; 
    color:#323D43;
}
.datagrid table tbody .unread-c td 
{ 
    background:url(../images/table-c-alt-bg.png); 
    background-repeat:repeat-x; 
    color:#323D43;
}
.datagrid table tbody .unread-a td 
{ 
    background:url(../images/table-a-alt-bg.png); 
    background-repeat:repeat-x; 
    color:#323D43;
}
.datagrid table tbody td:first-child 
{ 
    border-left: none; 
}
.datagrid table tbody tr:last-child td 
{ 
    border-bottom: none; 
}

 
 </style>
   
</head>
<body>

<%@include file="/WEB-INF/jsp/header.jsp" %>
<div class="bodyContent">
<div class="constrain news_banner banner centered " >
</div>
<div class="contact_us_container constrain centered ">
<div id="form_container" style="padding:50px;">
	
<%-- 		<c:forEach items="${newsList}" var="news"> --%>
<!-- 		<div style="height:auto;"> -->
<%--             <h3><a href="${news.url}">${news.title}</a></h3> --%>
<!--             <div> -->
           
<!--             <img class="imgr" style="float:left;margin-right:10px;" src="./NRG Savers/ProfessionalInstallations_files/prof_wasteWater.gif" alt="" width="135" height="85"> -->
<!--          <p > -->
<%-- 			${news.description} --%>
<!--            </p> -->
<!--         </div> -->

<!-- </div><br> -->
<%-- </c:forEach> --%>

<div class="datagrid">
                    <table>
                        <tbody>
                        <c:if test="${!empty newsList}">
                           <c:forEach items="${newsList}" var="news">
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
                    </c:if>
                    <c:if test="${empty newsList}">
                     <tr style="height:160px;"> 
                             <td align="center" colspan="2"> No news to display</td> 
                            </tr>
                    </c:if>
<!--                             <tr style="height:160px;"> -->
<!--                             <td align="center" colspan="2"> No news to display</td> -->
<!--                             </tr> -->
                                               
                        </tbody>
                    </table>
					</div>
					
					
</div>
</div>
</div>

<%@include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
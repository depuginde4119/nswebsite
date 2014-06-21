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
<!-- <script type='text/javascript' src='http://code.jquery.com/jquery-1.6.2.js'></script> -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="http://trirand.com/blog/jqgrid/themes/ui.jqgrid.css">
<script type='text/javascript' src="http://trirand.com/blog/jqgrid/js/i18n/grid.locale-en.js"></script>
<script type='text/javascript' src="http://trirand.com/blog/jqgrid/js/jquery.jqGrid.min.js"></script>


<script type='text/javascript'>//<![CDATA[ 
     $(document).ready(function(){
    	 
//     	 {\"id\":\"" + id + "\", \"name\":\"" + name + "\", \"description\":\""
//              + description + "\", \"image\":\"" + image + "\", \"price\":\"" + price + "\", \"specification\":\"" + specification + "\", \"typeId\":\"" + typeId + "\", \"typeName\":\"" + typeName + "\"}
    	 
   jQuery("#projectTable").jqGrid({
       url: "padmin?mc=maap",
       datatype: "json",
       jsonReader: {repeatitems: false, id: "ref"},
       colNames:['SNo.','Name', 'Description', 'Type'],
       colModel:[
           {name:'name',index:'id', width:10},
           {name:'name',index:'name', width:100},
           {name:'description',index:'description', width:300},
           {name:'typeName',index:'typeName', width:50}
       ],
       rowNum:20,
       rowList:[20,60,100],
       height:250,
       pager: "#pagingDiv",
       viewrecords: true,
       caption: "Json Example"
   });
    
   $("#pcSelect").change(function(){
       var postcode = $("#pcSelect").val();
       jQuery("#projectTable").jqGrid(
               "setGridParam",{
                   url:"LoadJsonDataServlet?type="+ postcode,
                   page:1})
               .trigger("reloadGrid");
   });
   
     });
  </script>
</head>	
<body>
<%@include file="/WEB-INF/jsp/header.jsp" %>

<div class="bodyContent">
<div class="constrain banner centered product_banner " >
</div>
<div class="body_container constrain centered ">

<div class="centered width750px constrain">

 <table id="projectTable"></table>
              <div id="pagingDiv"></div>
 
</div>

</div>


</div>

<%@include file="/WEB-INF/jsp/footer.jsp" %>


</body>
</html>
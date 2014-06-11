<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/nrg.css">
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script type="text/javascript">
var map;
function initialize() {
	  var myLatlng = new google.maps.LatLng(-25.363882,131.044922);
	  var mapOptions = {
	    zoom: 4,
	    center: myLatlng
	  }
	  map = new google.maps.Map(document.getElementById('mapDiv'), mapOptions);

	  var marker = new google.maps.Marker({
	      position: myLatlng,
	      map: map,
	      title: 'NRG Savers'
	  });
	}
google.maps.event.addDomListener(window, "load", initialize);

</script>
</head>
<body>
<%

request.getSession().setAttribute("loggedUser","Laxmi kanth");

%>
<%@include file="/WEB-INF/jsp/header.jsp" %>
<div class="bodyContent">
<div class="constrain banner centered contactus_banner " >
</div>
<div class="body_container constrain centered ">
<div class="contact_us_map" id="mapDiv"></div>
<div class="contact_us_address">
	<div class="orangeColor">Contact Us</div>
	<div class="topMar10"><span class="greenColor">Heather</span>, haether@gmail.com</div>
	<div>CEO</div>
	<div>000-09090909-090</div>
	<div class="topMar10"><span class="greenColor">Mahua</span>, mahua@gmail.com</div>
	<div>Business Analyst</div>
	<div>000-09090909-090</div>
	<div class="topMar10"><span class="greenColor">Laxmikanth</span>, laxmikanth@gmail.com</div>
	<div>Marketing</div>
	<div>000-09090909-090</div>
	
	<div class="contact_us_location">
					<div class="orangeColor">Location:</div>

					<div class="topMar10">University Of New Haven,</div>

					<div>West Haven,CT,</div>

					<div>06516,</div>

					<div>USA,</div>
				</div>
</div>
</div>


</div>
<%@include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
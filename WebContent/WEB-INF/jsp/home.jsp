<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/nrg.css">
<link rel="stylesheet" type="text/css" href="./css/featured_slide.css">
<script type="text/javascript" src="./js/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="./js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript" src="./js/jquery.nivo.slider.setup.js"></script>
<style>
div.wrapper{
	display:block;
	width:100%;
	margin:0;
	text-align:left;
	}
	.fl_left{width:500px;}
	.container{
	padding:20px 0;
	}
</style>
</head>
<body>
<%

//request.getSession().setAttribute("loggedUser","Laxmi kanth");

%>
<%@include file="/WEB-INF/jsp/header.jsp" %>
<div class="bodyContent">
<div class="constrain centered body_container">
<div class="wrapper">
<div id="featured_slide">
   <div id="slider" class="nivoSlider"> <img src="./images/slider/slider1.gif" alt="" /> <img src="./images/slider/slider2.gif" alt="" /> <img src="./images/slider/slider3.gif" alt="" /> <img src="./images/slider/slider4.gif" alt="" /> </div>
  </div>
</div>
<div class="wrapper col4" style="height: 350px;margin-left:50px;">
  <div class="container">
      <div class="fl_left" style="float: left;">
        <h2>NRG Savers has the perfect customized deal for you.</h2>
        <p>With building science and state-of-the-art equipment, NRG Savers 
            quantifies the energy consumption in homes.  The assessment includes 
            the heating and cooling systems; windows; insulation; flow of air 
            into and out of the house; water usage; as well as a safety check of 
            gas appliances.  Using a whole systems approach an NRG Savers audit 
            will reveal the necessary road map for true energy efficiency.  We 
            reduce consumption not with a single technology, but with a suite of 
            closely integrated technologies.  Even the most energy efficient 
            products may not save energy if they are not installed correctly.  
            Craftsmanship is essential for the systems to function properly. 
          
        </p>
       </div>
      <div class="fl_right" style="float: right;margin-right:50px;">
          <h3>Hear from our clients!</h3>
          <iframe width="400" height="240" src="//www.youtube.com/embed/dbsxbmsYTL0" frameborder="0" ></iframe>
      </div>

<div style="clear: both"></div>
  </div>
</div>
</div>
</div>
<%@include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
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

// {"total":1,"page":1,"records":1,"rows":[{"id":"2", "name":"Longstar FE-IISB-13W 27K 120V Energy Star 13 Watt CFL Light Bulb", "description":"There is a minimum order of 10 on this item. Prices are per light bulb. The Longstar FE-IISB-13W 27K emits a soft white color that is perfect for living rooms, dining rooms and any room that you desire an inviting environment. This energy saving lamp is equivalent to a 60W incandescent and last up to 10 times longer. We invite you to take a look at all our 13 watt compact fluorescent light bulbs. 0 Deg. We do not guarantee exact matches.", "image":"bulb1.jpeg", "price":"2.0", "specification":"", "typeId":"1", "typeName":"LED Bulbs"},{"id":"3", "name":"14W R30 4100K COMPACT FLUORESCENT FLOODLIGHT ENERGY SAVING LIGHT BULB", "description":"14 watt compact fluorescent replaces standard 60 - 65 watt incandescent floodlight. Produces neutral white light with fewer warm tones than a standard light bulb. UL listed for indoor and outdoor use. May be used in track lights, recessed can lights", "image":"bulb2.jpeg", "price":"5.99", "specification":"", "typeId":"1", "typeName":"LED Bulbs"},{"id":"4", "name":"Compact Fluorescent Spiral Bulb, 13 Watt 5 Pack", "description":"Energy saving bulb.8000 life hours. 825 lumens. 13 watts. Width: 5.56. Height: 2.44", "image":"bulb3.jpeg", "price":"9.0", "specification":"", "typeId":"1", "typeName":"LED Bulbs"},{"id":"5", "name":"Foam It Green Energy Efficiency Kit", "description":"Yields 1200 Sq. Ft (Board Feet) At 1 Inch", "image":"isolation1.jpeg", "price":"1429.0", "specification":"Mold, pest, and fire resistant?? Yields approx 1200 sqft at 1" thick of cured foam?? Foam, 15' hose, gun, 10 nozzles, 3 fan spray tips?? Two 602s (Shipping Included)?? Re-use - stopping & starting is no problem", "typeId":"2", "typeName":"INSOLATION "},{"id":"6", "name":"Lock-Top Chimney Cap Damper", "description":"All fireplace dampers leak energy - even new ones. So if you have a chimney, you need a Lock-Top top sealing damper! The Lock-Top Chimney Damper is like a storm door for your chimney - locking the unconditioned air outside, and keeping the expensive, conditioned air inside. You will be saving energy dollars year-round!", "image":"isolation2.jpeg", "price":"149.99", "specification":"", "typeId":"2", "typeName":"INSOLATION "},{"id":"7", "name":"SELF-ADHESIVE ENERGY WINDOW FILM", "description":"SELF-ADHESIVE ENERGY WINDOW FILM", "image":"window1.jpeg", "price":"49.99", "specification":"	Clear insulating window film helps keep heat in during the winter, cool air in during the summer, without blocking light", "typeId":"3", "typeName":"WINDOWS"},{"id":"8", "name":"Eclipse Nottingham Thermal Energy Efficient Grommet Curtain Panel", "description":"Eclipse offers a line of energy-efficient curtain panels that effortlessly blend function with style. Curtain panel features a tonal neutral texture with bronze finish modern grommets. The Eclipse Nottingham curtain is designed to cut out nearly 99 percent of light, so that you can get a better night's sleep. This noise-reducing curtain panel helps to muffle outside noise. On warm days, it helps keep hot sunrays at bay to keep your room cool, while on cold days this panel helps maintain the heat inside the home. The Eclipse Nottingham window curtain panel can help you save on home heating and cooling costs throughout the year. You can easily hang this blackout window panel on a decorative rod. This Nottingham curtain panel will be ideal for your bedroom, kid's room, living room, or office.", "image":"window2.jpeg", "price":"12.99", "specification":"	Single window panel", "typeId":"3", "typeName":"WINDOWS"},{"id":"9", "name":"APC SurgeArrest Power-Saving Home/Office Surge suppressor", "description":"Damaging surges associated with lightning or utility problems can travel along your utility and data lines, damaging your electronic devices and destroying your valuable data. Even smaller everyday surges can degrade the performance of your electronics and decrease their life. The APC SurgeArrest Home/Office series provides a high level of protection for your computers, electronics and connected devices, as well as providing surge protection for your phone lines and on selected models - coax cables. Its state of the art circuitry offers excellent protection for sensitive electronic equipment against large surges and multiple surge events.", "image":"isolation3.jpeg", "price":"21.0", "specification":"", "typeId":"2", "typeName":"INSOLATION "},{"id":"10", "name":"40 Gallon - Lowboy Energy Saver Electric Residential Water Heater (w/ Insulation Jacket)", "description":"Bradford White's Energy Saver Lowboy electric models are built for tight spaces with low headroom, allowing you the flexibility to put electric water heating where a conventional upright tank would not fit.", "image":"heater1.jpeg", "price":"599.99", "specification":"", "typeId":"4", "typeName":"HEATERS"}]}
//     	 {"total":1,"page":1,"records":1,"rows":[There is a minimum order of 10 on this item. Prices are per light bulb. The Longstar FE-IISB-13W 27K emits a soft white color that is perfect for living rooms, dining rooms and any room that you desire an inviting environment. This energy saving lamp is equivalent to a 60W incandescent and last up to 10 times longer. We invite you to take a look at all our 13 watt compact fluorescent light bulbs. 0 Deg. We do not guarantee exact matches.,14 watt compact fluorescent replaces standard 60 - 65 watt incandescent floodlight. Produces neutral white light with fewer warm tones than a standard light bulb. UL listed for indoor and outdoor use. May be used in track lights, recessed can lights,Energy saving bulb.8000 life hours. 825 lumens. 13 watts. Width: 5.56. Height: 2.44,Yields 1200 Sq. Ft (Board Feet) At 1 Inch,All fireplace dampers leak energy - even new ones. So if you have a chimney, you need a Lock-Top top sealing damper! The Lock-Top Chimney Damper is like a storm door for your chimney - locking the unconditioned air outside, and keeping the expensive, conditioned air inside. You will be saving energy dollars year-round!,SELF-ADHESIVE ENERGY WINDOW FILM,Eclipse offers a line of energy-efficient curtain panels that effortlessly blend function with style. Curtain panel features a tonal neutral texture with bronze finish modern grommets. The Eclipse Nottingham curtain is designed to cut out nearly 99 percent of light, so that you can get a better night's sleep. This noise-reducing curtain panel helps to muffle outside noise. On warm days, it helps keep hot sunrays at bay to keep your room cool, while on cold days this panel helps maintain the heat inside the home. The Eclipse Nottingham window curtain panel can help you save on home heating and cooling costs throughout the year. You can easily hang this blackout window panel on a decorative rod. This Nottingham curtain panel will be ideal for your bedroom, kid's room, living room, or office.,Damaging surges associated with lightning or utility problems can travel along your utility and data lines, damaging your electronic devices and destroying your valuable data. Even smaller everyday surges can degrade the performance of your electronics and decrease their life. The APC SurgeArrest Home/Office series provides a high level of protection for your computers, electronics and connected devices, as well as providing surge protection for your phone lines and on selected models - coax cables. Its state of the art circuitry offers excellent protection for sensitive electronic equipment against large surges and multiple surge events.,Bradford White's Energy Saver Lowboy electric models are built for tight spaces with low headroom, allowing you the flexibility to put electric water heating where a conventional upright tank would not fit.]}
    	 
   jQuery("#projectTable").jqGrid({
       url: "padmin?mc=maap",
       datatype: "json",
       jsonReader: {repeatitems: false, id: "ref"},
       colNames:['ID.','Name', 'Description','Type Name','Action'],
       colModel:[
           {name:'id',index:'id', width:50},
           {name:'name',index:'name', width:200, formatter: 'showlink', formatoptions:
           {
               baseLinkUrl:'javascript:',
               showAction: "editproduct('",
               
               addParam: "');"

           }},
           {name:'description',index:'description', width:400},
           {name:'typeName',index:'typeName', width:100},
           {name: 'myac', width:80, fixed:false, editformbutton: true,  sortable:false, resize:false, formatter:'actions', formatoptions:{keys:true,  editbutton: false, onEdit: function(rowid){alert("hello"); },
           
           delOptions:{
               url: "padmin?mc=madp",
               recreateForm: true, 
                      
               onclickSubmit :function(params, postdata) {
            	   
            	   var pid=$('#'+postdata+" td[aria-describedby='projectTable_id']").html();
               	 params.url += '&pid=' + pid;
               	 console.log("log url "+params.url);
               }
           },
           editOptions:{
               url: "padmin?mc=maup",
               recreateForm: true, 
         
               onclickSubmit :function(params, postdata) {
            	   
            	   var pid=$('#'+postdata+" td[aria-describedby='projectTable_id']").html();
               	 params.url += '&pid=' + pid;
               	 console.log("log url "+params.url);
               }
           }
           } 
           }
           
        ],
       rowNum:20,
       rowList:[20,60,100],
       height:250,
       grouping:true,
       groupingView : 
       { 
    	   groupField : ['typeName'], 
    	   groupColumnShow : [true]
		   
       },
       pager: "#pagingDiv",
       viewrecords: true,
       gridview:true,
       caption: "Products"
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
     
//      function editProduct(rowid)
//      {
    	 
//     	 console.log("rowid"+rowid);
    	 
//      }
     
     function editproduct(rowid)
     {
    	 
    	 var id= rowid.substring(rowid.indexOf("=")+1,rowid.length);
    	 var pid=$('#'+id+" td[aria-describedby='projectTable_id']").html();
    	window.location.href="padmin?mc=mavp&pid="+pid;	 
    }
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
 Note : Click on name of the product to edit it.
</div>



</div>


</div>

<%@include file="/WEB-INF/jsp/footer.jsp" %>


</body>
</html>
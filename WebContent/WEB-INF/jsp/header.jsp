
<link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
<div id="header">
<div class="constrain centered grid grid-pad clearfix">
	<div id="logo">
	      <h1><span class="whiteText">NRG </span><span class="grayText"> Savers</span></h1>
	     
	</div>
	
	<div class="userpanel">
	
	<c:if test="${empty sessionScope.loggedUser}">
	<a href="./login" style="padding-left: 5px;">Login |</a><a href="./newuser" style="padding-left: 5px;">| Register</a>
	<input type="hidden" id="isLogged" value="">
		<form action="search">
	<input name="keyword" class="search" type="text" size="40" placeholder="Search..." />
	</form>
	</c:if>
	
	<c:if test="${!empty sessionScope.loggedUser}">
	Logged as  <a href='editProfile?id=<c:out value="${sessionScope.userId}"/>' style="padding-left: 5px;"><c:out value="${sessionScope.loggedUser}"/></a>
	
	<input type="hidden" id="isLogged" value="${sessionScope.loggedUser}">
	<a href="user/userLogout">|| Logout</a><br> 
	<form action="search">
			<input name="keyword" class="search" type="text" size="40" placeholder="Search..." />
	</form>
	
	</c:if>
	<!--Product : <c:out value="${product}"></c:out>-->
	</div>
</div>
<div class="menuContainer">
<c:if test="${empty sessionScope.loggedUser}">
	<nav class="constrain centered grid grid-pad clearfix">
        <ul class="sf-menu" id="nav">
          <li ><a href="aboutus">About Us</a></li>
          <li><a href="client">Our Clients</a></li>
          <li><a>Products</a>
          <ul>
                  <li><a href="product?mc=1">LED Bulbs</a></li>
                  <li><a href="product?mc=2">INSOLATION </a></li>
                  <li><a href="product?mc=3">WINDOWS</a></li>
                  <li><a href="product?mc=4">HEATERS</a></li>
                  <c:if test="${!empty sessionScope.loggedUser}">
                 		 <li><a href="product?mc=mycart">My Cart</a></li>
                  </c:if>
                </ul></li>
          <li><a href="professional">Professional Installation</a>
          
          </li>
          <li><a >Finance</a>
          <ul>
                  <li><a href="finance">Finance </a></li>
                  <li><a href="government">Government Aids  </a></li>
       	  </ul>
          </li>
          <li><a href="activenews">News</a></li>
          <li><a href="contactus">Contact Us</a></li>
         </ul>
      </nav>
</c:if>

<c:if test="${!empty sessionScope.loggedUser}">
		
		<c:if test="${ sessionScope.userRole eq 2}">
		 <nav class="constrain centered grid grid-pad clearfix">
		        <ul class="sf-menu" id="nav">
		          <li ><a href="aboutus">About Us</a></li>
		          <li><a href="client">Our Clients</a></li>
		          <li><a>Products</a>
		          <ul>
		                  <li><a href="product?mc=1">LED Bulbs</a></li>
		                  <li><a href="product?mc=2">INSOLATION </a></li>
		                  <li><a href="product?mc=3">WINDOWS</a></li>
		                  <li><a href="product?mc=4">HEATERS</a></li>
		                  <c:if test="${!empty sessionScope.loggedUser}">
		                 		 <li><a href="product?mc=mycart">My Cart</a></li>
		                  </c:if>
		                </ul></li>
		          <li><a href="professional">Professional Installation</a>
		          
		          </li>
		         <li><a >Finance</a>
			          <ul>
			                  <li><a href="finance">Finance </a></li>
			                  <li><a href="government">Government Aids  </a></li>
			       	  </ul>
			      </li>
		          <li><a href="activenews">News</a></li>
		          <li><a href="contactus">Contact Us</a></li>
		         </ul>
		      </nav>
		</c:if>
		<!-- THIS IS FOR ADMIN -->
		<c:if test="${ sessionScope.userRole eq 1}">
		 <nav class="constrain centered grid grid-pad clearfix">
		        <ul class="sf-menu" id="nav">
		          <li ><a href="addnews">News</a></li>
<!-- 		          <li><a href="#">Settings</a></li> -->
		          <li><a href="padminv">Products</a>
		         </li>
		         
		         </ul>
		      </nav>
		</c:if>
</c:if>


</div>

</div>
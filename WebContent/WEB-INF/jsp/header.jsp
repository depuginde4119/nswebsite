

<div id="header">
<div class="constrain centered grid grid-pad clearfix">
	<div id="logo">
	      <h1><span class="whiteText">NRG </span><span class="grayText"> Savers</span></h1>
	      <p>caption</p>
	</div>
	
	<div class="userpanel">
	
	<c:if test="${empty sessionScope.loggedUser}">
	<a href="login" style="padding-left: 5px;">Login</a><a href="newuser" style="padding-left: 5px;">Register</a>
	</c:if>
	
	<c:if test="${!empty sessionScope.loggedUser}">
	Logged as  <a href="editProifile?<c:out value="${sessionScope.loggedUser}"/>" style="padding-left: 5px;"><c:out value="${sessionScope.loggedUser}"/></a>
	<a href="user/userLogout">Logout</a><br> 
	
	<input name="q" class="search" type="text" size="40" placeholder="Search..." />
	
	</c:if>
	<!--Product : <c:out value="${product}"></c:out>-->
	</div>
</div>
<div class="menuContainer">
 <nav class="constrain centered grid grid-pad clearfix">
        <ul class="sf-menu" id="nav">
          <li class="selected"><a href="index.html">About Us</a></li>
          <li><a href="examples.html">Our Clients</a></li>
          <li><a href="product">Products</a></li>
          <li><a href="page.html">Professional Installation</a></li>
          <li><a href="another_page.html">Finance</a></li>
          <li><a href="another_page.html">News</a></li>
          <li><a href="contactus">Contact Us</a></li>
         </ul>
      </nav>


</div>

</div>
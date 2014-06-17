<h1>Product List </h1>

<c:forEach items="${products}" var="product">
<%--         Id : ${product.id} <br/> --%>
<%--         Name : ${product.name} <br/> --%>
        
        <div class="width100 productDetails">
	        <div class="leftGrid">
	        	<img src="./images/product/${product.image}" class="width100">
	        </div>
        <div class="rightGrid productDetails">
           <div class="name"> Name : ${product.name}</div>
           <div class="description"> Description</div> 
           <div> ${product.description}</div>
           <div> Price : ${product.price}</div>
                     
           
           	 <input type="button" value="Added to cart" id="addToCart_${product.id}" disabled>
  
        </div>
        
        </div>
        
 </c:forEach>
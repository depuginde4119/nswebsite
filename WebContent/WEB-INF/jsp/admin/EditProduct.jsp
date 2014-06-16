<form id="productform">

<table>
<tr colspan="2">
<th> Product </th>
</tr>
<tr>
<td>id</td>
<td> ${product.id} </td>
</tr>
<tr>
<td>Name</td>
<td> <input type="text" name="pname" value="${product.name}"/></td>
</tr>

<tr>
<td>Product Types</td>
<td> 
<select name="ptype">

<c:forEach items="${productTypes}" var="producttype">
<c:if test="${producttype.produtTypeID != product.id}">
<option value="${producttype.produtTypeID}">${producttype.name}</option>
</c:if>
<c:if test="${producttype.produtTypeID == product.id}">
<option selected="selected" value="${producttype.produtTypeID}">${producttype.name}</option>
</c:if>
</c:forEach>

</select>
</td>
</tr>

<tr>
<td>Description</td>
<td> <textarea name="pdesc" >${product.description}</textarea></td>
</tr>
<tr>
<td>Price</td>
<td> <input type="text" name="pprice" value="${product.price}" /></td>
</tr>
<tr>
<td>Specification</td>
<td> <input type="text" name="pspec" value="${product.specification}" /></td>
</tr>
<tr>
<td>Image</td>
<td> <input type="file" name="pimage" /><br> <label>${product.image}</label></td>
</tr>

<tr>
<td><input type="submit" value="SUBMIT" name="psubmit" /></td>
<td><input type="button" value="CANCEL" name="pcancel" /></td>
</tr>

</table>

</form>
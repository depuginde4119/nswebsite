/**
 * 
 */

function getProducts(productType, format, toElement)
{
	$.ajax({
		async:false,
	    url: 'product/'+NRGConstant.MC_PRODUCT_PRODUCTS,
	    data:"format="+format+"&pt="+productType,
        cache: false,
        success : function(html) {
        	$(toElement).html(html);

        },
	error: function(error)
	{
			alert("Error at call ");
	}
	});
}
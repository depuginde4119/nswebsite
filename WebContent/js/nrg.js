/**
 * 
 */

function getProducts(productType, format, toElement)
{
	$.ajax({
		async:false,
	    url: 'product',
	    data:"format="+format+"&pt="+productType+"&mc="+NRGConstant.MC_PRODUCT_PRODUCTS,
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
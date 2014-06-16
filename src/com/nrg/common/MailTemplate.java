package com.nrg.common;

import java.util.List;
import java.util.Map;

import com.nrgsavers.dto.MailDto;
import com.nrgsavers.dto.NewUser;
import com.nrgsavers.dto.Product;


public class MailTemplate {
	public static MailDto tempPasswordTemplate(NewUser userdto)
	{
		MailDto dto = new MailDto();
		dto.setToAddress(userdto.getEmail());
		dto.setSubject(Constants.CHANGE_PASSWORD_SUBJECT_STRING);
		dto.setMsgContentType(Constants.HTML_CONTENT_TYPE);
		String msgBody = "<h3>Below is your temporary password</h3>Username : "+userdto.getEmail()+"<br>Password : "+userdto.getTempPassword();
		dto.setMsgBody(msgBody);
		return dto;
		
	}
	
	public static MailDto quoteEmail(Map<String,String> details)
	{
		MailDto dto = new MailDto();
		dto.setToAddress("depuginde4119@gmail.com");
		dto.setSubject(Constants.QUOTATION_SUBJECT+" :"+details.get("service"));
		dto.setMsgContentType(Constants.HTML_CONTENT_TYPE);
		String msgBody = "<h3>The user,"+details.get("name")+ "has confirmed the quotation   </h3>Service : "+details.get("service")+"<br>Quote : "+details.get("quote")+"<br>Contact Informartion  : <br> Users : "+details.get("user")+"<br> Contact : "+details.get("contact")+"<br> email : "+details.get("email");
		dto.setMsgBody(msgBody);
		return dto;
		
	}
	
	public static MailDto cartEmail(Map<String,Object> details)
	{
		MailDto dto = new MailDto();
		dto.setToAddress("depuginde4119@gmail.com");
		dto.setSubject(Constants.CARTSUBMIT_SUBJECT+" : by "+details.get("username"));
		dto.setMsgContentType(Constants.HTML_CONTENT_TYPE);
		List<Product> product= (List<Product>) details.get("products");
		
		String productsTable=generateTableForProducts(product);
			
		String msgBody = "<h3>The user,"+details.get("name")+ "has confirmed the Cart    </h3>"+productsTable+"<br> <h3> Total Price : "+details.get("total")+"</h3>";
		dto.setMsgBody(msgBody);
		return dto;
		
	}

	private static String generateTableForProducts(List<Product> products) {
		StringBuffer buffer= new StringBuffer();
		
		buffer.append("<table> <tr>	<th>Sno</th>");
		buffer.append("<th>Name</th>");
		buffer.append("<th>Description</th>");
		buffer.append("<th>Price</th>");
		buffer.append(" </tr>");
		
		int i=0;
		for(Product product :products)
		{
			i++;
			buffer.append("<tr>	<td>"+i+"</td>");
			buffer.append("<td>"+product.getName()+"</td>");
			buffer.append("<td>"+product.getDescription()+"</td>");
			buffer.append("<td>"+product.getPrice()+"</td>");
			buffer.append(" </tr>");
		}
		buffer.append("</table>");
		
		return buffer.toString();
	}



}

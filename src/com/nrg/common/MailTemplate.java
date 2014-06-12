package com.nrg.common;

import java.util.Map;

import DTO.MailDto;
import DTO.NewUser;

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


}

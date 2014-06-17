package com.nrg.common;

import DTO.MailDto;
import DTO.NewUser;

public class MailTemplate {
	public static MailDto tempPasswordTemplate(NewUser userdto)
	{
		MailDto dto = new MailDto();
		dto.setToAddress(userdto.getEmail());
		dto.setSubject(Constants.CHANGE_PASSWORD_SUBJECT_STRING);
		dto.setMsgContentType(Constants.HTML_CONTENT_TYPE);
		String msgBody = "<h3>Below is your Changed password</h3>Username : "+userdto.getEmail()+"<br>Password : "+userdto.getTempPassword();
		dto.setMsgBody(msgBody);
		return dto;
		
	}

}

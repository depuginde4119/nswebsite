package com.nrg.common;

import java.util.*;  

import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*;  

import DTO.MailDto;
  
public class SendMail  
{  
   public static void send(MailDto mailDto)  
   { 
  try{
	  // String to = "depuginde4119@gmail.com";
	  //  String subject = "subject";
	  //  String msg ="email text....";
	    final String from =Constants.MAIL_USERNAME;
	    final  String password =Constants.MAIL_PASSWORD;


	    Properties props = new Properties();  
	    props.setProperty("mail.transport.protocol", "smtp");     
	    props.setProperty("mail.host", "smtp.gmail.com");  
	    props.put("mail.smtp.auth", "true");  
	    props.put("mail.smtp.port", "465");  
	    props.put("mail.debug", "true");  
	    props.put("mail.smtp.socketFactory.port", "465");  
	    props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
	    props.put("mail.smtp.socketFactory.fallback", "false");  
	    
	    Session session = Session.getDefaultInstance(props,  
	    new javax.mail.Authenticator() {
	       protected PasswordAuthentication getPasswordAuthentication() {  
	       return new PasswordAuthentication(from,password);  
	   }  
	   });  

	   //session.setDebug(true);  
	   Transport transport = session.getTransport();  
	   InternetAddress addressFrom = new InternetAddress(from);  

	   MimeMessage message = new MimeMessage(session);  
	   message.setSender(addressFrom);  
	   message.setSubject(mailDto.getSubject());  
	   message.setContent(mailDto.getMsgBody(), mailDto.getMsgContentType());  
	   message.addRecipient(Message.RecipientType.TO, new InternetAddress(mailDto.getToAddress()));  

	   transport.connect();  
	   Transport.send(message);  
	   transport.close();
  }catch(Exception e)
  {
	  e.printStackTrace();
  }
	   
   }  
}  
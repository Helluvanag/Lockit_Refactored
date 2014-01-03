package com.verudix.lockit.util;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;

public class MailSender {
	public static boolean SendMail(String From,String To,String sub,String body,String displayname)
	   {    
		  String host="mail.verudix.org"; 	     
	      final String user="lockit@verudix.org";
	      final String password="lockit";
	   //   final String cc = "keerthi@verudix.com";		      
	      
	      Properties properties = System.getProperties();  
	      properties.setProperty("mail.smtp.host","mail.verudix.org" );  
	      properties.put("mail.smtp.auth", "true");  
	  
	      Session session = Session.getDefaultInstance(properties,  new javax.mail.Authenticator() {  
	      protected PasswordAuthentication getPasswordAuthentication() {  
	      return new PasswordAuthentication(user,password);  
	     }  
	      });  
	        
	      try{  
	         MimeMessage message = new MimeMessage(session);  
	         DataHandler handler = new DataHandler(new ByteArrayDataSource(body.getBytes(), "text/html"));  
	         message.setFrom(new InternetAddress(user));  
	         message.addRecipient(Message.RecipientType.TO, new InternetAddress(To));  
	    //     message.addRecipient(Message.RecipientType.CC, new InternetAddress(cc));
	         message.setSubject(sub); 
	         message.setContent(body,"text/html" );  
	    
	         Transport.send(message);  
	         System.out.println("Message sent....");  
	      }catch (MessagingException ex){
	    	  ex.printStackTrace();
	    	  return false;
	    	  }
		return true;  
	
	   }

}

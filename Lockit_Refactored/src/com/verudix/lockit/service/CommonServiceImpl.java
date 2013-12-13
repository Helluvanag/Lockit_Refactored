package com.verudix.lockit.service;

import java.io.File;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

import com.itextpdf.text.log.SysoLogger;
import com.verudix.lockit.dao.CommonDao;

import javax.activation.DataHandler;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;


public class CommonServiceImpl implements CommonService {
	private CommonDao commonDao;
	Logger logger = Logger.getLogger(CommonServiceImpl.class);

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}
	boolean status = false;
	HttpServletRequest request;
	HttpSession session;
	public boolean registerUser(HttpServletRequest request,HttpServletResponse response, String email, String password,String con_password,String displayname) {
		logger.debug("The values inside SignupServiceImpl aer ---"+email+" "+password+" "+displayname);
		String strResult = "";
		try {
			strResult = (String) commonDao.uspInsertRegistration(email, password,con_password,displayname);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(strResult.equals("1"))
		{
			 String newpath=request.getServletContext().getRealPath("/")+"Userfiles"+File.separator +email+ File.separator ;        	
 	         File path = new File(newpath);
 	         path.mkdirs();   
 	         File f1=new File(newpath+File.separator+"Shared Files");
 	         f1.mkdir();
 	         File f2=new File(newpath+File.separator+"convertedPdfs");
 	         f2.mkdir();
 	         File f3=new File(newpath+File.separator+"convertedSwfs");
	         f3.mkdir();
	         File f4=new File(newpath+File.separator+"My Files");
	         f4.mkdir();
	         boolean a = welcomeEmail(request,response,email);
			 return a;
	         
	        
		}else{
			
			return false;
		}
	   
	}
	
	public String changePassword(HttpServletRequest request, String logged_user_mail, String userOldpassword, String userNewpassword ,String userConfirmpassword) throws SQLException {
		String strResult = "0";		
		String strpass = (String) commonDao.usp_get_password(logged_user_mail);
		
		if(userOldpassword.equals(strpass)){			
			strResult = (String) commonDao.usp_Update_Password(logged_user_mail,userOldpassword,userNewpassword);
			return strResult;
		}else{
			return strResult;
		}
				
	}
	public boolean getPwd(HttpServletRequest request, HttpServletResponse response,String email) {		
		try{
			
			String strResult = (String) commonDao.usp_pwd(email);			
			if(  strResult.equals("") )
			{
				request.setAttribute("message", "email id doesnt match");				
				return false;
			}
			else{				
				boolean a = sendmail(request,response,email);
				return a;
			}

		}catch(Exception e){			
			logger.error("error in ForgotpwdServiceImpl..."+e.toString());
			return false;
		}

		}
		private boolean sendmail(HttpServletRequest request, HttpServletResponse response,String email) {
			
			 try
			 {
				    PrintWriter out= response.getWriter();				    
				    String fpkey = Long.toString(Calendar.getInstance().getTimeInMillis());
				    String to = email;				
				    final String from = "mailkeert@gmail.com";/** gmail id***/
				    final String cc = "mailkeert@gmail.com";
				    String host = "smtp.gmail.com";		     
				    final String pwd = "keerthikeerthi";/** gmail id password***/		     
				    String body = "Dear User,"+"\n"+"Changing your password is simple."+"\n"+"Please use the link below on or before 72 hours to reset your password."+"\n"+"http://www.defigomail.com:8082/Lockit_Refactored/resetPassword.do?Key="+fpkey+"&UserName="+email+""+"\n\n"+"Thank You,"+"\n"+"Lockit Team";
		//   String body = "Dear User,"+"\n"+"Changing your password is simple."+"\n"+"Please use the link below on or before 72 hours to reset your password."+"\n"+"http://localhost:8080/Lockit_Refactored/resetPassword.do?Key="+fpkey+"&UserName="+email+""+"\n\n"+"Thank You,"+"\n"+"Lockit Team";  
				    Properties props = new Properties();   
				    props.setProperty("mail.transport.protocol", "smtp");   
				    props.setProperty("mail.host", host);   
				    props.put("mail.smtp.auth", "true");   
				    props.put("mail.smtp.port", "465");   
				    props.put("mail.smtp.socketFactory.port", "465");   
				    props.put("mail.smtp.socketFactory.class",  "javax.net.ssl.SSLSocketFactory");   
				    props.put("mail.smtp.socketFactory.fallback", "false");   
				    props.setProperty("mail.smtp.quitwait", "false"); 
				    Session session1 = Session.getInstance(props,  new javax.mail.Authenticator() {
				    		protected PasswordAuthentication getPasswordAuthentication() {		   	
				    			return new PasswordAuthentication(from,pwd);
				    		}
				    });
		        MimeMessage message = new MimeMessage(session1);
		        DataHandler handler = new DataHandler(new ByteArrayDataSource(body.getBytes(), "text/plain"));   
		        message.setFrom(new InternetAddress(from));
		        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
		        message.addRecipient(Message.RecipientType.CC,new InternetAddress(cc));
		        message.setSubject("Reset your password");
		        message.setDataHandler(handler); 
		        Transport.send(message);
		        String strResult1 = (String) commonDao.uspforgotpwd(request,email, fpkey);
		        return true;
		     }catch (MessagingException mex) {		    	
		    		return false;
		     }catch (Exception e) {
		    		return false;
			}
			
		}
		public boolean resetpwd(HttpServletRequest request,
				HttpServletResponse response, String email, String password,String Key) {
			try{				
				String strResult3=(String)commonDao.uspcheckPwdKey(email,Key);
				if(strResult3.equals("1"))
				{
					String strResult2 = (String) commonDao.uspresetpwd(email,password);		
					if(strResult2.equals("1"))
					{
						return true;
					}
					else{
						return false;
					}
				}
				else
				{
					System.out.println("Expired.");
				}
				
		}catch(Exception e)
		{
			return false;
		}
			return false;
		}
		
		private boolean welcomeEmail(HttpServletRequest request, HttpServletResponse response,String email) {
			
			 try
			 {
				    PrintWriter out= response.getWriter();				    
				    String fpkey = Long.toString(Calendar.getInstance().getTimeInMillis());
				    String to = email;				
				    final String from = "mailkeert@gmail.com";/** gmail id***/		
				    final String cc = "mailkeert@gmail.com";
				    String host = "smtp.gmail.com";		     
				    final String pwd = "keerthikeerthi";/** gmail id password***/		     
				    String body = "Dear User,"+"\n"+"you hav been registered successfully "+"\n"+"you can login with your emailid "+email+"\n"+"Thank You,"+"\n"+"Lockit Team";
		//   String body = "Dear User,"+"\n"+"Changing your password is simple."+"\n"+"Please use the link below on or before 72 hours to reset your password."+"\n"+"http://localhost:8080/Lockit_Refactored/resetPassword.do?Key="+fpkey+"&UserName="+email+""+"\n\n"+"Thank You,"+"\n"+"Lockit Team";  
				    Properties props = new Properties();   
				    props.setProperty("mail.transport.protocol", "smtp");   
				    props.setProperty("mail.host", host);   
				    props.put("mail.smtp.auth", "true");   
				    props.put("mail.smtp.port", "465");   
				    props.put("mail.smtp.socketFactory.port", "465");   
				    props.put("mail.smtp.socketFactory.class",  "javax.net.ssl.SSLSocketFactory");   
				    props.put("mail.smtp.socketFactory.fallback", "false");   
				    props.setProperty("mail.smtp.quitwait", "false"); 
				    Session session1 = Session.getInstance(props,  new javax.mail.Authenticator() {
				    		protected PasswordAuthentication getPasswordAuthentication() {		   	
				    			return new PasswordAuthentication(from,pwd);
				    		}
				    });
		        MimeMessage message = new MimeMessage(session1);
		        DataHandler handler = new DataHandler(new ByteArrayDataSource(body.getBytes(), "text/plain"));   
		        message.setFrom(new InternetAddress(from));
		        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
		        message.addRecipient(Message.RecipientType.CC,new InternetAddress(cc));
		        message.setSubject("Registered Successfully");
		        message.setDataHandler(handler); 
		        Transport.send(message);
		        String strResult1 = (String) commonDao.uspforgotpwd(request,email, fpkey);
		        return true;
		     }catch (MessagingException mex) {		    	
		    		return false;
		     }catch (Exception e) {
		    		return false;
			}
			
		}
}

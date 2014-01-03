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
import com.verudix.lockit.util.MailSender;
import com.verudix.lockit.util.CreateFolders;
import javax.activation.DataHandler;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
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
	public boolean registerUser(HttpServletRequest request,HttpServletResponse response, String email, String password,String con_password,String displayname){
		logger.debug("The values inside SignupServiceImpl aer ---"+email+" "+password+" "+displayname);
		String strResult = "";
		try {
			strResult = (String) commonDao.uspInsertRegistration(email, password,con_password,displayname);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(strResult.equals("1"))
		{
			 CreateFolders.createRootFolders(request, email);
	         final String From="lockit@verudix.org";
	  	     //    String body="<body> Dear " +displayname+",<br><br>Thank you for signing up to Lockit.<br><br>Your user id is "+email+ "<br><br> To get logged into Lockit click on "+"\n"+"http://localhost:8080/Lockit_Refactored/login.do?UserName="+email+"<br><br><br>Thank You,<br><br> Lockit Team.</body> ";
	         String body="<body> Dear " +displayname+",<br><br>Thank you for signing up to Lockit.<br><br>Your user id is "+email+ "<br><br> To get logged into Lockit click on "+"\n"+"http://defigomail.com:8082/Lockit_Refactored/login.do?UserName="+email+"<br><br><br>Thank You,<br><br> Lockit Team.</body> ";
	         String sub="Registered Successfully";
	         MailSender.SendMail(From,email, sub, body,displayname);
			 return true;
	         
	        
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
	public boolean getPwd(HttpServletRequest request, HttpServletResponse response,String email,String strDisplayName) {		
		try{
			
			String strResult = (String) commonDao.usp_pwd(email);			
			if( strResult.equals(""))
			{						
				return false;
			}
			else{	
				 final String From="lockit@verudix.org";
				 String fpkey = Long.toString(Calendar.getInstance().getTimeInMillis());
				 String strResult1 = (String) commonDao.uspforgotpwd(request, email, fpkey);			
			//	 String body="<body> Dear " +strDisplayName+",<br><br>Changing your password is simple.<br><br>Please use the link below on or before 72 hours to reset your password.<br><br>http://localhost:8080/Lockit_Refactored/resetPassword.do?Key="+fpkey+"&UserName="+email+"<br><br><br>Thank You,<br>Lockit Team.     </body> ";
				 String body="<body> Dear " +strDisplayName+",<br><br>Changing your password is simple.<br><br>Please use the link below on or before 72 hours to reset your password.<br><br>http://defigomail.com:8082/Lockit_Refactored/resetPassword.do?Key="+fpkey+"&UserName="+email+"<br><br><br>Thank You,<br>Lockit Team.     </body> ";
				 String sub="Reset your password";
				 MailSender.SendMail(From,email, sub, body,strDisplayName);
				 return true;
			}

		}catch(Exception e){			
			logger.error("error in ForgotpwdServiceImpl..."+e.toString());
			return false;
		}

		}
	public String getDisplay(String email) {	
		String strResult1="";
		try{
			
			strResult1 = (String) commonDao.usp_Select_UserPrfoile(email);
			System.out.println(strResult1+"strResult1");
		
		}catch(Exception e){			
			logger.error("error in ForgotpwdServiceImpl..."+e.toString());
			
		}
		return strResult1;

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
		
}

package com.verudix.lockit.service;

import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.io.File;
import java.sql.SQLException;

import com.verudix.lockit.dao.SignupDao;
public class SignupServiceImpl implements SignupService
{
	private SignupDao signupDao;
	Logger logger = Logger.getLogger(SignupDao.class);
	public void setSignupDao(SignupDao signupDao) {
		this.signupDao = signupDao;
	}
	boolean status = false;
	HttpSession session;
	public boolean registerUser(HttpServletRequest request,HttpServletResponse response, String email,
			String password,String con_password,String displayname) {
		logger.debug("The values inside SignupServiceImpl aer ---"+email+" "+password+" "+displayname);
		String strResult = "";
		try {
			strResult = (String) signupDao.uspInsertRegistration(request,response,email, password,con_password,displayname);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(strResult.equals("1"))
		{
			 String newpath= request.getServletContext().getRealPath("/")+"Userfiles"+File.separator +email+ File.separator ;        	
 	         File path = new File(newpath);
 	         path.mkdirs();
 	        
 	         File f1=new File(newpath+File.separator+"Shared Files");
 	         f1.mkdir();
 	        
 	         File f2=new File(newpath+File.separator+"convertedPdfs");
 	         f2.mkdir();
 	      
 	         File f3=new File(newpath+File.separator+"convertedSwfs");
	         f3.mkdir();
	         
	    
		}else
		{
			request.setAttribute("message", "Email id already exist");
		}
		return false;
	}

	
}
	

	


	
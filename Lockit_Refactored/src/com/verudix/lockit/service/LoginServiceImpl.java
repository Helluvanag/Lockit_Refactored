package com.verudix.lockit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.verudix.lockit.dao.UserDao;
import com.verudix.lockit.dao.UserDaoImpl;

import org.apache.log4j.Logger;

@Service
public class LoginServiceImpl implements LoginService{
	private UserDao userDao;
	Logger logger = Logger.getLogger(LoginServiceImpl.class);
	

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	boolean status = false;
	String resultmessage = "";
	HttpServletRequest request;
	HttpSession session;
	public boolean authenticateUser(HttpServletRequest request, String userName, String pwd) {
		String strResult = "";
		try{
			strResult = (String) userDao.uspCheckLogin(userName, pwd);
		}catch(Exception e){}
		if(userName.length()>0 &&  pwd.length()>0){
			strResult = strResult.substring(strResult.indexOf(',')+1,strResult.length());
        	if(strResult.equals("NA")){
         	}else{
         		String[] strArrName = new String[10];
         		String[] strArrPath = new String[10];
         		String[] strArrFileId = new String[10];
         		String[] strArrIsExpiry = new String[10];
         		int[] intCounter = new int[10];
         		status = true;
         		session = request.getSession(true);
         		session.setAttribute("user_name", strResult);
         		session.setAttribute("user_mail",  userName);
         		session.setAttribute("strArrName",  strArrName);
         		session.setAttribute("strArrPath",  strArrPath);
         		session.setAttribute("strArrFileId",  strArrFileId);
         		session.setAttribute("strArrIsExpiry",  strArrIsExpiry);
         		session.setAttribute("intCounter",  intCounter);
           	}
        
		if(status==true){
	 			status = false;
		}else{
			request.setAttribute("message", "Invalid Username/Password...!");
			return false;
		}
		}else{
			request.setAttribute("message", "Enter Email ID"+"<br>"+"Enter Password");
			return false;
		}
		return true;
	}
	
	public String insertgoogleuser(String email_address, String password,
			String displayname, String firstName, String lastName) {
		
		String strResult = "";
	try{
		
		strResult = (String) userDao.usp_GoogleRegistration(email_address, password,displayname,firstName,lastName);
		    
		
	}catch(Exception e){
		
		System.out.println("error in google login serviceimpl...."+e.toString());
		
		strResult = "";
		
	}
	
	return strResult ;
	}
}

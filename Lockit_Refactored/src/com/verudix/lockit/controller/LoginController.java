package com.verudix.lockit.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;
import com.verudix.lockit.service.LoginService;


@Controller
public class LoginController {
	private LoginService loginService;
	HttpSession session;
	
	Logger logger = Logger.getLogger(LoginController.class);
	
	public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }
	
		@RequestMapping("/login")
		public ModelAndView loadLogin() throws Exception {
			 return new ModelAndView("login");
	    }
	
	 	@RequestMapping("/lockit_login")
	    public ModelAndView lockit_login(HttpServletRequest request,@RequestParam String email,@RequestParam String password) throws Exception {
	 		boolean bool = false;
	 		try{
	 			bool = loginService.authenticateUser(request, email, password);
	 		}catch(Exception e){
	 			logger.error("The LoginController is throwing---"+e);
	 		}
		 if(bool)
			 return new ModelAndView("redirect:dashboard.do");
		 else
			 return new ModelAndView("login");
	    }
	 	
	 	@RequestMapping("/loginwithgoogle.do")
	    public ModelAndView loginwithgoogle(HttpServletRequest request, HttpServletResponse response) throws Exception {
	 		System.out.println("Inside /loginwithgoogle.do-------");
	 		return new ModelAndView("loginwithgoogle1");
	 	}
	 	
	 	
	 	@RequestMapping("/loginwithgoogle1.do")
	    public ModelAndView loginwithgoogle1(HttpServletRequest request, HttpServletResponse response) throws Exception {
	 		System.out.println("Inside /loginwithgoogle1.do-------");
	 		String sBuffer ="";
	 		try{
		 		String access_token = request.getParameter("access_token");
		 		System.out.println("access_token-------"+access_token);
		 		
		 		String URI = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + access_token;
		 		System.out.println("URI-------"+URI);
		 	
		 		
		 		 URL oracle = new URL(URI);
		         URLConnection yc = oracle.openConnection();
		         BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		         String inputLine;
		         while ((inputLine = in.readLine()) != null) {
		        	 sBuffer=sBuffer+inputLine;
		        	 
		         }
		           
		         in.close();		
		 		
		         System.out.println("sBuffer..."+sBuffer);
		         
		        sBuffer = sBuffer.replace("id", "").replace("email", "");
	            sBuffer = sBuffer.replace("given_name", "");
	            sBuffer = sBuffer.replace("family_name", "").replace("link", "").replace("picture", "");
	            sBuffer = sBuffer.replace("gender", "").replace("locale", "").replace(":", "");
	            sBuffer = sBuffer.replace("\"", "").replace("name", "").replace("{", "").replace("}", "");
 
		         String[] ar = sBuffer.split(",");
		         
		         String   Google_ID = ar[0];
		         String	  Email_address = ar[1];
		         String   firstName = ar[4];
		         String   LastName = ar[5];
		         Email_address = Email_address.trim();
		         firstName = firstName.trim();
		         LastName = LastName.trim();
		         System.out.println("Google_ID..."+Google_ID);
		         System.out.println("Email_address..."+Email_address);
		         System.out.println("firstName..."+firstName);
		         System.out.println("LastName...is"+LastName);
	                
		         session = request.getSession(true);
	         	 session.setAttribute("user_name", firstName+" "+LastName);
	         	 session.setAttribute("user_mail",  Email_address); 
	         	 String displayname = firstName+" "+LastName;
	         	String[] strArrName = new String[10];
         		String[] strArrPath = new String[10];
         		String[] strArrFileId = new String[10];
         		String[] strArrIsExpiry = new String[10];
         		int[] intCounter = new int[10];
	             String strResult = loginService.insertgoogleuser(Email_address,"null",displayname,firstName,LastName);
		         
			        System.out.println("strResult in login with google controller....."+strResult);
			         
			         if(strResult.equals("1")){			        	   
			     		session = request.getSession(true);
			      		session.setAttribute("user_name", displayname);
			      		session.setAttribute("user_mail",  Email_address);
			      		session.setAttribute("strArrName",  strArrName);
		         		session.setAttribute("strArrPath",  strArrPath);
		         		session.setAttribute("strArrFileId",  strArrFileId);
		         		session.setAttribute("strArrIsExpiry",  strArrIsExpiry);
		         		session.setAttribute("intCounter",  intCounter);
			      		
			     	}
			 		else if(strResult.equals("2")){
			 	      	   
			 	 		session = request.getSession(true);
			 	  		session.setAttribute("user_name", displayname);
			 	  		session.setAttribute("user_mail",  Email_address);
			 	  		session.setAttribute("strArrName",  strArrName);
		         		session.setAttribute("strArrPath",  strArrPath);
		         		session.setAttribute("strArrFileId",  strArrFileId);
		         		session.setAttribute("strArrIsExpiry",  strArrIsExpiry);
		         		session.setAttribute("intCounter",  intCounter);
			 	  	
			 	 	}
			 		else if(strResult.equals("3")){
			 	      	   
			 	 		session = request.getSession(true);
			 	  		session.setAttribute("user_name", displayname);
			 	  		session.setAttribute("user_mail",  Email_address);
			 	  		session.setAttribute("strArrName",  strArrName);
		         		session.setAttribute("strArrPath",  strArrPath);
		         		session.setAttribute("strArrFileId",  strArrFileId);
		         		session.setAttribute("strArrIsExpiry",  strArrIsExpiry);
		         		session.setAttribute("intCounter",  intCounter);
			 	  	 
			 	 	}
			         return new ModelAndView("redirect:dashboard.do");
			        
		 		}
		 		catch(Exception e){
		 			System.out.println("Google login error ...."+e.toString());
		 			return new ModelAndView("redirect:login.do");
		 		}
		 	}
}

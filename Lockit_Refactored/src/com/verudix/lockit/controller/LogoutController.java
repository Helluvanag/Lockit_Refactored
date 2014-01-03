package com.verudix.lockit.controller;

import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.apache.log4j.Logger;
@Controller
public class LogoutController {
	Logger logger = Logger.getLogger(LogoutController.class);
	
	@RequestMapping("/logout")
    public ModelAndView lockit_login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try{
			HttpSession session = request.getSession(false);
			String strAccessToken = null;
			if(session != null){
				session.removeAttribute("user_name");
				session.removeAttribute("user_mail");
				session.removeAttribute("strArrName");
         		session.removeAttribute("strArrPath");
         		session.removeAttribute("strArrFileId");
         		session.removeAttribute("strArrIsExpiry");
         		session.removeAttribute("intCounter");
         		session.removeAttribute("sessiondoc");
       		    session.removeAttribute("sessionexpiryDate");
       		    session.removeAttribute("sessionstrExpMsg");
       		    session.removeAttribute("sessionstrPrint"); 
         		strAccessToken = (String)session.getAttribute("access_token");
         		
         		if(strAccessToken != null){         		
         		     logger.debug("Inside accesstoken of logout controller");
         		     session.removeAttribute("access_token");
         			 return new ModelAndView("logoutwithgoogle");
         		}else{
         			logger.debug("Inside normal logout of logout controller");
         			session.invalidate();
         			return new ModelAndView("logout");
         		}
			}
		}catch(Exception e){
			logger.debug("The logout controller is throwing---"+e);
		}		
     return new ModelAndView("logout");
    }
}

package com.verudix.lockit.controller;

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
			
			if(session != null){
				session.setAttribute("user_name", "");
				session.setAttribute("user_mail", "");
				session.invalidate();
			}
		}catch(Exception e){
			logger.debug("The logout controller is throwing---"+e);
		}
     return new ModelAndView("logout");
    }
}

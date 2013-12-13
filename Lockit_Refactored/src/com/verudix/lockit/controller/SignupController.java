package com.verudix.lockit.controller;

//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.verudix.lockit.service.LoginService;
import com.verudix.lockit.service.SignupService;
import org.apache.log4j.Logger;
/**
 * Servlet implementation class SignupController
 */
@Controller
public class SignupController  {
	
	private SignupService signupservice;
	HttpSession session;
	Logger logger = Logger.getLogger(SignupService.class);
	
	public void setSignupService(SignupService signupservice) {
        this.signupservice = signupservice;
	}
	@RequestMapping("/loadsignup1.do")
	 public ModelAndView loadsignup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 logger.debug("Inside loadsignup().html of LoadLoginController------");
		 return new ModelAndView("signup");
	    }
	@RequestMapping("/signup1.do")
    public ModelAndView signup(HttpServletRequest request, HttpServletResponse response) throws Exception {
	 String email = request.getParameter("email");
	 String password = request.getParameter("password");
	 String con_password = request.getParameter("confirmpassword");
	 String displayname = request.getParameter("displayname");
	
	 boolean bool = signupservice.registerUser(request,response, email, password,con_password,displayname);
	 if(bool)
		 return new ModelAndView("login");
	 else
		 return new ModelAndView("login");
    }
}
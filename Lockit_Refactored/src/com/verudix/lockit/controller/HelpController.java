package com.verudix.lockit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.verudix.lockit.service.HelpService;
import com.verudix.lockit.service.LoginService;
import org.apache.log4j.Logger;
@Controller
public class HelpController {
private HelpService helpService;
Logger logger = Logger.getLogger(HelpController.class);
	
	public void setHelpService(HelpService helpService) {
        this.helpService = helpService;
    }
	
	@RequestMapping("/help-faqs")
    public ModelAndView lockit_login(HttpServletRequest request, HttpServletResponse response) throws Exception {
	 System.out.println("Inside lockit_login() of HelpController------");
	 
     return new ModelAndView("help-faqs");
    }
}

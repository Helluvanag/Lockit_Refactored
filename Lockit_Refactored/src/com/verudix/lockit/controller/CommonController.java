package com.verudix.lockit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.apache.log4j.Logger;
import com.verudix.lockit.service.CommonService;
import com.verudix.lockit.service.DashboardService;
import com.verudix.lockit.service.LoginService;
@Controller
@SessionAttributes({"user_mail"})
public class CommonController {
	private CommonService commonService;
	private DashboardService dashboardService;
	
	Logger logger = Logger.getLogger(CommonController.class);

	public void setCommonService(CommonService commonService) {
		this.commonService = commonService;
	}
	public void setDashboardService(DashboardService dashboardService) {
		this.dashboardService = dashboardService;       
    }
	@RequestMapping("/loadsignup.do")
	public ModelAndView loadsignup() throws Exception {
		 return new ModelAndView("signup");
	    }
	
	@RequestMapping("/signup.do")
    public ModelAndView signup(HttpServletRequest request,HttpServletResponse response,@RequestParam String email,
    		@RequestParam String password,@RequestParam String confirmpassword,@RequestParam String displayname,final RedirectAttributes redirectAttributes) throws Exception {
		boolean bool = false;
		 String messagek = "";
		 ModelAndView mav = new ModelAndView();
		try{

			 bool = commonService.registerUser(request,response, email, password,confirmpassword,displayname);
			
			 if(bool)
			 {				
				messagek= "Signup Success. A mail has been triggered to your registered mail id.";
				mav.setViewName("login");
				 mav.addObject("message1",messagek);
				 return mav;
				
			 }else
			 {				 
				 messagek= "Sign up failed.User already exists.";
				 mav.setViewName("signup");
				 mav.addObject("message1",messagek);
				 return mav;
			 }
		}catch(Exception e){
			logger.error("The signup is throwing---"+e);
			return new ModelAndView("signup");
		}		
	
   }
	@RequestMapping("/loadChPassword.do")
    public ModelAndView loadChPassword(HttpServletRequest request, @ModelAttribute("user_mail") String user_mail) throws Exception {
		String Photourl="";
		Photourl  = dashboardService.GetPhotoUrl(user_mail, request.getServletContext().getRealPath("/"));
		 return new ModelAndView("changePassword","Photourl",Photourl);
    }
	@RequestMapping("/changePassword.do")	
    public ModelAndView ChangePassword(HttpServletRequest request, /*@ModelAttribute("user_mail") String user_mail,*/
    		@RequestParam(value = "oldpwd",defaultValue = "") String oldpwd, @RequestParam(value = "newpwd",defaultValue = "") String newpwd,
    		@RequestParam(value = "newconfirmpwd",defaultValue = "") String newconfirmpwd/*,final RedirectAttributes redirectAttributes*/) throws Exception {
		String Photourl="";
		String updatePassword = "";
		
		ModelAndView mav = new ModelAndView();
		try{ 
			 logger.debug("----"+oldpwd+"--"+newpwd+"--"+newconfirmpwd+"--");
			 HttpSession session = request.getSession(false);
			String message = "",message1 = "";
	 		String user_mail = (String) session.getAttribute("user_mail");	
	 		Photourl  = dashboardService.GetPhotoUrl(user_mail, request.getServletContext().getRealPath("/"));
	 		 mav.setViewName("changePassword");
			 mav.addObject("Photourl",Photourl);
	 		if(oldpwd.equals("") && newpwd.equals("") && newconfirmpwd.equals("")  ){
	 			message = "All Fields Are Mandatory.";
	 			mav.addObject("message",message);
	 			return mav;
	 		}
	 		else if(oldpwd.equals("") ){
	 			message = "Old Password is Mandatory.";
	 			mav.addObject("message",message);
	 			return mav;
	 		}
	 		else if(newpwd.equals("") ){
	 			message = "New Password is Mandatory.";
	 			mav.addObject("message",message);
	 			return mav;
	 		}
	 		else if(newconfirmpwd.equals("") ){
	 			message = "Confirm Password is Mandatory.";
	 			mav.addObject("message",message);
	 			return mav;
	 		}
	 		else if(newpwd.length() < 6 || newconfirmpwd.length() < 6){
	 			message = "Password length must be atleast 6 characters.";
	 			mav.addObject("message",message);
	 			return mav;
	 		}
	 		else if(!newpwd.equals(newconfirmpwd)){
	 			message = "Passwords do not Match.";
	 			mav.addObject("message",message);
	 			return mav;
	 		}else{	 			
	 			updatePassword = commonService.changePassword(request,user_mail,oldpwd,newpwd,newconfirmpwd);
	 		}
			 
			 if(updatePassword.equals("1"))
				  message1="Password changed successfully.";
			 else
				 message = "Incorrect old password entered.";			
			 			
			 mav.setViewName("changePassword");
			 mav.addObject("message1",message1);
			 mav.addObject("message",message);
			 return mav;
 		}catch(Exception error){
 			logger.error("The ChangePassword is throwing---"+error);	
 			return new ModelAndView("changePassword","Photourl",Photourl);
 		}
		
		
	}
	
	@RequestMapping("/help-faqs.do")
    public ModelAndView helpFaqs(HttpServletRequest request, @ModelAttribute("user_mail") String user_mail) throws Exception {
		String Photourl="";
		 Photourl  = dashboardService.GetPhotoUrl(user_mail, request.getServletContext().getRealPath("/"));
	     return new ModelAndView("help-faqs","Photourl",Photourl);
    }
	
@RequestMapping("/loadforgotpwd.do")
	
	public ModelAndView loadforgotpwd(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// String email = request.getParameter("email");
	 
		 System.out.println("Inside loadforgotpwd().html of LoadLoginController------");
		 return new ModelAndView("forgot_password");
	 
	}
@RequestMapping("/ForgotPassword.do")
public ModelAndView ForgotPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {

	try{	
		String email = request.getParameter("email");
		System.out.println("email is---"+email);
		boolean bool = commonService.getPwd(request,response, email);
		if(bool)
		 return new ModelAndView("ChekEmail");
		else
		 return new ModelAndView("forgot_password");
	 }catch(Exception e){
		 System.out.println("error in ForgotPassword.do..."+e.toString());
		 return new ModelAndView("login");
	 }
	 }
@RequestMapping("/resetPassword.do")
public ModelAndView loadresetpwd(HttpServletRequest request, HttpServletResponse response) throws Exception {
 String email = request.getParameter("UserName");
 String Key = request.getParameter("Key");
 HttpSession session = request.getSession(false);
 session = request.getSession(true);
 session.setAttribute("UserName", email);
 session.setAttribute("Key", Key);
	 System.out.println("Inside resetPassword.do------"+email);
	 return new ModelAndView("resetPassword");
 
}
			
		
		@RequestMapping("/resetPassword1.do")
	    public ModelAndView Forgotpwd(HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes) throws Exception {

			 try{					 
				String password = request.getParameter("password");				
				 HttpSession session = request.getSession(false);
				String UserName = (String)session.getAttribute("UserName");
				String Key = (String)session.getAttribute("Key");
				System.out.println("password is----"+password+"UserName..."+UserName);
				
				boolean bool = commonService.resetpwd(request,response,UserName, password,Key);
				 String messagek = "";
				 ModelAndView mav = new ModelAndView();
				if(bool)
				{
					messagek= "Password has been changed.";
					mav.setViewName("login");
					 mav.addObject("message1",messagek);
					 return mav;
					
				}
				else
				{
					messagek= "Password cannot be changed.";
					mav.setViewName("resetPassword");
					 mav.addObject("message1",messagek);
					 return mav;
					
					
				}
			 }catch(Exception e){
				 System.out.println("error in ForgotPassword.do..."+e.toString());
				 return new ModelAndView("login");
			 }
			 }
}

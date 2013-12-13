package com.verudix.lockit.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.verudix.lockit.form.DashboardForm;
import com.verudix.lockit.form.ShareFileForm;
import com.verudix.lockit.service.ContactsService;
import com.verudix.lockit.service.DashboardService;

import org.apache.log4j.Logger;
@Controller
@SessionAttributes({"user_mail"})
public class ContactsController {	
	
	private ContactsService contactsService;
	private DashboardService dashboardService;
	Logger logger = Logger.getLogger(ContactsController.class);
	HttpSession session;
	String username;
	private ArrayList<HashMap<String,Object>> list	= new ArrayList<HashMap<String,Object>>();
	ArrayList<HashMap<String, Object>> mydata1 =  new ArrayList<HashMap<String,Object>>();
	
	
	public void setContactsService(ContactsService contactsService) {
        this.contactsService = contactsService;    
    }
	public void setDashboardService(DashboardService dashboardService) {
        this.dashboardService = dashboardService;       
    }
	
	
	/*
	 * Display Contacts
	 * 
	 */
	@RequestMapping("/contacts.do")
    public ModelAndView contacts(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("user_mail") String user_mail) throws Exception{ 
		ModelAndView mav = new ModelAndView();
   		try{
			logger.debug("Inside contacts of ContactsController------");
			HttpSession session = request.getSession(false);
	 		 if(session == null){
	 			 return new ModelAndView("login");
	 		 }
	 		
			list.clear();
			mydata1.clear();
			
			list = contactsService.displayContacts(user_mail);			
			mydata1=contactsService.GetGroups(user_mail);			
			String Photourl = dashboardService.GetPhotoUrl(user_mail, request.getServletContext().getRealPath("/"));	
			mav.setViewName("contacts");		
			mav.addObject("contacts_data", list);
			mav.addObject("Photourl",Photourl);			
			mav.addObject("listOfgroups", mydata1);
			return mav;
		}catch(Exception e){
			logger.error("error Inside contacts of ContactsController------"+e.toString());			
		}
   		return mav;
	}
	
	/*
	 * Add New Contact
	 * 
	 */
	@RequestMapping("/addcontact.do")
    public ModelAndView addcontact(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail") String user_mail,final RedirectAttributes redirectAttributes) throws Exception { 
   		 logger.debug("Inside addcontact of ContactsController------");
   		
		 try
		 {
			 String message="";
			 String strEmailID = request.getParameter("txt_Emailid");
			 String strFirstName = request.getParameter("txt_Firstname");
			 String strLastName = request.getParameter("txt_Lastname");
			 String strSelectedGroup = request.getParameter("ddl_GroupName");
			 int intGroup = Integer.parseInt(strSelectedGroup);
			 Calendar dateTime=Calendar.getInstance();
	         DateFormat newFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss ");
	         String createddate =  newFormat.format(dateTime.getTime());
			 boolean bool = contactsService.addNewContact(request, strEmailID, strFirstName,strLastName,user_mail,intGroup,user_mail,createddate);			 
			
			 if(bool)
			 {	
				 redirectAttributes.addFlashAttribute("message", "Contact  added successfully.");				
				 return new ModelAndView("redirect:contacts.do");
			 }else
			 {	 
				 String error_message = (String)request.getAttribute("error_message");
				 redirectAttributes.addFlashAttribute("error_message", error_message);
				 redirectAttributes.addFlashAttribute("message1", "Cannot add the contact.");
				 return new ModelAndView("redirect:contacts.do");
			 }
			
	    }
	    catch(Exception e){
	    		logger.debug("Error inside ContactsController...."+e.toString());
	    	 return new ModelAndView("redirect:contacts.do");
	    }
    	
    }
	
	/*
	 * Delete Existing Contact
	 * 
	 */
	@RequestMapping("/deletecontact.do")
    public ModelAndView deletecontact(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail") String user_mail,final RedirectAttributes redirectAttributes) throws Exception{
   		 logger.debug("Inside deletecontact of ContactsController------");
   		
		 try{
			 String message="";
				 String contactid = request.getParameter("deletecontactid");
				 logger.debug("contactid value------"+contactid);	
				 
				// int groupid=contactsService.selectUserGroupID(user_mail);
				 boolean bool = contactsService.deleteContact(request, contactid, user_mail);								 
				 if(bool)
				 {
					 redirectAttributes.addFlashAttribute("message", "Contact  deleted successfully.");
					 return new ModelAndView("redirect:contacts.do");
				 }
				 else
				 {
					 redirectAttributes.addFlashAttribute("message", "Contact deletion failed.");	
					 return new ModelAndView("redirect:contacts.do");
				 }
		 }catch(Exception e){
			 return new ModelAndView("redirect:contacts.do");
		 }
	}
	
	/*
	 *  Update Existing Contact
	 * 
	 */	
	@RequestMapping("/updatecontact.do")
    public ModelAndView updatecontact(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail") String user_mail,final RedirectAttributes redirectAttributes) throws Exception {
		 logger.debug("Inside updatecontact of ContactsController------");
		
		 try{
			 String message="";
			 String contactid = request.getParameter("updatecontactid");
			 String email = request.getParameter("txt_EmailEdit");
			 String firstname = request.getParameter("txt_FirstnameEdit");
			 String lastname = request.getParameter("txt_LastnameEdit");			 
			 boolean bool = contactsService.updateContact(request, contactid, email,firstname,lastname,user_mail,0);
			 
			 if(bool)
			 {
				 redirectAttributes.addFlashAttribute("message", "Contact  updated successfully.");
				 return new ModelAndView("redirect:contacts.do");
			 }
			 else
			 {
				 redirectAttributes.addFlashAttribute("message", "Contact cannot be updated.");	
				 return new ModelAndView("redirect:contacts.do");
			 }
		 }
		 catch(Exception e){
			 return new ModelAndView("redirect:contacts.do");
		 }
    }
	
	/*
	 * Delete Single / Multiple Contacts
	 * 
	 */	
	@RequestMapping("/deletecontacts.do")
  
	public ModelAndView deletecontacts(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail")
    String user_mail, final RedirectAttributes redirectAttributes) throws Exception { 	 
  
		 logger.debug("Inside single / multiple deletecontacts of ContactsController----- -");	
		
		 try{
			String message="";
				 String contactid = request.getParameter("selectedcontact_ids");				 
				 String[] contactids = contactid.split(",");				 
				 logger.debug("contactids..."+contactids);				 
				 boolean bool = contactsService.deleteContacts(request, contactids, user_mail);								 
				 if(bool)
				 {
					 redirectAttributes.addFlashAttribute("message", "Contact(s)  deleted successfully.");	
					 return new ModelAndView("redirect:contacts.do"); 
				 }
					
				 else{
					 redirectAttributes.addFlashAttribute("message", "Contact deletion failed.");	
					 return new ModelAndView("redirect:contacts.do");	
				 }
		 }catch(Exception e){
			 return new ModelAndView("redirect:contacts.do");
		 }
	}
}

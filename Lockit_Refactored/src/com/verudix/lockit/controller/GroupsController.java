package com.verudix.lockit.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.verudix.lockit.service.DashboardService;
import com.verudix.lockit.service.GroupsService;
import com.verudix.lockit.util.LDAPTest;
@Controller
@SessionAttributes({"user_mail"})
public class GroupsController {
	Logger logger = Logger.getLogger(GroupsController.class);
	private GroupsService groupsService;
	private DashboardService dashboardService;
	HttpSession session;
	String username;
	private ArrayList<HashMap<String,Object>> list	= new ArrayList<HashMap<String,Object>>();
	//private ArrayList<HashMap<String,Object>> list1	= new ArrayList<HashMap<String,Object>>();
	int offset;
	int length;

	public void setGroupsService(GroupsService groupsService) {
        this.groupsService = groupsService;
    }
	public void setDashboardService(DashboardService dashboardService) {
        this.dashboardService = dashboardService;
    }
	/*
	 * 
	 * Display Groups
	 * 
	 */
	
	@RequestMapping("/groups.do")
    public ModelAndView displayGroups(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail") String user_mail) throws Exception 
    {
			 logger.debug("Inside displayGroups() of GroupsController------");			
			 try{
									 
					 list = groupsService.displayGroups(user_mail);
					 String Photourl = dashboardService.GetPhotoUrl(user_mail, request.getServletContext().getRealPath("/"));
					
					 ModelAndView mav = new ModelAndView();
					 mav.setViewName("groups");
					 mav.addObject("Photourl",Photourl);
					 mav.addObject("groups_data",list);
					 return mav;										 
			}catch(Exception e){
					logger.error("error Inside groups of GroupsController------"+e.toString());
					return new ModelAndView("groups");							
			}
    }
	
	

	/*
	 * 
	 * Add Group
	 * 
	 */
	
	@RequestMapping("/addgroup.do")
    public ModelAndView dispalyaddGroup(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail") String user_mail) throws Exception 
    {
		
		/*int maxEntriesPerPage = 10;
		int page = 1;

		String pageNumberValue = request.getParameter("pageNumber");

		logger.debug("pageNumberValue in controller...."+pageNumberValue);
		
		if (pageNumberValue != null) {
			try {
				page = Integer.parseInt(pageNumberValue);
				logger.debug("Page Number:" + page);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		int offset = maxEntriesPerPage * (page - 1);
		TestList(offset, maxEntriesPerPage,user_mail);*/
	//	session = request.getSession();
	//	username = (String)session.getAttribute("user_mail");					 
		String Photourl = dashboardService.GetPhotoUrl(user_mail, request.getServletContext().getRealPath("/"));
	//	session = request.getSession(false);
		/*session.setAttribute("pages", getPages());
		session.setAttribute("allusercontacts", getListByOffsetAndLength());				
		return new ModelAndView("addgroup","Photourl",Photourl);*/
		ArrayList<HashMap<String,Object>> list1	= new ArrayList<HashMap<String,Object>>();
		list1 = groupsService.getAllUserContacts(user_mail);	
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("addgroup");
		 mav.addObject("Photourl",Photourl);
		/* mav.addObject("pages", getPages());*/
		 mav.addObject("allusercontacts", list1);
		 return mav;	
    }
	/**
	 * @param offset
	 * @param length
	 */
	public void TestList(int offset, int length,String user_mail) {
		this.offset = offset;
		this.length = length;
		fillList(user_mail);
	}
	/*
	 * Hard-coded sample data. Normally this would come from a real data source
	 * such as a database
	 */
	public void fillList(String user_mail) {
		
		try{			
			//list.clear();
			//username = (String)session.getAttribute("user_mail");
			list = groupsService.getAllUserContacts(user_mail);		
		}catch(Exception e){
		
			
		}
	}
	
	/**
	 * @return List
	 */
	public ArrayList<HashMap<String,Object>> getListByOffsetAndLength() {

		ArrayList<HashMap<String,Object>> arrayList = new ArrayList<HashMap<String,Object>>();
		int to = this.offset + this.length;
		if (this.offset > list.size())
			this.offset = list.size();
		if (to > list.size())
			to = list.size();
		for (int i = this.offset; i < to; i++) {
			arrayList.add(list.get(i));
		}
		return arrayList;
	}

	/**
	 * @return List with page numbers
	 */
	public List getPages() {
		List pageNumbers = new ArrayList();
		int pages = list.size() / this.length;
		if (list.size() % this.length != 0) {
			pages = pages + 1;
		}

		for (int i = 1; i <= pages; i++) {
			pageNumbers.add(new Integer(i));
		}
		return pageNumbers;
	}
	
	/*
	 * 
	 * Add New Group
	 * 
	 */
	
	@RequestMapping("/addnewgroup.do")
    public ModelAndView addGroup(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail") String user_mail,final RedirectAttributes redirectAttributes) throws Exception 
    {
		try{	
			String message="";
			logger.debug("Inside addgroup() of GroupsController------");
			
			 String strGroupname = request.getParameter("txt_GroupName");
			 String selected_contacts = request.getParameter("selectedcontact_ids");
			 
			 logger.debug("strGroupname...."+strGroupname);
			 logger.debug("selected_contacts...."+selected_contacts);
			 
			 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	  		 Calendar cal = Calendar.getInstance();
	  		 String uploaded_date = dateFormat.format(cal.getTime());
	  		 
			 boolean bool = groupsService.addNewGroup(request, strGroupname, user_mail,uploaded_date,selected_contacts);
			 
			 logger.debug("bool inside ContactsController ...."+bool);
			 
			 if(bool)
			 {
				 redirectAttributes.addFlashAttribute("message", "Group added successfully."); 
				 return new ModelAndView("redirect:groups.do");
			 }
			 else
			 {
				 redirectAttributes.addFlashAttribute("message1", request.getAttribute("message1"));
				 redirectAttributes.addFlashAttribute("error_message", "Group cannot be added."); 
				 return new ModelAndView("redirect:groups.do");
			 }
			
			 
		}catch(Exception e){
			logger.debug("error Inside addgroup of GroupsController------"+e.toString());
			 return new ModelAndView("redirect:groups.do");
		}
			
    }
	
	/*
	 * 
	 * Delete Group
	 * 
	 */
	
	@RequestMapping("/deletegroup.do")
    public ModelAndView deleteGroup(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail") String user_mail,final RedirectAttributes redirectAttributes) throws Exception{ 
    
		try{
			String message="";
			logger.debug("Inside deleteGroup() of GroupsController------");			
			 String groupid = request.getParameter("deletegroupid");			 
				 
			 logger.debug("groupid value------"+groupid);			 
			 boolean bool = groupsService.deleteGroup(request, user_mail,groupid);							 
			 if(bool){	
				 redirectAttributes.addFlashAttribute("message", "Group deleted successfully.");
				 return new ModelAndView("redirect:groups.do");
			 }else{		
				 redirectAttributes.addFlashAttribute("message1", "Group deletion failed.");
				 return new ModelAndView("redirect:groups.do");
			 }		 
	 
		}catch(Exception e){
			logger.debug("error Inside addgroup of GroupsController------"+e.toString());
			 return new ModelAndView("redirect:groups.do");
		}
    }
	
	/*
	 * 
	 * Import Active Directory
	 * 
	 */
	
	@RequestMapping("/importactivedirectory.do")
    public ModelAndView importactivedirectory(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail") String user_mail) throws Exception{ 
   logger.debug("Inside importactivedirectory() of GroupsController------");
   String Photourl = dashboardService.GetPhotoUrl(user_mail, request.getServletContext().getRealPath("/"));
   
   return new ModelAndView("importactivedirectory","Photourl",Photourl);   
    }
	
  @RequestMapping("/importactivedirectorycontacts.do")
    public ModelAndView importactivedirectorycontacts(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail") String user_mail) throws Exception{ 
   logger.debug("Inside importactivedirectory() of GroupsController------");   
   String domainserver = request.getParameter("txt_domain");
   String username = request.getParameter("txt_domainUser");
   String password = request.getParameter("txt_domainpwd");
   String Photourl = dashboardService.GetPhotoUrl(user_mail, request.getServletContext().getRealPath("/"));
   boolean bool = LDAPTest.LDAPAuthenticate(domainserver, username, password);
   if(bool){
    return new ModelAndView("redirect:groups.do");
   }else{
     ModelAndView mav = new ModelAndView();
    mav.setViewName("importactivedirectory");
    mav.addObject("Photourl",Photourl);
    mav.addObject("dir_error", "Unrecognized Active Directory / Active Directory User.");
   
    return mav; }
    
    }
}



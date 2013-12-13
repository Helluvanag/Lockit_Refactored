package com.verudix.lockit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.verudix.lockit.service.DashboardService;
import com.verudix.lockit.service.EditGroupService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itextpdf.text.log.SysoLogger;
@Controller
@SessionAttributes({"user_mail"})
public class EditGroupController {
	Logger logger = Logger.getLogger(EditGroupController.class);
	private EditGroupService editgroupService;
	HttpSession session;
	String username;
	private ArrayList<HashMap<String,Object>> alluserContacts	= new ArrayList<HashMap<String,Object>>();
	
	Vector<String> data = new Vector<String>();
	private DashboardService dashboardService;
	int offset;
	int length;
	public void setEditGroupService(EditGroupService editgroupService) {
        this.editgroupService = editgroupService;
    }
	public void setDashboardService(DashboardService dashboardService) {
        this.dashboardService = dashboardService;
	}
	/*
	 * 
	 * Display Edit Group Details
	 * 
	 */
	

	@RequestMapping("/displayeditgroup.do")
    public ModelAndView displayEditGroupDetails(HttpServletRequest request, HttpServletResponse response) throws Exception 
    {
			 try{
				    session = request.getSession(false);
				    username = (String)session.getAttribute("user_mail");
				 	String gname = request.getParameter("editgroupname");
					String gid = request.getParameter("editgroupid");					
					session.setAttribute("groupname",gname);
					session.setAttribute("groupid", gid);	
					return new ModelAndView("redirect:editgroup.do");
			}catch(Exception e){
					logger.error("error Inside displayEditGroupDetails of EditGroupController------"+e.toString());				
					return new ModelAndView("redirect:editgroup.do");
			}
    }
	@RequestMapping("/editgroup.do")
    public ModelAndView EditGroupDetails(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail") String user_mail, final RedirectAttributes redirectAttributes) throws Exception 
    {
			 String Photourl = "";
			 ArrayList<HashMap<String,Object>> groupUserContacts	= new ArrayList<HashMap<String,Object>>();
		
			 try{				   
					session = request.getSession(false);	
					String gid =(String) session.getAttribute("groupid");
					groupUserContacts = editgroupService.getGroupUserContacts(user_mail, gid);	
					alluserContacts = editgroupService.getAllUserContacts(user_mail);
					Photourl = dashboardService.GetPhotoUrl(user_mail, request.getServletContext().getRealPath("/")); 					
					/*int maxEntriesPerPage = 10;
					int page = 1;
					String pageNumberValue = request.getParameter("pageNumber");				
									
					if (pageNumberValue != null) {
						try {
							page = Integer.parseInt(pageNumberValue);							
						} catch (NumberFormatException e) {
							e.printStackTrace();
						}
					}
					int offset = maxEntriesPerPage * (page - 1);
					TestList(offset, maxEntriesPerPage);										
					session.setAttribute("editgrouppages", getPages());*/
					session.setAttribute("editgroupallusercontacts", alluserContacts);					
					 
			}catch(Exception e){				
					logger.error("error Inside displayEditGroupDetails of EditGroupController------"+e.toString());		
			}
			 
			 ModelAndView mav = new ModelAndView();
			 mav.setViewName("editgroup");
			 mav.addObject("groupUserContacts", groupUserContacts);	
			 mav.addObject("alluserContacts", alluserContacts);
			 mav.addObject("Photourl", Photourl);
			 return mav;
    }
	
	/**
	 * @param offset
	 * @param length
	 * @param user_mail 
	 */
	public void TestList(int offset, int length) {
		this.offset = offset;
		this.length = length;
		fillList();
	}
	/*
	 * Hard-coded sample data. Normally this would come from a real data source
	 * such as a database
	 */
	public void fillList() {
		
		try{			
			alluserContacts.clear();			
			alluserContacts = editgroupService.getAllUserContacts(username);		
		}catch(Exception e){
			logger.error("The exception fillList() is---"+e);
		}
	}
	
	/**
	 * @return List
	 */
	public ArrayList<HashMap<String,Object>> getListByOffsetAndLength() {

		ArrayList<HashMap<String,Object>> arrayList = new ArrayList<HashMap<String,Object>>();
		int to = this.offset + this.length;
		if (this.offset > alluserContacts.size())
			this.offset = alluserContacts.size();
		if (to > alluserContacts.size())
			to = alluserContacts.size();
		for (int i = this.offset; i < to; i++) {
			arrayList.add(alluserContacts.get(i));
		}
		return arrayList;
	}

	/**
	 * @return List with page numbers
	 */
	public List getPages() {
		List pageNumbers = new ArrayList();		
		int pages = alluserContacts.size() / this.length;
		if (alluserContacts.size() % this.length != 0) {
			pages = pages + 1;
		}

		for (int i = 1; i <= pages; i++) {
			pageNumbers.add(new Integer(i));
		}		
		return pageNumbers;
	}
	/*
	 * 
	 * Update Group Details
	 * 
	 */
	/*
	 * 
	 * Update Group Details
	 * 
	 */
	
	@RequestMapping("/updategroup.do")
    public ModelAndView updateEditGroupDetails(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("user_mail") String user_mail, final RedirectAttributes redirectAttributes) throws Exception { 
    {
		     String selection = request.getParameter("selection");
			 String unselected = request.getParameter("unselected");
			 String groupid = request.getParameter("groupid");
			 editgroupService.updateUserGroup(groupid,user_mail,unselected,0);	
			 boolean bool = editgroupService.updateUserGroup(groupid,user_mail,selection,1);	
			 if(bool)
			 {
				 redirectAttributes.addFlashAttribute("message", "Group updated."); 
			 }else
			 {
				 redirectAttributes.addFlashAttribute("message", "Group cannot be updated.");
			 }
			 return new ModelAndView("redirect:groups.do");
    }
}}
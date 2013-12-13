package com.verudix.lockit.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itextpdf.text.log.SysoLogger;
import com.verudix.lockit.dao.ContactsDao;
import com.verudix.lockit.dao.UserDao;
import org.apache.log4j.Logger;
public class ContactsServiceImpl implements ContactsService{
	Logger logger = Logger.getLogger(ContactsServiceImpl.class);
	private ContactsDao contactsDao;
	private ArrayList<HashMap<String,Object>> list	= new ArrayList<HashMap<String,Object>>();
	private ArrayList<HashMap<String,Object>> groups	= new ArrayList<HashMap<String,Object>>();
	
	public void setContactsDao(ContactsDao contactsDao) {
		this.contactsDao = contactsDao;
	}
	
	@Override
	public boolean addNewContact(HttpServletRequest request, String emailid,
			String firstname, String lastname, String userid,int group,String createdby,String createddate) {

		try{
			 	List<String> strEmailIds = contactsDao.uspGetAllUserContacts(userid);
			 	if(strEmailIds.contains(emailid)){
			 		 request.setAttribute("error_message", "Contact already exists.");
			    	 return false;
			 	}
			 	
				String strResult = (String) contactsDao.uspInsertUserContact(emailid, firstname,lastname,userid,group,createdby,createddate);
				int i = 0;
				if(strResult != null){
					i = Integer.parseInt(strResult);
				}
			    if(i==1){  
			    	   return true;
			      } 
			    else if(i == -1){  
			    	   return true;
			      }
			      else{  
			    	  logger.debug("insertion failed....");  
			    	  request.setAttribute("error_message", "Contact already exists.");
			    	  return false;
			      }  
		}catch(Exception e){
			logger.error("Error inside ContactsServiceImpl...."+e.toString());
			 return false;
		}
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> displayContacts(String username) {
		try{
			list.clear();
			list = contactsDao.uspSelectAllUserContacts(username);
			
			return list;
		}catch(Exception e){
			return null;
		}
	}
	@Override
	public boolean deleteContact(HttpServletRequest request, String contactid,String username) {
		try{
			String strResult = (String) contactsDao.uspDeleteUserContact(contactid,username);			
			if(strResult.equals("1")){				
				request.setAttribute("success_message", "Contact deleted successfully.");
				return true;
			}else{				
				return false;
			}		
		}catch(Exception e){
			return false;
		}		
	}
	
	@Override
	public boolean updateContact(HttpServletRequest request, String contactid,
			String email, String firstname, String lastname, String username,
			int i) {	
		try{
			String strResult = (String) contactsDao.uspUpdateUserContact(contactid,email,firstname,lastname,username,i);			
			if(strResult.equals("1")){				
				request.setAttribute("success_message", "Contact updated successfully.");
				return true;
			}else{				
				return false;
			}		
		}catch(Exception e){
			return false;
		}
	}
	
	@Override
	public boolean deleteContacts(HttpServletRequest request,
			String[] contactids, String username) {
		try{
			String strResult = (String) contactsDao.uspDeleteUserContacts(contactids,username);			
			if(strResult.equals("1")){				
				request.setAttribute("success_message", "Contacts deleted successfully.");
				return true;
			}else{				
				return false;
			}		
		}catch(Exception e){
			return false;
		}
	}
	@Override
	public ArrayList<HashMap<String, Object>> GetGroups(String user_mail) {
		try{
			groups.clear();			
			groups = (ArrayList<HashMap<String, Object>>) contactsDao.
					 usp_Select_Groups(user_mail);
			
		
		return groups;
		
		}catch(Exception e){
			return null;
		}
	}}


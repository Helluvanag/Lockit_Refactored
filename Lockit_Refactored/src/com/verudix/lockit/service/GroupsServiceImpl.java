package com.verudix.lockit.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.verudix.lockit.dao.GroupsDao;
import org.apache.log4j.Logger;
public class GroupsServiceImpl implements GroupsService{
	
	private GroupsDao groupsDao;
	Logger logger = Logger.getLogger(GroupsServiceImpl.class);
	private ArrayList<HashMap<String,Object>> list	= new ArrayList<HashMap<String,Object>>();
	
	public void setGroupsDao(GroupsDao groupsDao) {
		this.groupsDao = groupsDao;
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> displayGroups(String username) {

		try{			
			list = groupsDao.uspSelectGroups(username);
			return list;
		}catch(Exception e){			
			return null;
		}
	}
	
	@Override
	public boolean addNewGroup(HttpServletRequest request, String strGroupname,
			String username, String uploaded_date,String selected_contacts) {

		try{			
			String strResult = (String) groupsDao.uspInsertGroup(strGroupname,username,uploaded_date);	
			if(strResult.equals("0")){
				request.setAttribute("message1", "Group already exists.");
			}
			String strResult1="" ;			
			if(Integer.parseInt(strResult)>0){				
				 String[] contacts = selected_contacts.split(",");				 
				 if(contacts.length>0){				 
					 for(int i=0;i<contacts.length;i++){
						 if(contacts[i].equals("")){
						 }
						 else{
							 strResult1 = (String) groupsDao.uspInsertUserGroups(contacts[i],Integer.parseInt(strResult),username,uploaded_date);
								
						 }
						 }
					 if(strResult1.equals("1")){
						 return true;
					 }else{
					return false;
					}
					 
				 }else{
					 return true;
				 }
				 
			}else{
				//request.setAttribute("message", "Group name already exists.");
				return false;
			}
		
		}catch(Exception e){
			return false;
		}	
	}
	@Override
	public boolean deleteGroup(HttpServletRequest request, String username,
			String groupid) {

		try{			
			String strResult = (String) groupsDao.uspdeletegroup(username,groupid);			
			if(strResult.equals("1")){	
				return true;
			}else{				
				return false;
			}		
		}catch(Exception e){
			return false;
		}		
	}
	@Override
	public ArrayList<HashMap<String, Object>> getAllUserContacts(String username) {

		try{
			list.clear();
			list = groupsDao.usp_select_all_users(username);
			return list;
		}catch(Exception e){		
			return null;
		}
	}
}

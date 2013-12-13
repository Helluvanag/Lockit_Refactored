package com.verudix.lockit.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.verudix.lockit.dao.EditGroupDao;
import org.apache.log4j.Logger;
public class EditGroupServiceImpl implements EditGroupService {
	Logger logger = Logger.getLogger(EditGroupServiceImpl.class);
	private EditGroupDao editgroupDao;
	private ArrayList<HashMap<String,Object>> list	= new ArrayList<HashMap<String,Object>>();
	private ArrayList<HashMap<String,Object>> list1	= new ArrayList<HashMap<String,Object>>();
	
	public void setEditGroupDao(EditGroupDao editgroupDao) {
		this.editgroupDao = editgroupDao;
	}
	@Override
	public ArrayList<HashMap<String, Object>> getAllUserContacts(String username) {

		try{
			list.clear();			
			list = editgroupDao.usp_select_all_users(username);
			return list;
		}catch(Exception e){
			logger.error("error in EditGroupServiceImpl getAllUserContacts()..."+e.toString());
			return null;
		}
	}
	@Override
	public ArrayList<HashMap<String, Object>> getGroupUserContacts(
			String username, String gid) {
			
		try{			
				list1.clear();				
				list1 = editgroupDao.usp_select_users_of_Group(username,gid);				
				return list1;				
			}catch(Exception e){				
				logger.error("error in EditGroupServiceImpl getGroupUserContacts()..."+e.toString());				
				return null;
			}
		}
	@Override
	public boolean updateUserGroup(String groupid, String username,
			String selection, int i) throws SQLException {
		
		String strResult1 = "";
		 String[] selected_items = selection.split(",");
		 
		 if(selected_items.length>0){
			 
			 for(int j=0;j<selected_items.length;j++){
				 logger.debug("j : "+selected_items[j]);
				 if(selected_items[j].equals("")){					 
				 }
				 else{
					 strResult1 = (String) editgroupDao.usp_update_UserGroup(groupid,username,selected_items[j],i);						
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
		
	}
}

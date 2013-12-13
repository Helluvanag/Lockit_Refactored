package com.verudix.lockit.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import com.verudix.lockit.dao.ProfileDao;

public class ProfileServiceImpl implements ProfileService {
	private ProfileDao profileDao;
	Logger logger = Logger.getLogger(ProfileServiceImpl.class);
	public void setProfileDao(ProfileDao profileDao) {
		this.profileDao = profileDao;
	}
	
	@SuppressWarnings("unused")
	@Override
	public String updateProfile(HttpServletRequest request,	String logged_user_mail, String frstname, String lstname, String mail, String organization, String location, String mobile,
			String phone, String display, String photourl, String modifieddate) {
		
		String strResult = "";
		String actual_file_path  = "",rootpath="",strFileName;
		int maxSize = 2 * 1024 * 1024; //equals to 2MB
		int filesize = 0;
		try{
		 strResult = (String) profileDao.usp_Update_UserPrfoile(logged_user_mail,frstname,lstname,mail,organization,location,mobile,phone,display,photourl,modifieddate);   
		 	if(frstname.length()>0 &&  display.length()>0 && photourl.length()>0 ){	
		 		if(strResult.equals("1")){
		 			request.setAttribute("message1", "Your profile has been updated successfully..");			
		 			return strResult;
		 		}else{
	     		return strResult;
		 		}
		 	}else{
			request.setAttribute("message", "Check Fields...Firstname ,LastName,DisplayName");
		 	}
		}catch(Exception error){
			logger.error("Error:"+error.toString());
			return strResult;
		}
		return strResult ;
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> displayProfile(HttpServletRequest request, String logged_user_mail) {
		
		ArrayList<HashMap<String,Object>> profileList	= new ArrayList<HashMap<String,Object>>();
		try{
			   profileList = profileDao.usp_Select_UserPrfoile(logged_user_mail);
		}catch(Exception error){
			logger.error("Error:"+error.toString());
			//return profileList;
		}
		return profileList;
	}
	
	
}

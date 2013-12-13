package com.verudix.lockit.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface ProfileService {

	String updateProfile(HttpServletRequest request, String logged_user_mail,
			String frstname, String lstname, String mail, String organization,
			String location, String mobile, String phone, String display,
			String photourl, String modifieddate);

	ArrayList<HashMap<String, Object>> displayProfile(
			HttpServletRequest request, String logged_user_mail);

	
	

}

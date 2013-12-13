package com.verudix.lockit.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface GroupsService {

	public ArrayList<HashMap<String, Object>> displayGroups(String username);

	public boolean addNewGroup(HttpServletRequest request, String strGroupname,
			String username, String uploaded_date, String selected_contacts);

	public boolean deleteGroup(HttpServletRequest request, String username,
			String groupid);

	public ArrayList<HashMap<String, Object>> getAllUserContacts(String username);

	

}

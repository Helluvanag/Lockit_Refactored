package com.verudix.lockit.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface ContactsService {
	
	public boolean addNewContact(HttpServletRequest request, String emailid, String firstname, String lastname,String userid, int group,String createdby, String createddate);

	public ArrayList<HashMap<String, Object>>  displayContacts(String username);

	public boolean deleteContact(HttpServletRequest request, String contactid,String username);

	public boolean updateContact(HttpServletRequest request, String contactid,
			String email, String firstname, String lastname, String username,
			int i);

	public boolean deleteContacts(HttpServletRequest request,
			String[] contactids, String username);

	public ArrayList<HashMap<String, Object>> GetGroups(String user_mail);
	
}

package com.verudix.lockit.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface ContactsDao {
	
	public String uspInsertUserContact(String emailid,String firstname,String lastname,String userid,int group,String createdby,String createddate) throws SQLException;

	public ArrayList<HashMap<String, Object>> uspSelectAllUserContacts(String username) throws SQLException;
	public List<String> uspGetAllUserContacts(String username) throws SQLException;
	public String uspDeleteUserContact(String contactid, String username) throws SQLException;

	public String uspUpdateUserContact(String contactid, String email,
			String firstname, String lastname, String username, int i) throws SQLException;

	public String uspDeleteUserContacts(String[] contactids, String username) throws SQLException;

	public ArrayList<HashMap<String, Object>> usp_Select_Groups(String user_mail);

	
}

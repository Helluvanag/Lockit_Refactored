package com.verudix.lockit.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public interface GroupsDao {

	public ArrayList<HashMap<String, Object>> uspSelectGroups(String username) throws SQLException;

	public String uspInsertGroup(String strGroupname, String username,
			String uploaded_date) throws SQLException;

	public String uspdeletegroup(String username, String groupid) throws SQLException;

	public String uspInsertUserGroups(String username, int groupid,
			 String username2, String uploaded_date2) throws SQLException;

	public ArrayList<HashMap<String, Object>> usp_select_all_users(
			String username) throws SQLException;

}

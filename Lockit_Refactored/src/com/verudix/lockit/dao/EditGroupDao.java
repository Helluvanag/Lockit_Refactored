package com.verudix.lockit.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public interface EditGroupDao {

	public ArrayList<HashMap<String, Object>> usp_select_all_users(String username) throws SQLException;

	public ArrayList<HashMap<String, Object>> usp_select_users_of_Group(
			String username, String gid) throws SQLException;

	public String usp_update_UserGroup(String groupid, String username,
			String string, int i) throws SQLException;

}

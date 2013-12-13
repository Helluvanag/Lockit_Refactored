package com.verudix.lockit.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public interface EditGroupService {

	public ArrayList<HashMap<String, Object>> getAllUserContacts(String username);

	public ArrayList<HashMap<String, Object>> getGroupUserContacts(
			String username, String gid);

	public boolean updateUserGroup(String groupid, String username,
			String selection, int i) throws SQLException;

}

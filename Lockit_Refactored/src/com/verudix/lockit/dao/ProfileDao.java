package com.verudix.lockit.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public interface ProfileDao {

	public String usp_Update_UserPrfoile(String logged_user_mail, String frstname,
			String lstname, String mail, String organization, String location,
			String mobile, String phone, String display, String photourl,
			String modifieddate) throws SQLException;

	public ArrayList<HashMap<String, Object>> usp_Select_UserPrfoile (String logged_user_mail) throws SQLException ;
}

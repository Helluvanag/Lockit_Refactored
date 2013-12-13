package com.verudix.lockit.dao;

import java.sql.SQLException;
import java.util.List;

public interface UserDao {
	public String uspCheckLogin(String userName,String pwd) throws SQLException;
	public String usp_GoogleRegistration(String email_address, String password,
			String displayname, String firstName, String lastName);
}

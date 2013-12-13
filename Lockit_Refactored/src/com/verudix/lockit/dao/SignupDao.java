
package com.verudix.lockit.dao;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SignupDao {
	public String uspInsertRegistration(HttpServletRequest request,HttpServletResponse response,String email,String password,String con_password,String displayname) throws SQLException;
}

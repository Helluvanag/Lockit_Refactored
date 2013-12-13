package com.verudix.lockit.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommonService {	
	public boolean registerUser(HttpServletRequest request,HttpServletResponse response,String email, String password,String con_password,String displayname);
	public String changePassword(HttpServletRequest request, String logged_user_mail, String userOldpassword, String userNewpassword, String userConfirmpassword) throws SQLException;
	public boolean getPwd(HttpServletRequest request,HttpServletResponse response,String email);
	public boolean resetpwd(HttpServletRequest request,HttpServletResponse response, String email, String password, String key);
}

package com.verudix.lockit.dao;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommonDao {
	public String uspInsertRegistration(String email,String password,String con_password,String displayname) throws SQLException;
	public String usp_Update_Password(String logged_user_mail, String userOldpassword, String userNewpassword) throws SQLException;
	public String usp_pwd(String email) throws SQLException;
	public String usp_get_password(String email) throws SQLException;
	public String uspforgotpwd(HttpServletRequest request, String email,String fpkey) throws SQLException;
	public String uspresetpwd(String email, String password) throws SQLException;
	public String uspcheckPwdKey(String email, String fpkey) throws SQLException;
	public String usp_Select_UserPrfoile(String email) throws SQLException;
	
}

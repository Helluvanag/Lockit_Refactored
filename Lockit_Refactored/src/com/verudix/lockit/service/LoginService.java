package com.verudix.lockit.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface LoginService {
	public boolean authenticateUser(HttpServletRequest request, String userName, String pwd);
	public String insertgoogleuser(String email_address, String password,
			String displayname, String firstName, String lastName);
	/*public void onAuthenticationSuccess(HttpServletRequest request,
            HttpServletResponse response, Authentication authentication)
            throws ServletException, IOException ();*/
}

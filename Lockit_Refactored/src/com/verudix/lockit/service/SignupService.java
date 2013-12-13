package com.verudix.lockit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SignupService {

	boolean registerUser(HttpServletRequest request,HttpServletResponse response, String email,
			String password,String con_password,String displayname);

}


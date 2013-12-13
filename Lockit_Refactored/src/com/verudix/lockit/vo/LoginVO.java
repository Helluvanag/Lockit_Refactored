package com.verudix.lockit.vo;

import java.io.Serializable;
import org.apache.log4j.Logger;
public class LoginVO implements Serializable {
	Logger logger = Logger.getLogger(LoginVO.class);
	private String username;
	private String password;
	private String email;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}

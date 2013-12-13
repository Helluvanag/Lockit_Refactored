package com.verudix.lockit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.verudix.lockit.dao.ContactsDao;

public interface UploadFileService {

	public String uspInsertAddFile(HttpServletRequest request, HttpServletResponse response);
	public String createFolder(HttpServletRequest request, HttpServletResponse response);
	
}

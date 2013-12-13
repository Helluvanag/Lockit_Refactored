package com.verudix.lockit.service;

import com.verudix.lockit.dao.HelpDao;
import com.verudix.lockit.dao.UserDao;
import org.apache.log4j.Logger;
public class HelpServiceImpl implements HelpService{
	private HelpDao helpDao;
	Logger logger = Logger.getLogger(HelpServiceImpl.class);
	public void setHelpDao(HelpDao helpDao) {
		this.helpDao = helpDao;
	}
}

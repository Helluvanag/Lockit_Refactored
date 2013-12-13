package com.verudix.lockit.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.apache.log4j.Logger;
public class HelpDaoImpl extends JdbcDaoSupport implements HelpDao {
	Logger logger = Logger.getLogger(HelpDaoImpl.class);
}

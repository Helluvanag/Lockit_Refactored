package com.verudix.lockit.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.datasource.DataSourceUtils;
//import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.apache.log4j.Logger;
import com.verudix.lockit.procedure.CheckLoginSP;
//import com.verudix.lockit.procedure.SignupSp;
import com.verudix.lockit.util.LockitConstants;
import com.verudix.lockit.vo.LoginVO;


import java.io.File;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletRequest;
public class SignupDaoImpl implements SignupDao

{
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate = null;
		
	Logger logger = Logger.getLogger(SignupDaoImpl.class);
	 public SignupDaoImpl() { }
	 
	 public void setDataSource(DataSource dataSource) {
			if(dataSource!=null){
			this.dataSource = (DataSource) dataSource;
			this.jdbcTemplate = new JdbcTemplate(dataSource);
			}}
	 
	
	public String uspInsertRegistration(HttpServletRequest request,HttpServletResponse response,String email,String password,String con_password,String displayname) throws SQLException {
		Connection	con = null;
		CallableStatement cs = null;	
		ResultSet rs = null;
		logger.debug("values inside uspInsertRegistration are ---"+email+" "+password+" "+displayname +con_password);
		String strResult = "";
				try
				{
					con = DataSourceUtils.getConnection(dataSource);
					cs = con.prepareCall("{call sp_Registration('" + email+ "','" + password + "','"+displayname+"')}");
					cs.execute(); 	  	
					rs = cs.getResultSet();
					logger.debug("The result is---"+rs.toString());	 	  	
					while (rs.next()) {            	
                	 logger.debug("signup_status....."+rs.getString(1));                	 
                	 strResult = rs.getString(1);                	 
					}
				}catch(Exception e)
				{
					logger.debug(e.toString());
				}finally{
					rs.close();
					cs.close();
					con.close();
				}
				return strResult;
	}
}
		
		

	
	 	  	
         



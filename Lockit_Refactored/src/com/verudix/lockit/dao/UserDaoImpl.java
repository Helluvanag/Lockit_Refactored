package com.verudix.lockit.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;
//import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.apache.log4j.Logger;

import com.verudix.lockit.controller.LoginController;
import com.verudix.lockit.procedure.CheckLoginSP;
import com.verudix.lockit.util.LockitConstants;
import com.verudix.lockit.vo.LoginVO;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

import javax.sql.DataSource;
@Repository
public class UserDaoImpl /*extends JdbcDaoSupport*/ implements UserDao {
	//private CheckLoginSP checkLoginSP;
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate = null;
	//private	CallableStatement cs;	
	//private	ResultSet rs;	
	
	Logger logger = Logger.getLogger(UserDaoImpl.class);
	public UserDaoImpl() { }
	public void setDataSource(DataSource dataSource) {
			if(dataSource!=null){
			this.dataSource = (DataSource) dataSource;
			this.jdbcTemplate = new JdbcTemplate(dataSource);
			}
	}
	
	//@SuppressWarnings({ "rawtypes", "unchecked" })
	/*public String uspCheckLogin(String username, String password) {
		List<LoginVO> result = null;
		// Call the stored procedure
		checkLoginSP = new CheckLoginSP(getJdbcTemplate());
		Map data = checkLoginSP.uspCheckLogin(username, password);
		// retrieve the list of objects
		result = (List<LoginVO>) data.get(LockitConstants.RESULT_LIST);
		LoginVO lvo = result.get(0);
		String strResult = lvo.getUsername();
		// retrieve the status info
	//	Integer code = (Integer) data.get(LockitConstants.RETURN_CODE);
	//	String message = (String) data.get(LockitConstants.RETURN_MESSAGE);
	// just print the code and message…should log this
	//	System.out.println(code + " " + message);
		return strResult;
		}*/
	public String uspCheckLogin(String username, String password) throws SQLException {
			Connection	con = null;
			CallableStatement cs = null;	
			ResultSet rs = null;
			String strResult = "";
			try {
				con = DataSourceUtils.getConnection(dataSource);
				cs = con.prepareCall("{call usp_Check_Login('" + username + "','" + password + "')}");
				cs.execute(); 	  	
		 	  	rs = cs.getResultSet();
		 	  	while (rs.next()) {
	            	 strResult = rs.getString(1);
	                 strResult = strResult.substring(strResult.indexOf(',')+1,strResult.length());
		 	  	}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				rs.close();
				cs.close();
				con.close();
			}
			return strResult;
	}
	
	@Override
	public String usp_GoogleRegistration(String email_address, String password,
			String displayname, String firstName, String lastName) {
		Connection	con = DataSourceUtils.getConnection(dataSource);
		CallableStatement cs = null;	
		ResultSet rs = null;
		String strResult = "";
		try {
			cs = con.prepareCall("{call usp_GoogleRegistration('" + email_address + "','" + password + "','" + displayname + "','" + firstName + "','" + lastName + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {
	        	 strResult = rs.getString(1);
	            
	 	  	}
		} catch (SQLException e) {
			
			System.out.println("error in google login daoimpl...."+e.toString());
		}
		return strResult;
	}
	
}

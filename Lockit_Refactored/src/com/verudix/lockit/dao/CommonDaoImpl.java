package com.verudix.lockit.dao;

import java.sql.CallableStatement;
import org.apache.log4j.Logger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceUtils;

public class CommonDaoImpl implements CommonDao{
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate = null;
	Logger logger = Logger.getLogger(CommonDaoImpl.class);
	public void setDataSource(DataSource dataSource) {
		if(dataSource!=null){
		this.dataSource = (DataSource) dataSource;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		}
	}
	
	public String uspInsertRegistration(String email,String password,String con_password,String displayname) throws SQLException {
		 Connection	con = null;
		 CallableStatement cs = null;	
		 ResultSet rs = null;
		logger.debug("values inside uspInsertRegistration are ---"+email+" "+password+" "+displayname +con_password);
		String strResult = "";
		try{ 
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
	
	public String usp_Update_Password(String logged_user_mail, String userOldpassword, String userNewpassword) throws SQLException  {
		 Connection	con = null;
		 CallableStatement cs = null;	
		 ResultSet rs = null;
		String strResult = "";
			try {
				con = DataSourceUtils.getConnection(dataSource);
				cs = con.prepareCall("{call usp_Update_Password('"+logged_user_mail+"','"+userOldpassword+"','"+userNewpassword+"')}");
				cs.execute(); 	  	
				rs = cs.getResultSet();
				while (rs.next()) {
            	 strResult = rs.getString(1);
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}finally{
				rs.close();
				cs.close();
				con.close();
			}
		return strResult;
	}
	
	//@Override
		public String usp_pwd(String email) throws SQLException {
			 Connection	con = null;
			 CallableStatement cs = null;	
			 ResultSet rs = null;		
			 String strResult = "";
			try {
				con = DataSourceUtils.getConnection(dataSource);	 
				cs = con.prepareCall("{call usp_Select_ForgotPassword('" + email + "')}");
				cs.execute(); 	  	
		 	  	rs = cs.getResultSet();
		 	  	while (rs.next()) {
	            	 strResult = rs.getString(1);
	                 
		 	  	}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("error in executing cs...."+e.toString());
			}finally{
				rs.close();
				cs.close();
				con.close();
			}
			return strResult;
			
			
		}
		
		public String usp_get_password(String email) throws SQLException{
			 Connection	con = null;
			 CallableStatement cs = null;	
			 ResultSet rs = null;
						
		
			String strResult = "";
			try {
				con = DataSourceUtils.getConnection(dataSource);					 
				cs = con.prepareCall("{call usp_get_password('" + email + "')}");
				cs.execute(); 	  	
		 	  	rs = cs.getResultSet();
		 	  	while (rs.next()) {
	            	 strResult = rs.getString(1);
	                 
		 	  	}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("error in executing cs...."+e.toString());
			}finally{
				rs.close();
				cs.close();
				con.close();
			}
			return strResult;		
		}
		//@Override
		public String uspforgotpwd(HttpServletRequest request, String email,
				String fpkey) throws SQLException{
			 Connection	con = null;
			 CallableStatement cs = null;	
			 ResultSet rs = null;
			String strResult1 = "";
		
			try {
				con = DataSourceUtils.getConnection(dataSource);				
				cs = con.prepareCall("{call usp_Forgot_PasswordKey('" + email + "','" + fpkey + "')}");
				logger.debug(cs);
				cs.execute(); 	  	
		 	  	rs = cs.getResultSet();
		 	  	while (rs.next()) {
	            	 strResult1 = rs.getString(1);
	                 System.out.println("The result is : "+strResult1);
		 	  	}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("error in executing cs...."+e.toString());
			}finally{
				rs.close();
				cs.close();
				con.close();
			}
			return strResult1;
		}

		//@Override
		public String uspresetpwd(String email,  String password) throws SQLException{
			 Connection	con = null;
			 CallableStatement cs = null;	
			 ResultSet rs = null;
			String strResult2 = "";
		
			try {
				con = DataSourceUtils.getConnection(dataSource);
			
				cs = con.prepareCall("{call usp_Update_ResetPassword('" + email + "','" + password + "')}");
				cs.execute(); 	  	
		 	  	rs = cs.getResultSet();
		 	  	while (rs.next()) {
	            	 strResult2 = rs.getString(1);
	                 System.out.println("value for reset pwd" +strResult2);
		 	  	}
			} catch (SQLException e) {
				
				System.out.println("error in executing cs...."+e.toString());
			}finally{
				rs.close();
				cs.close();
				con.close();
			}			
			return strResult2;
		}

		@Override
		public String uspcheckPwdKey(String email, String fpkey) throws SQLException{
			String strResult3 = "";
			 Connection	con = null;
			 CallableStatement cs = null;	
			 ResultSet rs = null;
			
			try {
				con = DataSourceUtils.getConnection(dataSource);
				cs = con.prepareCall("{call usp_Check_PasswordKey('" + email + "','" + fpkey + "')}");;
				cs.execute(); 	  	
		 	  	rs = cs.getResultSet();
		 	  	while (rs.next()) {
	            	 strResult3 = rs.getString(1);
	                 System.out.println("strResult3 in dao"+strResult3);
		 	  	}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("error in executing cs...."+e.toString());
			}finally{
				rs.close();
				cs.close();
				con.close();
			}
			return strResult3;
		}
		public String usp_Select_UserPrfoile(String email) throws SQLException{
			String strResult1 = "";
			 Connection	con = null;
			 CallableStatement cs = null;	
			 ResultSet rs = null;
			
			try {
				con = DataSourceUtils.getConnection(dataSource);
				cs = con.prepareCall("{call usp_Select_UserPrfoile('" + email + "')}");;
				cs.execute(); 	  	
		 	  	rs = cs.getResultSet();
		 	  	while (rs.next()) {
	            	 strResult1 = rs.getString("DisplayName");
	                 System.out.println("strResult3 in dao"+strResult1);
		 	  	}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("error in executing cs...."+e.toString());
			}
			return strResult1;
		}
}

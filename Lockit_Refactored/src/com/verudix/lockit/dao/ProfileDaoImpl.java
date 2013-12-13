package com.verudix.lockit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.apache.log4j.Logger;
public class ProfileDaoImpl /*extends JdbcDaoSupport*/ implements ProfileDao {
	 ArrayList<HashMap<String,Object>> profileList	= new ArrayList<HashMap<String,Object>>();
	 Logger logger = Logger.getLogger(ProfileDaoImpl.class);
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate = null;
	private	CallableStatement cs;	
	private	ResultSet rs;	
	public ProfileDaoImpl() { }
	public void setDataSource(DataSource dataSource) {
			if(dataSource!=null){
			this.dataSource = (DataSource) dataSource;
			this.jdbcTemplate = new JdbcTemplate(dataSource);
			}
	}
	@Override
	public String usp_Update_UserPrfoile(String logged_user_mail,
			String frstname, String lstname, String mail, String organization,
			String location, String mobile, String phone, String display,
			String photourl, String modifieddate) throws SQLException {
		Connection	con = DataSourceUtils.getConnection(dataSource);
		String strResult = "";
		try {
			cs = con.prepareCall("{call usp_Update_UserPrfoile('"+logged_user_mail+"','"+frstname+"','"+lstname+"','"+display+"','"+mail+"','"+location+"','"+organization+"','"+phone+"','"+mobile+"','"+photourl.replace("\\","/")+"','"+modifieddate+"')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {
            	 strResult = rs.getString(1);
                /* strResult = strResult.substring(strResult.indexOf(',')+1,strResult.length());*/
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
	public ArrayList<HashMap<String, Object>> usp_Select_UserPrfoile(
			String logged_user_mail) throws SQLException  {
		Connection	con = DataSourceUtils.getConnection(dataSource);
		 HashMap<String, Object> item = new  HashMap<String, Object>();
		try {
			cs = con.prepareCall("{call usp_Select_UserPrfoile('"+logged_user_mail+"')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {
	 	  	
	 	  	 item.put("UserID",rs.getString("UserID") != null?rs.getString("UserID"):"");
	 	  	 item.put("FirstName",rs.getString("FristName") != null?rs.getString("FristName"):"");  
	 	  	 item.put("LastName",rs.getString("LastName") != null?rs.getString("LastName"):""); 
	 	  	 item.put("DisplayName",rs.getString("DisplayName") != null?rs.getString("DisplayName"):"");
	 	  	 item.put("Organization",rs.getString("Organization") != null?rs.getString("Organization"):"");
	 	  	 item.put("Email",rs.getString("Email") != null?rs.getString("Email"):"");
	 	 	 item.put("Location",rs.getString("Location") != null?rs.getString("Location"):"");
	 	  	 item.put("Mobile",rs.getString("Mobile") != null?rs.getString("Mobile"):"");
	 	  	 item.put("OfficePhone",rs.getString("OfficePhone") != null?rs.getString("OfficePhone"):"");
	 	  	 item.put("PhotoUrl",rs.getString("PhotoUrl") != null?rs.getString("PhotoUrl"):"");
	 	  	 	 
	        profileList.add(item);
            logger.debug("The profileList is-----"+profileList);    
	 	  	}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			rs.close();
			cs.close();
			con.close();
		}
		return profileList;
	}
	

	
}

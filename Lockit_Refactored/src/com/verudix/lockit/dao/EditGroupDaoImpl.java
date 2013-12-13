package com.verudix.lockit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import org.apache.log4j.Logger;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.apache.log4j.Logger;
public class EditGroupDaoImpl implements EditGroupDao {
	Logger logger = Logger.getLogger(EditGroupDaoImpl.class);
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate = null;
	private	CallableStatement cs;	
	private	ResultSet rs;	
	private ArrayList<HashMap<String,Object>> list	= new ArrayList<HashMap<String,Object>>();
	private ArrayList<HashMap<String,Object>> list1	= new ArrayList<HashMap<String,Object>>();
	
	public EditGroupDaoImpl() { }
	
	public void setDataSource(DataSource dataSource) {
			if(dataSource!=null){
			this.dataSource = (DataSource) dataSource;
			this.jdbcTemplate = new JdbcTemplate(dataSource);
			}
	}

	@Override
	public ArrayList<HashMap<String, Object>> usp_select_all_users(
			String username) throws SQLException{

		Connection	con = DataSourceUtils.getConnection(dataSource);
		try{
			list.clear();
		}catch(Exception e){
			
		}
		try {
			
			cs = con.prepareCall("{call usp_select_all_users('" + username + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	
	 	  	while (rs.next()) {
	 	  		 HashMap<String, Object> item = new  HashMap<String, Object>();
				 item.put("userID",rs.getString("userID")); 
				 item.put("displayname",rs.getString("displayname")); 				  				 				
				 list.add(item);	
	 	  	}
	 	  	return list;
		} catch (SQLException e) {
			return null;
		}finally{
			rs.close();
			cs.close();
			con.close();
		}
	}

	@Override
	public ArrayList<HashMap<String, Object>> usp_select_users_of_Group(
			String username, String gid) throws SQLException {

		Connection	con = DataSourceUtils.getConnection(dataSource);
		try{
			list1.clear();
		}catch(Exception e){
			
		}
		try {
			
			cs = con.prepareCall("{call usp_select_users_of_Group('" + username + "','" + gid + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	   
	 	  	while (rs.next()) {
	 	  		 HashMap<String, Object> item = new  HashMap<String, Object>();
				 item.put("UserID",rs.getString("UserID")); 
				 item.put("IsActive",rs.getString("IsActive")); 
				 item.put("GroupID",rs.getString("GroupID")); 				  				 				
				 list1.add(item);	
	 	  	}	 	  
	 	  	return list1;
		} catch (SQLException e) {
			return null;
		} finally{
			rs.close();
			cs.close();
			con.close();
		}
	}

	@Override
	public String usp_update_UserGroup(String groupid, String username,
			String selected_item, int i) throws SQLException {
		
		Connection	con = DataSourceUtils.getConnection(dataSource);
		String strResult = "";
		try {
			cs = con.prepareCall("{call usp_update_UserGroup('" + groupid + "','" + username + "','" + selected_item + "','"+i+"')}");
			logger.debug("The Statement is : "+cs);
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {	 	  						
            	 strResult = rs.getString(1);                
	 	  	}
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			rs.close();
			cs.close();
			con.close();
		}
		return strResult;
	}
}

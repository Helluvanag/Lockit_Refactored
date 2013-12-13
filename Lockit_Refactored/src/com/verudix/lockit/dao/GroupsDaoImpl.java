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
public class GroupsDaoImpl /*extends JdbcDaoSupport*/ implements GroupsDao {
	Logger logger = Logger.getLogger(GroupsDaoImpl.class);
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate = null;
	private	CallableStatement cs;	
	private	ResultSet rs;	
	private ArrayList<HashMap<String,Object>> list	= new ArrayList<HashMap<String,Object>>();
	
	
	public GroupsDaoImpl() { }
	
	public void setDataSource(DataSource dataSource) {
			if(dataSource!=null){
			this.dataSource = (DataSource) dataSource;
			this.jdbcTemplate = new JdbcTemplate(dataSource);
			}
	}
	
	
	@Override
	public ArrayList<HashMap<String, Object>> uspSelectGroups(String username) throws SQLException {

		Connection	con = DataSourceUtils.getConnection(dataSource);
		try{
			list.clear();
		}catch(Exception e){
			
		}
		try {
			
			cs = con.prepareCall("{call usp_Select_Groups('" + username + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	
	 	  	while (rs.next()) {
	 	  		HashMap<String, Object> item = new  HashMap<String, Object>();
				 item.put("groupname",rs.getString("GroupName")); 
				 item.put("groupid",rs.getString("GroupID")); 				  				 				
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
	public String uspInsertGroup(String strGroupname, String username,
			String uploaded_date) throws SQLException {
		
		Connection	con = DataSourceUtils.getConnection(dataSource);
		String strResult = "";
		try {
			cs = con.prepareCall("{call usp_Insert_Group('" + strGroupname + "','" + username + "','" + uploaded_date + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {	 	  						
            	 strResult = rs.getString(1);                
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
	public String uspdeletegroup(String username, String groupid) throws SQLException {


		Connection	con = DataSourceUtils.getConnection(dataSource);
		String strResult = "";
		try {
			cs = con.prepareCall("{call usp_delete_group('" + username + "','" + groupid + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {	 	  						
            	 strResult = rs.getString(1);                
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
	public String uspInsertUserGroups(String username, int groupid,
			String createdby, String createddate) throws SQLException {
		
		Connection	con = DataSourceUtils.getConnection(dataSource);
		String strResult = "";
		try {
			cs = con.prepareCall("{call usp_Insert_UserGroups('" + username + "','" + groupid + "','" + createdby + "','"+createddate+"')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {	 	  						
            	 strResult = rs.getString(1);                
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
	public ArrayList<HashMap<String, Object>> usp_select_all_users(
			String username) throws SQLException {

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
	
}

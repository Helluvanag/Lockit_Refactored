package com.verudix.lockit.dao;

import java.sql.CallableStatement;
import org.apache.log4j.Logger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.datasource.DataSourceUtils;

import com.verudix.lockit.procedure.CheckLoginSP;
//import com.verudix.lockit.procedure.InsertUserContactSP;
import com.verudix.lockit.util.LockitConstants;
//import com.verudix.lockit.vo.AddNewContactVO;
import com.verudix.lockit.vo.LoginVO;

public class ContactsDaoImpl /*extends JdbcDaoSupport*/ implements ContactsDao{
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate = null;
	private Connection	con = null;
	private	CallableStatement cs = null;	
	private	ResultSet rs = null;	
	Logger logger = Logger.getLogger(ContactsDaoImpl.class);
	private ArrayList<HashMap<String,Object>> list	= new ArrayList<HashMap<String,Object>>();
	private ArrayList<HashMap<String,Object>> list1	= new ArrayList<HashMap<String,Object>>();
	
	public ContactsDaoImpl() { }
	
	public void setDataSource(DataSource dataSource) {
			if(dataSource!=null){
			this.dataSource = (DataSource) dataSource;
			this.jdbcTemplate = new JdbcTemplate(dataSource);
			}
	}
	
	public String uspInsertUserContact(String emailid, String firstname, String lastname, String userid, int group, String createdby,
			String createddate) throws SQLException {
		String strResult = "";
		try {
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Insert_UserContact('" + emailid + "','" + firstname + "','" + lastname + "','" + userid + "','" + group + "','" + createdby + "','" + createddate + "')}");
			logger.debug("**"+cs);
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {
            	 strResult = rs.getString(1);
            	 logger.debug("The strResult is :"+ strResult);
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
	public ArrayList<HashMap<String, Object>> uspSelectAllUserContacts(String username) throws SQLException {
	
		try {
			//HashMap<String, Object> item = new  HashMap<String, Object>();
			list.clear();
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Select_AllUserContacts('" + username + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {
	 	  		HashMap<String, Object> item = new  HashMap<String, Object>();
				 item.put("id",rs.getString(1)); 
				 item.put("email",rs.getString(2)); 
				 item.put("name",rs.getString(3));  
				 item.put("firstname",rs.getString(4)); 
				 item.put("lastname",rs.getString(5)); 
				 			 				
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
	public List<String> uspGetAllUserContacts(String username) throws SQLException{
		List lsEmails = new ArrayList();
		try {
			
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Select_AllUserContacts('" + username + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {
	 	  		String strResult = rs.getString(2);
	 	  		lsEmails.add(strResult);
	 	  	}	  	
	 	  
		} catch (SQLException e) {
			logger.debug("Error in uspGetAllUserContacts() : "+e);
		}finally{
			rs.close();
			cs.close();
			con.close();
		}
		
		return lsEmails;	
		
	}
	@Override
	public String uspDeleteUserContact(String contactid, String username) throws SQLException {
		String strResult = "";
		try {
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Delete_UserContact('" + contactid + "','" + username + "')}");
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
	public String uspUpdateUserContact(String contactid, String email,
			String firstname, String lastname, String username, int i) throws SQLException{
		String strResult = "";
		try {
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Update_UserContact('" + contactid + "','" + email + "','" + firstname + "','" + lastname + "','" + username + "','" + i + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {
            	 strResult = rs.getString(1);
	 	  		}
			}catch (SQLException e) {
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
	public String uspDeleteUserContacts(String[] contactids, String username) throws SQLException{
		String strResult = "";
		for(int i=0;i<contactids.length;i++){
		try {
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Delete_UserContact('" + contactids[i] + "','" + username + "')}");
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
		}
		return strResult;
	}

	@Override
	public ArrayList<HashMap<String, Object>> usp_Select_Groups(String user_mail) {
		try{
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Select_Groups('" + user_mail + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	
	 	  	while (rs.next()) {
	 	  		HashMap<String, Object> item = new  HashMap<String, Object>();
				 item.put("GroupName",rs.getString("GroupName")); 
				 item.put("GroupID",rs.getString("GroupID"));
								  				 				
				list1.add(item);	
	 	  	}
	 	  	return list1;
		}
		catch(Exception e)
		{

			return null;
		
		}finally{
			try {
				rs.close();
				cs.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	}
	
	
	
	/*private InsertUserContactSP insertUserContactSP;
	String strResult;
	
	public ContactsDaoImpl() { }
	

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String uspInsertUserContact(String emailid, String firstname,
			String lastname, String userid, int group, String createdby,
			String createddate) {
	
		try{
				 System.out.println("inside ContactsDaoImpl.....");
				
				List<AddNewContactVO> result = null;
				// Call the stored procedure
				insertUserContactSP = new InsertUserContactSP(getJdbcTemplate());
				Map data = insertUserContactSP.InsertUserContact(emailid,firstname,lastname,userid,group,createdby,createddate);
			
				 System.out.println("inside ContactsDaoImpl data...."+data.size());
				 
				 System.out.println("inside ContactsDaoImpl data...."+data.get(1));
				
				
				// retrieve the list of objects
				result = (List<AddNewContactVO>) data.get(LockitConstants.RESULT_LIST);
				AddNewContactVO lvo = result.get(0);
				strResult = lvo.getContactResult();
				// retrieve the status info
			//	Integer code = (Integer) data.get(LockitConstants.RETURN_CODE);
			//	String message = (String) data.get(LockitConstants.RETURN_MESSAGE);
			// just print the code and message…should log this
			//	System.out.println(code + " " + message);
				return strResult;
		}
		catch(Exception e){
			System.out.println("error inside ContactsDaoImpl....."+e.toString());
			return strResult;
		}
	}*/
}

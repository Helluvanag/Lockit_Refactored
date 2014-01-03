package com.verudix.lockit.dao;

import java.io.File;
import org.apache.log4j.Logger;
import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.apache.commons.dbcp.BasicDataSource;


import com.verudix.lockit.procedure.CheckLoginSP;
import com.verudix.lockit.procedure.SelectFilesSP;
import com.verudix.lockit.procedure.SelectUserProfileSP;
import com.verudix.lockit.util.LockitConstants;
import com.verudix.lockit.vo.LoginVO;
import com.verudix.lockit.vo.RegistrationVO;

public class DashboardDaoImpl/* extends JdbcDaoSupport*/ implements DashboardDao {
//	private SelectUserProfileSP selectUserProfileSP;
//	private SelectFilesSP selectFilesSP;
	private DataSource dataSource;
	private Logger logger = Logger.getLogger(DashboardDaoImpl.class);
//	private JdbcTemplate jdbcTemplate = null;// = (BasicDataSource) getDataSource();
	ArrayList<HashMap<String,Object>> list	= new ArrayList<HashMap<String,Object>>();
	ArrayList<HashMap<String,Object>> list1	= new ArrayList<HashMap<String,Object>>();
	public void setDataSource(DataSource dataSource) {
		if(dataSource!=null){
		this.dataSource = (DataSource) dataSource;
//		this.jdbcTemplate = new JdbcTemplate(dataSource);
		}
	}
	CallableStatement 	cs		=	null;
	ResultSet 			rs		=	null;
	Connection	con = null;
	
//	@SuppressWarnings({ "unchecked", "rawtypes" })
	/*public String uspSelectUserProfile(String email){
		List<RegistrationVO> result = null;
		// Call the stored procedure
		selectUserProfileSP = new SelectUserProfileSP(jdbcTemplate);
		Map data = selectUserProfileSP.uspSelectUserPrfoile(email);
		// retrieve the list of objects
		result = (List<RegistrationVO>) data.get(LockitConstants.RESULT_LIST);
		RegistrationVO rvo = result.get(0);
		String strResult = rvo.getPhotoUrl();
		logger.debug("The strResult from DashboardDaoImpl is----"+strResult);
		// retrieve the status info
	//	Integer code = (Integer) data.get(LockitConstants.RETURN_CODE);
	//	String message = (String) data.get(LockitConstants.RETURN_MESSAGE);
	// just print the code and message…should log this
	//	logger.debug(code + " " + message);
		return strResult;
		}*/
	public String uspSelectUserProfile(String email) throws SQLException{
		String strResult ="";
		
		try {
			list.clear();
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Select_UserPrfoile('" + email+ "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	   	while (rs.next()) {
	 	  		strResult = rs.getString("PhotoUrl");				
			}	 	  	
		} catch (SQLException e) {
			e.getMessage();			
		}finally{
			rs.close();
			cs.close();
			con.close();
		}	
		return strResult;
	}
	public List uspSelectFiles(String email,String rootpath) throws SQLException{
		
		try {
			list.clear();
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_select_files  ('" + email + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();	 	
	 	  	
	 	  	while (rs.next()) {
				 String User_ID = rs.getString("UserID");
				 String File_Name = rs.getString("FileName");
				 String File_Path = rs.getString("FilePath");
				 File_Path = File_Path.replace("\\", "/");
				 String isfolder = rs.getString("IsFolder");
				 String File_Id = rs.getString("FileID");
				 String image_path = rs.getString("fileImage");
				 String IsSecure = rs.getString("IsSecure");				 
				 String Owner = rs.getString("Owner");
				 String IsExpiry = rs.getString("IsExpiry");
				 String OwnerId = rs.getString("OwnerID");
				 String Download = rs.getString("Download");
				 String sharing = rs.getString("sharing");
				 image_path = image_path.substring(2,image_path.length());
			     rootpath = rootpath.replace("\\", "/");	
			     HashMap<String, Object> item = new  HashMap<String, Object>();
				 item.put("UserID",User_ID);  
				 item.put("FileName",File_Name);  
				 item.put("FilePath",File_Path);  
				 item.put("IsFolder",isfolder);  
				 item.put("FileID",File_Id); 
				 item.put("fileImage",image_path); 
				 item.put("IsSecure",IsSecure); 				 
				 item.put("Owner", Owner);
				 item.put("IsExpiry", IsExpiry);
				 item.put("OwnerID", OwnerId);
				 item.put("Download", Download);
				 item.put("sharing", sharing);
				 list.add(item);	 
			}
	 	  
	 	  	return list;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}finally{
			rs.close();
			cs.close();
			con.close();
		}
	}
	
	public List uspSelectFilesByOwn(String email, String rootpath) throws SQLException{
		
		try {
			list.clear();
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_select_filesbyown  ('" + email + "')}");
			cs.execute();  
	  		rs = cs.getResultSet();
	  		
	  		while (rs.next()) {				
				 String User_ID = rs.getString("UserID");
				 String File_Name = rs.getString("FileName");
				 String File_Path = rs.getString("FilePath");
			 	 File_Path = File_Path.replace("\\", "/");
				 String isfolder = rs.getString("IsFolder");
				 String File_Id = rs.getString("FileID");
				 String image_path = rs.getString("fileImage");
				 String IsSecure = rs.getString("IsSecure");
				 String Owner = rs.getString("Owner");
				 String IsExpiry = rs.getString("IsExpiry");
				 String OwnerId = rs.getString("OwnerID");
				 String Download = rs.getString("Download");
				 String sharing = rs.getString("sharing");
				 image_path = image_path.substring(2,image_path.length());
			     rootpath = rootpath.replace("\\", "/");
			     HashMap<String, Object> item = new  HashMap<String, Object>();
				if(File_Path.equals(rootpath)){
						 item.put("UserID",User_ID);  
						 item.put("FileName",File_Name);  
						 item.put("FilePath",File_Path);  
						 item.put("IsFolder",isfolder);  
						 item.put("FileID",File_Id); 
						 item.put("fileImage",image_path); 
						 item.put("IsSecure",IsSecure); 
						 item.put("Owner", Owner);
						 item.put("IsExpiry", IsExpiry);
						 item.put("OwnerID", OwnerId);
						 item.put("Download", Download);
						 item.put("sharing", sharing);
						 list.add(item);
				}
			}
	  		
	  		return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally{
			rs.close();
			cs.close();
			con.close();
		}	
	}
	
	public ArrayList<HashMap<String, Object>> uspSelectFilesByShare(String email, String rootpath) throws SQLException{
		
		try{
			list.clear();
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_select_filesbyshare  ('" + email + "')}");
			cs.execute();  
			rs = cs.getResultSet();
			
		   	while (rs.next()) {
			 String User_ID = rs.getString("UserID");
			 String File_Name = rs.getString("FileName");
			 String File_Path = rs.getString("FilePath");
			 File_Path = File_Path.replace("\\", "/");
			 String isfolder = rs.getString("IsFolder");
			 String File_Id = rs.getString("FileID");
			 String image_path = rs.getString("fileImage");
			 String IsSecure = rs.getString("IsSecure");
			 String Owner = rs.getString("Owner");	
			 String IsExpiry = rs.getString("IsExpiry");
			 String OwnerId = rs.getString("OwnerID");
			 String Download = rs.getString("Download");
			 String sharing = rs.getString("sharing");
			 image_path = image_path.substring(2,image_path.length());
		  	 rootpath = rootpath.replace("\\", "/");
		  	 HashMap<String, Object> item = new  HashMap<String, Object>();
				 item.put("UserID",User_ID);  
				 item.put("FileName",File_Name);  
				 item.put("FilePath",File_Path);  
				 item.put("IsFolder",isfolder);  
				 item.put("FileID",File_Id); 
				 item.put("fileImage",image_path); 
				 item.put("IsSecure",IsSecure); 
				 item.put("Owner", Owner);
				 item.put("IsExpiry", IsExpiry);
				 item.put("OwnerID", OwnerId);
				 item.put("Download", Download);
				 item.put("sharing", sharing);
				 list.add(item);
		}
		
	  	return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			rs.close();
			cs.close();
			con.close();
		}
	}
	
	public ArrayList<HashMap<String, Object>> uspSelectFilesByFolder(String email, String rootpath) throws SQLException{
		
		try{
			list.clear();
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Select_FilesByFolder  ('" + email + "','"+rootpath+"')}");
			cs.execute();  
		  	rs = cs.getResultSet();
		  	
		   	while (rs.next()) {
				 String User_ID = rs.getString("UserID");
				 String File_Name = rs.getString("FileName");
				 String File_Path = rs.getString("FilePath");
				 File_Path = File_Path.replace("\\", "/");
				 String isfolder = rs.getString("IsFolder");
				 String IsSecure = rs.getString("IsSecure");
				 String File_Id = rs.getString("FileID");
				 String image_path = rs.getString("fileImage");
				 String Owner = rs.getString("Owner");
				 String IsExpiry = rs.getString("IsExpiry");
				 String Download = rs.getString("Download");
				 String sharing = rs.getString("sharing");
				 String OwnerId = rs.getString("OwnerID");
			 	 image_path = image_path.substring(2,image_path.length());
			  	 rootpath = rootpath.replace("\\", "/");
			  	HashMap<String, Object> item = new  HashMap<String, Object>();
				if(File_Path.equals(rootpath)){
					 item.put("UserID",User_ID);  
					 item.put("FileName",File_Name);  
					 item.put("FilePath",File_Path);  
					 item.put("IsFolder",isfolder);  
					 item.put("FileID",File_Id); 
					 item.put("fileImage",image_path); 
					 item.put("IsSecure",IsSecure);
					 item.put("Owner",Owner);
					 item.put("IsExpiry",IsExpiry);
					 item.put("Download", Download);
					 item.put("sharing", sharing);
					 item.put("OwnerID", OwnerId);
					 list.add(item);
				}
			}
		
		  	return list;
			}catch(Exception e){
				e.printStackTrace();
				return null;
			}finally{
				rs.close();
				cs.close();
				con.close();
			}
	}
	
	public void uspDeleteFile(String email,String id,String name,String path,String folder) throws SQLException{
		String str = null;
	
		try{
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Delete_File('" + email + "','" + id + "')}");
			cs.execute();	
			rs = cs.getResultSet();
			while(rs.next()){
				int i = Integer.parseInt(rs.getString(1));
	
				if(i>0){
		
					File f = new File(path+name);
					f.delete();
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			cs.close();
			con.close();
		}
		
	}
	
	public void uspDeleteFolder(String email, String id, String path, String name) throws SQLException{
	
		try{
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Delete_Folder('" + email + "','" + id + "')}");
			cs.execute();  
			rs = cs.getResultSet();
			while(rs.next()){
				int i = Integer.parseInt(rs.getString(1));
				
				if(i>0){
					 			
					File file = new File(path+name);        
			        String[] myFiles;      
			            if(file.isDirectory()){  
			                myFiles = file.list();  
			                for (int j=0; j<myFiles.length; j++) {  
			                    File myFile = new File(file, myFiles[j]);   
			                    myFile.delete(); 
			                }  
			             }  
			           file.delete();  
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			cs.close();
			con.close();
		}
	}
	@Override
	public String usp_Insert_ShareFile(String logged_user_mail, String strEmailID,
			String fileid,String sharedTime, String expiredTime, String createdDate, 
			String download, String share, String print, String isfolder) {
		
		
		final Calendar cal = Calendar.getInstance();
		DateFormat newFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss ");
		String modifyDate=newFormat.format(cal.getTime());
		
		String strResult = "";
		try {
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Insert_ShareFile('" + strEmailID + "','" + fileid + "','" + print + "','" + download + "','" + share + "','" + 1 + "','" + 1 + "','" + 1 + "','" + isfolder + "','" + sharedTime + "','" + expiredTime + "','" + 0 + "','" + logged_user_mail + "','" + createdDate + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {
            	 strResult = rs.getString(1);
                /* strResult = strResult.substring(strResult.indexOf(',')+1,strResult.length());*/
	 	  	}
		} catch (SQLException e) {			
			logger.debug("Cant Save SharedFile:"+e.toString());
		}finally{
			try {
				rs.close();
				cs.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
		return strResult;
	}


	@Override
	public String usp_Select_SharedFileOwner(String fileid) {
		String strResult = "";
		try {
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Select_SharedFileOwner('" + fileid + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {
            	 strResult = rs.getString(1);              
	 	  	}
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				cs.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
		return strResult;
	}


	@Override
	public String usp_Select_SharedUsersandProperties(String userid,
			String fileid) {
		String strResult = "";
		try {
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Select_SharedUsersandProperties('" + userid + "','" + fileid + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {
            	 strResult = rs.getString(1);
             }
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				cs.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
		return strResult;
	}


	@Override
	public ArrayList<HashMap<String, Object>> usp_Select_SharedUsersandProperty(
			String userid, String fileid) {
		
		
		try{
			list1.clear();
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Select_SharedUsersandProperties('" + userid + "','" + fileid + "')}");
			cs.execute();  
		  	rs = cs.getResultSet();	
		  	
		  	while (rs.next()) {
				 String User_ID = rs.getString("UserID");
				 String FileID = rs.getString("FileID");
				 String Save = rs.getString("Download");
				 String Share = rs.getString("Sharing");
				 String Print = rs.getString("Print");
				 String ExpiredDate = rs.getString("ExpiredDatetime");
				 HashMap<String, Object> item = new  HashMap<String, Object>();
					 item.put("UserID",User_ID);  
					 item.put("FileID",FileID); 
					 item.put("Download",Save);  
					 item.put("Sharing",Share);  
					 item.put("Print",Print);  
					item.put("ExpiredDatetime",ExpiredDate);  					
					 list1.add(item);					 				
			}	
		  
		  	return list1;
			}catch(Exception e){
				e.printStackTrace();
				return null;
			}finally{
				try {
					rs.close();
					cs.close();
					con.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			
			}
		
	}


	@Override
	public String usp_Insert_ShareFolder(String logged_user_mail,
			String strEmailID, String fileid, String sharedTime,
			String expiredTime, String createdDate, String download,
			String share, String print, String isfolder) throws SQLException {
		
		 if(download.equals("")) {    download="0";  }
		 if(share.equals("")) { share="0";   } 
		 if(print.equals("")) { print="0";}
		 
		 logger.debug("download"+download);
		String strResult = "";
		try {
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Insert_ShareFolder('" + strEmailID + "','" + fileid + "','" + print + "','" + download + "','" + share + "','" + 1 + "','" + 1 + "','" + 1 + "','" + isfolder + "','" + sharedTime + "','" + expiredTime + "','" + 0 + "','" + logged_user_mail + "','" + createdDate + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {
           	 strResult = rs.getString(1);
               /* strResult = strResult.substring(strResult.indexOf(',')+1,strResult.length());*/
	 	  	}
		} catch (SQLException e) {			
			logger.error("Cant Save SharedFile:"+e.toString());
		}finally{
			try {
				rs.close();
				cs.close();
				con.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		
		}
		return strResult;
	}


	@Override
	public String usp_update_SharedFileProperties(String strEmailID,
			String fileID, String logged_user_mail, String download_upd,
			String sharing_upd, String print_upd, String formattedDate) {
		
		String strResult = "";
		try {
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_update_SharedFileProperties('" + strEmailID + "','" + fileID + "','" + logged_user_mail + "','" + download_upd + "','" + sharing_upd + "','" + print_upd + "','" + formattedDate + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	while (rs.next()) {
          	 strResult = rs.getString(1);
              /* strResult = strResult.substring(strResult.indexOf(',')+1,strResult.length());*/
	 	  	}
		} catch (SQLException e) {			
			logger.debug("Cant Save SharedFile:"+e.toString());
		}finally{
			try {
				rs.close();
				cs.close();
				con.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		
		}
		return strResult;
	}
	
	public List getExpiredDateTime(String user_mail,String fileID){
		//String strResult = null;		
		ArrayList<HashMap<String,Object>> listPrintExpiry	= new ArrayList<HashMap<String,Object>>();
		try{
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_select_fileExpiry('" + user_mail + "','" + fileID + "')}");
			cs.execute(); 	
			rs = cs.getResultSet();
	 	  	while (rs.next()) {
	 	  	  HashMap<String, Object> item = new  HashMap<String, Object>();
	 	  	  item.put("ExpiredDateTime",rs.getString("ExpiredDateTime"));
          	  item.put("Print",rs.getString("Print"));
          	  listPrintExpiry.add(item);
	 	  	}
	 	  	
		}catch(Exception e){
			logger.error("Insdie getExpiredDateTime():   "+e);
		}finally{
			try {
				rs.close();
				cs.close();
				con.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		
		}
		return listPrintExpiry;
	}
	@Override
	public ArrayList usp_select_all_users(
			String user_mail) {

		Connection	con = DataSourceUtils.getConnection(dataSource);
		List usersList=new ArrayList();
		
		
		try{
			usersList.clear();
		}catch(Exception e){
			
		}
		try {
			
			cs = con.prepareCall("{call usp_select_all_users('" + user_mail + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	
	 	  	while (rs.next()) {	 	  		 				  				 				
				 usersList.add(rs.getString(1));
				
	 	  	}
	 	  	
	 	  	return (ArrayList) usersList;
		} catch (SQLException e) {
			return null;
		}finally{
			try {
				rs.close();
				cs.close();
				con.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		
	}
	
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
	@Override
	public List usp_Select_Groups(String user_mail) {

		Connection	con = DataSourceUtils.getConnection(dataSource);
		List usersListGroup=new ArrayList();
		
		
		try{
			usersListGroup.clear();
		}catch(Exception e){
			
		}
		try {
			
			cs = con.prepareCall("{call usp_Select_Groups('" + user_mail + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	
	 	  	while (rs.next()) {	 	  		 				  				 				
	 	  		usersListGroup.add(rs.getString(3));
				System.out.println("userList-Group:"+rs.getString(3));
	 	  	}
	 	  	
	 	  	return (ArrayList) usersListGroup;
		} catch (SQLException e) {
			return null;
		}finally{
			try {
				rs.close();
				cs.close();
				con.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		
	}
	
	}
	@Override
	public List usp_select_UsersOfGroupByName(String user_mail, String groupName) {

		Connection	con = DataSourceUtils.getConnection(dataSource);
		List usersListGroup=new ArrayList();
		
		
		try{
			usersListGroup.clear();
		}catch(Exception e){
			
		}
		try {
			
			cs = con.prepareCall("{call usp_select_UsersOfGroupByName('" + user_mail + "','" + groupName + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	
	 	  	while (rs.next()) {	 	  		 				  				 				
	 	  		usersListGroup.add(rs.getString(1));
				System.out.println("userContact's dao impl-Group:"+rs.getString(1));
	 	  	}
	 	  	
	 	  	return (ArrayList) usersListGroup;
		} catch (SQLException e) {
			return null;
		}finally{
			try {
				rs.close();
				cs.close();
				con.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		
	}
	
	}
	
	@Override
	public String usp_update_fileviewedproperty(String file_id, String user_mail) {
		
		try {
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_update_fileviewedproperty('" + user_mail + "','" + file_id + "')}");
			cs.execute(); 	  	
	 	  	rs = cs.getResultSet();
	 	  	
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				cs.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
		return file_id;		
	}
	
}

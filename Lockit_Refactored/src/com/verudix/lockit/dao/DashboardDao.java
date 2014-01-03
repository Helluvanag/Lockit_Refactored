package com.verudix.lockit.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface DashboardDao {
	public String uspSelectUserProfile(String email) throws SQLException;
	public List uspSelectFiles(String email,String rootpath) throws SQLException;
	
	public List uspSelectFilesByOwn(String email, String rootpath) throws SQLException;
	public ArrayList<HashMap<String, Object>> uspSelectFilesByShare(String email, String rootpath) throws SQLException;
	public ArrayList<HashMap<String, Object>> uspSelectFilesByFolder(String email, String rootpath) throws SQLException;
	public void uspDeleteFile(String email, String id, String name, String path, String folder) throws SQLException;
	public void uspDeleteFolder(String email, String id, String path, String name) throws SQLException;
	public String usp_Insert_ShareFile(String logged_user_mail, String strEmailID,
			String fileid, String expiredTime, String createdDate, String sharedTime,
			String download, String share, String print, String isfolder);
	public String usp_Select_SharedFileOwner(String fileid);
	public String usp_Select_SharedUsersandProperties(String userid,
			String fileid);
	public ArrayList<HashMap<String, Object>> usp_Select_SharedUsersandProperty(
			String userid, String fileid);
	public String usp_Insert_ShareFolder(String logged_user_mail,
			String strEmailID, String fileid, String sharedTime,
			String expiredTime, String createdDate, String download,
			String share, String print, String isfolder) throws SQLException;
	public String usp_update_SharedFileProperties(String strEmailID,
			String fileID, String logged_user_mail, String download_upd,
			String sharing_upd, String print_upd, String formattedDate);
	public List getExpiredDateTime(String user_mail,String fileID);
	public ArrayList<HashMap<String, Object>> usp_select_all_users(
			String user_mail);
	public String usp_Select_UserPrfoile(String email) throws SQLException;
	public List usp_Select_Groups(String user_mail);
	public List usp_select_UsersOfGroupByName(String user_mail, String groupName);
	public String usp_update_fileviewedproperty(String file_id, String user_mail);
}

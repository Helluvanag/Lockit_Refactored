package com.verudix.lockit.service;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface DashboardService {
	public boolean zipFiles(String srcFolder, String destZipFile);
	public void zipFolder(String srcFolder, String destZipFile) throws Exception;
	public void addFileToZip(String path, String srcFile, ZipOutputStream zip, boolean flag) throws Exception;
	public void addFolderToZip(String path, String srcFolder, ZipOutputStream zip) throws Exception;
	public void convert2pdf(String src, String des);
	
	public String GetPhotoUrl(String email, String rootpath); 
	public ArrayList<HashMap<String, Object>> GetFiles(String email, String rootpath);
	
	public ArrayList<HashMap<String, Object>> GetFilesByOwn(String email, String rootpath); 
	public ArrayList<HashMap<String, Object>> GetFilesByShare(String email, String rootpath); 
	public ArrayList<HashMap<String, Object>> GetFilesByFolder(String email, String rootpath); 
	public void DeleteFile(String email,String id,String name,String path,String folder);
	public void DeleteFolder(String email,String id,String path,String name);
	public String openFile(HttpServletRequest request,	HttpServletResponse response, String is_folder, String file_name,
			String file_id, String file_path, String is_secure,
			String functionality);
	public boolean deleteFile(HttpServletRequest request,	HttpServletResponse response, String is_folder, String file_name,
			String file_id, String file_path, String is_secure,
			String functionality);
	public void downloadFile(HttpServletRequest request,	HttpServletResponse response, String is_folder, String file_name,
			String file_id, String file_path, String is_secure,
			String functionality);
	/*public boolean shareFile(HttpServletRequest request, String logged_user_mail, String strEmailID,
			String fileid, int days, int hours, int minutes,
			String download, String share, String print, String isfolder);*/
	public boolean shareFile(HttpServletRequest request,HttpServletResponse response, String logged_user_mail, String strEmailID,
			String fileid, int days, int hours, int minutes,
			String download, String share, String print, String isfolder,String filename1);
	public String fileOwnerID(String fileid);
	public String sharedFilePropertiesUpdate(String userid, String fileid);
	public ArrayList<HashMap<String, Object>> fileOptions(String email, String rootpath);
	/*public boolean shareFileFolder(HttpServletRequest request,
			String logged_user_mail, String strEmailID, String fileid,
			int days, int hours, int minutes, String download, String share,
			String print, String isfolder);*/
	public boolean shareFileFolder(HttpServletRequest request,
			String logged_user_mail, String strEmailID, String fileid,
			int days, int hours, int minutes, String download, String share,
			String print, String isfolder,String filename1);
	public boolean shareFilePropUpdate(HttpServletRequest request, String logged_user_mail, String strEmailID, String fileID,
			String formattedDate, String download_upd, String sharing_upd,
			String print_upd);
	public List getExpiredDateTime(String user_mail,String fileID);
	public ArrayList getAllUserContacts(String user_mail);	
	public ArrayList usp_Select_Groups(String user_mail);
	public List groupUsers(HttpServletRequest request, String user_mail,String groupName);
	public String usp_update_fileviewedproperty(HttpServletRequest request,
			HttpServletResponse response, String file_id, String user_mail);
}

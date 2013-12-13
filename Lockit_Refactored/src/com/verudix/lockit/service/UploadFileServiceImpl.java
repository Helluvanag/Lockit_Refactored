package com.verudix.lockit.service;

import java.util.List;
import java.io.File;
import java.io.IOException;
import java.sql.CallableStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.verudix.lockit.util.FileEncryptor;
import com.verudix.lockit.dao.UploadFileDao;
import com.verudix.lockit.util.LockitConstants;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.servlet.ModelAndView;
import org.apache.log4j.Logger;


public class UploadFileServiceImpl implements UploadFileService{
	private UploadFileDao uploadFileDao;
	Logger logger = Logger.getLogger(UploadFileServiceImpl.class);
	public void setUploadFileDao(UploadFileDao uploadFileDao) {
		this.uploadFileDao = uploadFileDao;
	}
	File dir; 
	HttpSession session;
	String user_email,file_name,email_path,convertedPdf_path,convertedSwf_path,myfiles_path,sharedFiles_path,filetype,uploaded_date,SharedTime,ExpiredTime="1969-01-01 00:00:00",IsSecure;
	public String uspInsertAddFile(HttpServletRequest request, HttpServletResponse response){
			String rootpath = request.getServletContext().getRealPath("/")+"Userfiles";	
			dir = new File(rootpath);			
			session = request.getSession(false);
			user_email = (String)session.getAttribute("user_mail");
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			uploaded_date = dateFormat.format(cal.getTime());  
			Calendar share = Calendar.getInstance();
			cal.set(Calendar.YEAR, 1969);
			cal.set(Calendar.MONTH, 01);
			cal.set(Calendar.DAY_OF_MONTH, 01);  
			SharedTime = dateFormat.format(share.getTime());  
			IsSecure = "0";
			String name = "";
			String strF1path ="",strFileId ="",strFolderName ="",strIsExpiry ="",strCntInc ="";
			int intResult =  0;
			String strResult="";
					
		try{			
			@SuppressWarnings("unchecked")
			List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
		
			for(FileItem item : multiparts){      		 
				if(item.isFormField()){ 					    					
					name = item.getFieldName();
					String value = item.getString();  					
						if (name.equals("file_type")) {      				  
							filetype = value; 
							if(filetype.equals("secure")){
								IsSecure = "1";
							}							      				  
						} 
						if (item.getFieldName().equals("f1path")) {      				  
							strF1path = item.getString(); 
							request.setAttribute("strF1path", strF1path);
						      				  
						} 
						if (item.getFieldName().equals("f1fileid")) {      				  
							strFileId = item.getString(); 
							request.setAttribute("strFileId", strFileId);
						      				  
						} 
						if (item.getFieldName().equals("f1filename")) {      				  
							strFolderName = item.getString(); 
							request.setAttribute("strFolderName", strFolderName);
						      				  
						} 
						if (item.getFieldName().equals("f1isexpiry")) {      				  
							strIsExpiry = item.getString(); 
							request.setAttribute("strIsExpiry", strIsExpiry);
						      				  
						} 
						if (item.getFieldName().equals("f1cntinc")) {      				  
							strCntInc = item.getString(); 
							request.setAttribute("strCntInc", strCntInc);
						      				  
						} 
      			   	}
      			  else{  		 
      				file_name = new File(item.getName()).getName();   
      				String Extension = file_name.substring(file_name.lastIndexOf('.')).toLowerCase();      
      				
      				for(int i=0;i<LockitConstants.supportedFileExtensions.length;i++){ /****** checking file extension *****/      				   
      				  if(LockitConstants.supportedFileExtensions[i].equals(Extension)){ /**** extension matched *******/      				   												
      					  if(!dir.exists()){
      						   dir = new File(rootpath);/******* creating userfiles folder if not exists******/
      						   dir.mkdir(); 
      					   }      					
      					 email_path = rootpath+File.separator + user_email;      					 
      					 File f = new File(email_path);
      					 if(!f.exists()){
      						 File f1 = new File(email_path);/******* creating email_folder if not exists******/
      						 f1.mkdir();
      					 }      					  
      					myfiles_path = email_path+ File.separator+"My Files/"; 
      					logger.debug("The myfiles_path is-----"+myfiles_path);
                 		 File f2 = new File(myfiles_path);
                 		 if(!f2.exists()){
						   File f3 = new File(myfiles_path);/******* creating myfiles folder if not exists******/
						   f3.mkdir();
					   }
                 		convertedPdf_path =  email_path+ File.separator+"convertedPdfs/";
                 		File f4 = new File(convertedPdf_path);
                		 if(!f4.exists()){
						   File f5 = new File(convertedPdf_path);/******* creating convertedPdfs folder if not exists******/
						   f5.mkdir();
					   }
                		 convertedSwf_path =  email_path+ File.separator+"convertedSwfs/";
                  		File f6 = new File(convertedSwf_path);
                 		 if(!f6.exists()){
 						   File f7 = new File(convertedSwf_path);/******* creating convertedSwfs folder if not exists******/
 						   f7.mkdir();
 					   }
                 		 sharedFiles_path =  email_path+ File.separator+"Shared Files/";
                   		File f8 = new File(sharedFiles_path);
                  		 if(!f8.exists()){
  						   File f9 = new File(sharedFiles_path);/******* creating Shared Files folder if not exists******/
  						   f9.mkdir();
  					   }
                 	 if(strF1path.equals("null") || strF1path.equals("")){ /**** writing file to myfiles folder ****/
                 		 logger.debug("Inside strF1path = null********");
                 	
                 		if(IsSecure.equals("1") || IsSecure == "1"){
                 			logger.debug("file is secure....");
      						String t_path = myfiles_path+File.separator+"Temp";
      						File t1 = new File(t_path);
      						logger.debug("$$$t1$$$$"+t1.exists());
      						t1.mkdir(); 
      						logger.debug("***t1****"+t1.exists());
    						item.write( new File(t1+File.separator+file_name)); 			
    						FileEncryptor.encrypt("DES/ECB/PKCS5Padding", t1+File.separator+file_name,myfiles_path+File.separator+file_name);						
    						File temp = new File(t_path);	
    						logger.debug("***temp****"+temp.exists());
    						temp.mkdir();
    						logger.debug("@@@temp@@@@@"+temp.exists());
    				        String[] myFiles;      
    				            if(temp.isDirectory()){  
    				                myFiles = temp.list();  
    				                for (int j=0; j<myFiles.length; j++) {  
    				                    File myFile = new File(temp, myFiles[j]);   
    				                    myFile.delete();  
    				                }  
    				             }  
    				            temp.delete();  
                 		}else{
                 			 item.write( new File(myfiles_path+File.separator+file_name));
                 		}
                 		intResult =  uploadFileDao.usp_Insert_AddFile(file_name,  uploaded_date,  user_email, myfiles_path.replace("\\", "\\\\"),  user_email,  user_email, 0 , SharedTime,  ExpiredTime,  1,  1,  1,  1, 1,  1,  user_email,  uploaded_date,  IsSecure);
					
					   if(intResult>0)
						   strResult = "Success";
               		else{		
               			strResult = "Failed";
               			}
					  break;
                 	 }
                 	 else{ /**** writing file to created folders ****/                 		
                 		
                 	   		if(IsSecure.equals("1") || IsSecure == "1"){
                 			String t_path = strF1path+File.separator+"Temp";
                 			logger.debug("t_path is : "+t_path);
      						File t1 = new File(t_path);
      						logger.debug("****"+t1.exists());
      						t1.mkdir(); 
      						logger.debug("$$$$$$$"+t1.exists());
    						item.write( new File(t1+File.separator+file_name)); 			
    						FileEncryptor.encrypt("DES/ECB/PKCS5Padding", t1+File.separator+file_name,strF1path+File.separator+file_name);						
    						File temp = new File(t_path);												     
    				        String[] myFiles;      
    				            if(temp.isDirectory()){  
    				                myFiles = temp.list();  
    				                for (int j=0; j<myFiles.length; j++) {  
    				                    File myFile = new File(temp, myFiles[j]);   
    				                    myFile.delete();  
    				                }  
    				             }  
    				            temp.delete();  
    				        intResult =  uploadFileDao.usp_Insert_AddFile(file_name,  uploaded_date,  user_email, strF1path.replace("\\", "\\\\"),  user_email,  user_email, 0 , SharedTime,  ExpiredTime,  1,  1,  1,  1, 1,  1,  user_email,  uploaded_date,  IsSecure);
                 		}else{
                 			item.write( new File(strF1path+File.separator+file_name));   
                 			intResult =  uploadFileDao.usp_Insert_AddFile(file_name,  uploaded_date,  user_email, strF1path.replace("\\", "\\\\"),  user_email,  user_email, 0 , SharedTime,  ExpiredTime,  1,  1,  1,  1, 1,  1,  user_email,  uploaded_date,  IsSecure);
                 		}                 		
                 		if(intResult>0)
                 			strResult =  "Success";
                		else{		
                			strResult =  "Failed";
                			}
                 		break;
                 	 }
					}else{
						strResult =  "Format";						
					}
      			   }	 
      			  	}
				
			}  
			
			return strResult;
			
		}catch(Exception e){			
			logger.debug("error in uploading file..."+e.toString(),e);
			return strResult;
		}
		
		}
	public String createFolder(HttpServletRequest request, HttpServletResponse response){
		String strResult="";
		File dir; 
		HttpSession session;
	
		try{
			String rootpath = request.getServletContext().getRealPath("/")+"Userfiles";
			dir = new File(rootpath);	
			session = request.getSession(false);
			String user_email = (String)session.getAttribute("user_mail");
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			uploaded_date = dateFormat.format(cal.getTime());  
			Calendar share = Calendar.getInstance();
			cal.set(Calendar.YEAR, 1969);
			cal.set(Calendar.MONTH, 01);
			cal.set(Calendar.DAY_OF_MONTH, 01);  
			SharedTime = dateFormat.format(share.getTime());  				
			IsSecure = "1";
			String name = "";
			String value = "";
			String strF1path = "";
			String folderPath = "";
			String strFileId ="",strFolderName ="",strIsExpiry ="",strCntInc ="";
			@SuppressWarnings("unchecked")
			List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			
			for(FileItem item : multiparts){      		 
      		   		if(item.isFormField()){      				  
      			 	    IsSecure = "0";
      				   if(item.getFieldName().equals("foldername")){
      					   name = item.getFieldName();
      					   value = item.getString();          				
      				   		}
      				  
      		   			if (item.getFieldName().equals("f1path")) {      				  
      		   				strF1path = item.getString(); 
      		   				request.setAttribute("strF1path", strF1path);
      		   				 					
      		   			} 
      		   			if (item.getFieldName().equals("f1fileid")) {      				  
      		   				strFileId = item.getString(); 
      		   				request.setAttribute("strFileId", strFileId);
      		   				      				  
      		   			} 
      		   			if (item.getFieldName().equals("f1filename")) {      				  
      		   				strFolderName = item.getString(); 
      		   				request.setAttribute("strFolderName", strFolderName);
      		   				      				  
      		   			} 
      		   			if (item.getFieldName().equals("f1isexpiry")) {      				  
      		   				strIsExpiry = item.getString(); 
      		   				request.setAttribute("strIsExpiry", strIsExpiry);
      		   				      				  
      		   			} 
      		   			if (item.getFieldName().equals("f1cntinc")) {      				  
      		   				strCntInc = item.getString(); 
      		   				request.setAttribute("strCntInc", strCntInc);
      		   				      				  
      		   			} 
      		   			}
      		   		
			 		}
			
			if(value.equals("") || value==null || value.length()==0 || value.equals("null")){
				request.setAttribute("error_message", "Folder name cannot be empty.");
				return "";
			}
					
					  File f1;
					  
					  if(!dir.exists()){
 						   dir = new File(rootpath);/******* creating userfiles folder if not exists******/
 						   dir.mkdir(); 
 					   }      					
 					 email_path = rootpath+File.separator + user_email;      					 
 					 File f = new File(email_path);
 					 if(!f.exists()){
 						 File email_folder = new File(email_path);/******* creating email_folder if not exists******/
 						email_folder.mkdir();
 					 }      		
      				  String newpath = rootpath+File.separator+user_email+File.separator+"My Files/";
      				  File myFiles = new File(newpath);
      				  if(!myFiles.exists()){
      					  logger.debug("Inside My Files Creation*********");
      					myFiles.mkdir();/******* creating My Files folder if not exists******/
      				  }
      				  if(strF1path.equals("null") || strF1path.equals("")){
      					   folderPath = newpath + value+"\\";//+ File.separator;
      				
      				  }else{
      					  folderPath = strF1path + value+"\\";//+ File.separator;
      					
      				  }
      				  f1=new File(folderPath); 
      			
      				  int intResult =  0;
      			if(!f1.exists()){
      					   f1.mkdir();/******* creating New folder if not exists******/
      					
      					 try{
      						
      						if(strF1path.equals("null") || strF1path.equals("")){
      							
      							intResult =  uploadFileDao.usp_Insert_AddFile(value,  uploaded_date,  user_email, newpath.replace("\\", "\\\\"),  user_email,  user_email, 1 , SharedTime,  ExpiredTime,  1,  1,  1,  1, 1,  1,  user_email,  uploaded_date,  IsSecure);
      						}else{
      							
      							intResult =  uploadFileDao.usp_Insert_AddFile(value,  uploaded_date,  user_email, strF1path.replace("\\", "\\\\"),  user_email,  user_email, 1 , SharedTime,  ExpiredTime,  1,  1,  1,  1, 1,  1,  user_email,  uploaded_date,  IsSecure);
      						}
      					}catch(Exception e){}
      					 	if(intResult>0)
      					 		strResult = "Success";
      					 	else
      					 		strResult = "Failed";	
					   }else{
						  
						   strResult = "Exists"; 
					   }
      				
		}catch(Exception e){			
			logger.error("error in uploading file..."+e.toString());
		}
		return strResult;
	}
	
	}


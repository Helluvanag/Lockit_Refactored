package com.verudix.lockit.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.activation.DataHandler;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import com.verudix.lockit.util.FileEncryptor;
import com.verudix.lockit.flexpaperviewer.Config;
import com.verudix.lockit.flexpaperviewer.pdf2json;
import com.verudix.lockit.flexpaperviewer.pdf2swf;
import com.verudix.lockit.dao.DashboardDao;

import com.verudix.lockit.util.PDFConversion;
import org.apache.log4j.Logger;
import java.text.DateFormat;
public class DashboardServiceImpl implements DashboardService {
	private DashboardDao dashboardDao;
	Logger logger = Logger.getLogger(DashboardServiceImpl.class);
	//OutputStream out;
	File file = null;
	String photourl = "";
	String expiredTime = "";
	List usersList=new ArrayList();
	static ArrayList<HashMap<String,Object>> list	= new ArrayList<HashMap<String,Object>>();
	static ArrayList<HashMap<String,Object>> list1	= new ArrayList<HashMap<String,Object>>();
	public void setDashboardDao(DashboardDao dashboardDao) {
		this.dashboardDao = dashboardDao;
	}	
	
	public boolean zipFiles(String srcFolder, String destZipFile) {
        boolean result = false;
        try {
            logger.debug("Program Start zipping the given files");
            /*
             * send to the zip procedure
             */
            zipFolder(srcFolder, destZipFile);
            result = true;
            logger.debug("Given files are successfully zipped");
        } catch (Exception e) {
            logger.debug("Some Errors happned during the zip process");
        } finally {
            return result;
        }
    }

    /*
     * zip the folders
     */
    public void zipFolder(String srcFolder, String destZipFile) throws Exception {
        ZipOutputStream zip = null;
        FileOutputStream fileWriter = null;
        /*
         * create the output stream to zip file result
         */
        fileWriter = new FileOutputStream(destZipFile);
        zip = new ZipOutputStream(fileWriter);
        /*
         * add the folder to the zip
         */
        addFolderToZip("", srcFolder, zip);
        /*
         * close the zip objects
         */
        zip.flush();
        zip.close();
    }

    /*
     * recursively add files to the zip files
     */
    public void addFileToZip(String path, String srcFile, ZipOutputStream zip, boolean flag) throws Exception {
        /*
         * create the file object for inputs
         */
        File folder = new File(srcFile);

        /*
         * if the folder is empty add empty folder to the Zip file
         */
        if (flag == true) {
            zip.putNextEntry(new ZipEntry(path + "/" + folder.getName() + "/"));
        } else { /*
                 * if the current name is directory, recursively traverse it
                 * to get the files
                 */
            if (folder.isDirectory()) {
                /*
                 * if folder is not empty
                 */
                addFolderToZip(path, srcFile, zip);
            } else {
                /*
                 * write the file to the output
                 */
                byte[] buf = new byte[1024];
                int len;
                FileInputStream in = new FileInputStream(srcFile);
                zip.putNextEntry(new ZipEntry(path + "/" + folder.getName()));
                while ((len = in.read(buf)) > 0) {
                    /*
                     * Write the Result
                     */
                    zip.write(buf, 0, len);
                }
            }
        }
    }

    /*
     * add folder to the zip file
     */
    public void addFolderToZip(String path, String srcFolder, ZipOutputStream zip) throws Exception {
        File folder = new File(srcFolder);

        /*
         * check the empty folder
         */
        if (folder.list().length == 0) {
            logger.debug(folder.getName());
            addFileToZip(path, srcFolder, zip, true);
        } else {
            /*
             * list the files in the folder
             */
            for (String fileName : folder.list()) {
                if (path.equals("")) {
                    addFileToZip(folder.getName(), srcFolder + "/" + fileName, zip, false);
                } else {
                    addFileToZip(path + "/" + folder.getName(), srcFolder + "/" + fileName, zip, false);
                }
            }
        }
    }

   
 public void convert2pdf(String src, String des)
{
	 
	 	BufferedReader r = null;
		try {
			r = new BufferedReader(new FileReader(src));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	    Document document = new Document(PageSize.A4.rotate());

	    try {
			PdfWriter.getInstance(document, new FileOutputStream(des));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	    document.open();

	    Font courier10pt = FontFactory.getFont(FontFactory.COURIER, 20);

	    String str;

	    try {
			while ( (str = r.readLine()) != null) {
			  try {
				document.add(new Paragraph( str.equals("") ? " " : str, courier10pt));
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    document.close();
	    try {
			r.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 
 }

/*
 * 
 * Opening file/folder
 * 
 * 
 */	
	
	public String GetPhotoUrl(String email, String rootpath) {
		
		try{
			photourl = dashboardDao.uspSelectUserProfile(email);
			photourl = photourl.substring(photourl.lastIndexOf("/") + 1);
			file = new File(rootpath + "images" + File.separator + photourl);
			if (file.exists()) {
				photourl = "images" + "/" + photourl;
							
			} else {
				photourl = "images/User.png";
			}
		}catch(Exception e){}
			return photourl;	
	}
	
	public  ArrayList<HashMap<String, Object>> GetFiles(String email, String rootpath) {
		
		try{	
				list.clear();			 	
				list = (ArrayList<HashMap<String, Object>>) dashboardDao.uspSelectFiles(email,  rootpath);
				
				return list;		
			}catch(Exception e){			
				return null;
			}
	 
		}

		/*
		 * 
		 * Get Files By Own
		 * 
		 */
		
		public ArrayList<HashMap<String, Object>> GetFilesByOwn(String email, String rootpath) {
			try{
				list.clear();
				
			
			 list = (ArrayList<HashMap<String, Object>>) dashboardDao.uspSelectFilesByOwn(email,  rootpath);
		
					return list;
			}catch (Exception e) {

				return null;
				
			}
			
		}
	
		/*
		 * 
		 * Get Files By Share
		 * 
		 */
		
		public ArrayList<HashMap<String, Object>> GetFilesByShare(String email, String rootpath) {

			try{
				list.clear();	
			
				 list = (ArrayList<HashMap<String, Object>>) dashboardDao.uspSelectFilesByShare(email,  rootpath);
			
			return list;
			
			}catch(Exception e){
				return null;
			}
		
		}

		/*
		 * 
		 * Get Files By Folder
		 * 
		 */
		
		public ArrayList<HashMap<String, Object>> GetFilesByFolder(String email, String rootpath) {

			try{
				list.clear();
			
			
			list = (ArrayList<HashMap<String, Object>>) dashboardDao.uspSelectFilesByFolder(email,  rootpath);
		
			return list;
			
			}catch(Exception e){
				return null;
			}
		
		}
	public void DeleteFile(String email,String id,String name,String path,String folder){
		 
				
			try {
			if(folder.equals("0"))
			{
				if(id!=null && name!=null && path!=null)
			    {
			
					if(id.length()>0){
				
						dashboardDao.uspDeleteFile(email, id, name, path, folder);
						
					}
			    }
		
		
			}else{
				
				DeleteFolder(email,id,path,name);
				
			}
		}catch(Exception e){
			
		}
	 }
	 /*
	  * Delete folders
	  * 
	  */
	 public void DeleteFolder(String email,String id,String path,String name){
		 
			try {				
				
			if(id!=null && name!=null && path!=null)
			{	
				
			if(id.length()>0){
		
			dashboardDao.uspDeleteFolder(email,id,path,name);
			
			}
		}
		}catch(Exception e){
				
		}
	 } 
	

	 public String openFile(HttpServletRequest request, HttpServletResponse response, String is_folder, String file_name,
					String file_id, String file_path, String is_secure,
					String functionality){
			 String status = "";
			 HttpSession session = request.getSession(true);
		 	 String logged_user = (String)session.getAttribute("user_name");
			 String logged_user_mail = (String)session.getAttribute("user_mail");
			 File f;		
				 logger.debug(" Inside openFile of service ....."+file_name);
						
					try{
						if(is_folder.equals("0")){
							String src_path = file_path+file_name;
							logger.debug("The src_path is---"+src_path);															
							String pdfpath = request.getServletContext().getRealPath("/")+"Userfiles"+File.separator+logged_user_mail+File.separator+"convertedPdfs"+File.separator;
							String swfpath = request.getServletContext().getRealPath("/")+"Userfiles"+File.separator+logged_user_mail+File.separator+"convertedSwfs"+File.separator;	
							String des_path =  request.getServletContext().getRealPath("/")+"Userfiles"+File.separator+logged_user_mail+File.separator+"convertedPdfs"+File.separator+(file_name.substring(0,file_name.lastIndexOf("."))+".pdf").replaceAll("\\s+","");
						    String decrypted_path =  request.getServletContext().getRealPath("/")+"Userfiles"+File.separator+logged_user_mail+File.separator+"convertedPdfs"+File.separator+"decrypted"+File.separator;
				 		    PDFConversion pdfConversion = new PDFConversion();
				 		    try{
								f = new File(decrypted_path);
							
								if(!f.exists()){
									f.mkdir();
									}
								}catch(Exception e){
									e.printStackTrace();
								}		
				 		    if(file_name.endsWith(".pdf")){//Start check for pdf files
				 		    	if(is_secure.equals("1")){
				 		    			logger.debug("file is secured pdf .....");											 		    		
										FileEncryptor.decrypt("DES/ECB/PKCS5Padding",src_path,decrypted_path+file_name);
										InputStream in = new FileInputStream(decrypted_path+file_name);
										OutputStream out = new FileOutputStream(des_path);
										byte[] buf = new byte[1024];
										int len;
										while ((len = in.read(buf)) > 0) {
											out.write(buf, 0, len);
										}
										in.close();
										out.close(); 
										File temp = new File(decrypted_path);
										String[] myFiles;      
											if(temp.isDirectory()){  
												myFiles = temp.list();  
												for (int j=0; j<myFiles.length; j++) {  
												File myFile = new File(temp, myFiles[j]);   
												myFile.delete();  
											}  
										}  
										temp.delete(); 
										 file_name = (file_name.substring(0,file_name.lastIndexOf("."))+".pdf").replaceAll("\\s+","");
									     status = file_name;									
									}else{			 				
									 logger.debug("file is normal pdf .....");	 
									 InputStream in = new FileInputStream(src_path);
									 OutputStream out = new FileOutputStream(des_path);
									 byte[] buf = new byte[1024];
									 int len;
									 while ((len = in.read(buf)) > 0) {
										 out.write(buf, 0, len);
									 }
									 in.close();
									 out.close(); 									 
									 file_name = (file_name.substring(0,file_name.lastIndexOf("."))+".pdf").replaceAll("\\s+","");									
									 status = file_name;
								}
							
				 		    }//End of pdf section
				 		    else if(file_name.endsWith(".xml") || file_name.endsWith(".sql")){ // For xml or sql files
				 		    	
				 		    	if(is_secure.equals("1")){//if file is secure and not pdf
								 logger.debug("file is secure xml/sql.....");	 
								 FileEncryptor.decrypt("DES/ECB/PKCS5Padding",src_path,decrypted_path+file_name);
									InputStream in = new FileInputStream(decrypted_path+file_name);
									OutputStream out = new FileOutputStream(des_path);
									byte[] buf = new byte[1024];
									int len;
									while ((len = in.read(buf)) > 0) {
										out.write(buf, 0, len);
									}
									in.close();
									out.close(); 	
			 					    pdfConversion.createPdf(decrypted_path+file_name, des_path, false);
			 					    File temp = new File(decrypted_path);
								    String[] myFiles;      
									if(temp.isDirectory()){  
										myFiles = temp.list();  
										for (int j=0; j<myFiles.length; j++) {  
										File myFile = new File(temp, myFiles[j]);   
										myFile.delete();  
										}  
									}  
								 temp.delete(); 		
								 file_name = (file_name.substring(0,file_name.lastIndexOf("."))+".pdf").replaceAll("\\s+","");
								 status = file_name;
								 }
				 		    	 else{	//If file is not secured xml/sql		 				 
								 logger.debug("file is not secured xml/sql .....");
								 pdfConversion.createPdf(src_path, des_path, false);
								 file_name = (file_name.substring(0,file_name.lastIndexOf("."))+".pdf").replaceAll("\\s+","");
								 status = file_name;
								 }
				 		    }
							else{
									if(is_secure.equals("1")){//if file is secure and not pdf
									 logger.debug("file is secure & not pdf .....");	 
									 FileEncryptor.decrypt("DES/ECB/PKCS5Padding",src_path,decrypted_path+file_name);
										InputStream in = new FileInputStream(decrypted_path+file_name);
										OutputStream out = new FileOutputStream(des_path);
										byte[] buf = new byte[1024];
										int len;
										while ((len = in.read(buf)) > 0) {
											out.write(buf, 0, len);
										}
										in.close();
										out.close(); 
										String strResult = pdfConversion.convert2pdf(decrypted_path+file_name, des_path);
										logger.debug("The strResult after convert2pdf is----"+strResult);
										File temp = new File(decrypted_path);
										String[] myFiles;      
										if(temp.isDirectory()){  
											myFiles = temp.list();  
											for (int j=0; j<myFiles.length; j++) {  
											File myFile = new File(temp, myFiles[j]);   
											myFile.delete();  
										}  
									}  
									temp.delete(); 
									file_name = (file_name.substring(0,file_name.lastIndexOf("."))+".pdf").replaceAll("\\s+","");
									status = file_name;
									 }
									else{	//If file is not secure	and not pdf		 				 
									 logger.debug("file is not secure & not pdf .....");											 				
									 String strResult = pdfConversion.convert2pdf(src_path, des_path);								
									 logger.debug("The strResult after convert2pdf is----"+strResult);
									 file_name = (file_name.substring(0,file_name.lastIndexOf("."))+".pdf").replaceAll("\\s+","");								
									 status = file_name;
									 }
				 	 			 }
								
				 	 		}
				 }catch(Exception e){
					 logger.error("opening file / folder....."+e.toString());
				 }  			
					return status;	
		 }
	 
	 public boolean deleteFile(HttpServletRequest request, HttpServletResponse response, String is_folder, String file_name,
				String file_id, String file_path, String is_secure,
				String functionality){
		 boolean status = false;
		 HttpSession session = request.getSession(true);
	 	 String logged_user = (String)session.getAttribute("user_name");
		 String logged_user_mail = (String)session.getAttribute("user_mail");
		
		 if(functionality.equals("delete"))
			{
			
				 try{
					 if(is_folder.equals("0")){
						
					   	 if(file_id!=null && file_name!=null && file_path!=null){
					 			DeleteFile(logged_user_mail, file_id,  file_name,file_path,is_folder);
					 			String pdfPath =  request.getServletContext().getRealPath("/")+"Userfiles"+File.separator+logged_user_mail+File.separator+"convertedPdfs"+File.separator;
					 			 file_name = (file_name.substring(0,file_name.lastIndexOf("."))+".pdf").replaceAll("\\s+","");
							
					 			File f = new File(pdfPath+file_name);		
					 	
					 			if(f.exists()){
					 				
								f.delete();
					 			}
					 			
					 			String swfPath=	  request.getServletContext().getRealPath("/")+"Userfiles"+File.separator+logged_user_mail+File.separator+"convertedSwfs"+File.separator;
								String file_name_swf = file_name+".swf";	
					 			File f1 = new File(swfPath+file_name_swf);
					 			if(f1.exists()){
									f1.delete();
						 			}					 			
					 			request.setAttribute("success_message", "File deleted successfully.");					 			
					 			status = true;
								}
					  	}else{
					 			
					 			if(file_id!=null && file_name!=null && file_path!=null){
					 					
					 				String pdfPath =  request.getServletContext().getRealPath("/")+"Userfiles"+File.separator+logged_user_mail+File.separator+"MyFiles"+File.separator;
	
						 			File f1 = new File(pdfPath+file_name);
						 			if(f1.exists()){
										f1.delete();
							 			}					 
					 				DeleteFolder(logged_user_mail, file_id, file_path, file_name);
					 				request.setAttribute("success_message", "Folder deleted successfully.");					 				
					 				status = true;
					 			}
					 	   
					 		}
					 					 
					 	}catch(Exception e){					 		
					 		logger.error("file / folder deleting request....."+e.toString());
					 	}
				 return status;
			}else{	  	 
				return status;
					}		 
					  
			}
	 @SuppressWarnings("resource")
	public void downloadFile(HttpServletRequest request, HttpServletResponse response, String is_folder, String file_name,
				String file_id, String file_path, String is_secure,
				String functionality){
		 HttpSession session = request.getSession(true);
	 	 String logged_user = (String)session.getAttribute("user_name");
		 String logged_user_mail = (String)session.getAttribute("user_mail");
		 String src_path = file_path+file_name;
	 	 String des_path = request.getServletContext().getRealPath("/")+"Userfiles"+File.separator+logged_user_mail+File.separator+"convertedPdfs"+File.separator;
	 	 String decrypted_path =  request.getServletContext().getRealPath("/")+"Userfiles"+File.separator+logged_user_mail+File.separator+"convertedPdfs"+File.separator+"decrypted"+File.separator;
		 OutputStream out = null;
		
		 if(functionality.equals("download")){
			 logger.debug("Inside downloadFile of service***************");
				try{			 	 
			 			 if(is_secure.equals("1")){			 				
						 	logger.debug("file is secure .....");
			 				File f = new File(decrypted_path);
			 				if(!f.exists()){
			 					
			 				f.mkdir();
			 				}
			 				FileEncryptor.decrypt("DES/ECB/PKCS5Padding",src_path,decrypted_path+file_name);
			 				InputStream in = new FileInputStream(decrypted_path+file_name);	
			 				try {
								out = new FileOutputStream(des_path+file_name);
							} catch (FileNotFoundException e1) {
								// TODO Auto-generated catch block
								e1.printStackTrace();
							}
				 			byte[] buf = new byte[1024];
				 			int len;
				 			while ((len = in.read(buf)) > 0) {
				 			   out.write(buf, 0, len);
				 			   
				 			}
				 			in.close();
				 			out.flush();
				 			out.close(); 
				 			File temp = new File(decrypted_path);
						    String[] myFiles;      
 				            if(temp.isDirectory()){  
 				                myFiles = temp.list();  
 				                for (int j=0; j<myFiles.length; j++) {  
 				                    File myFile = new File(temp, myFiles[j]);
 				                 
 				                    myFile.delete();  
 				                }  
 				             }  
 				            temp.delete(); 
 				            out = response.getOutputStream();
 					        file_path = des_path;
 				      	    if(file_name!=null && file_path!=null){
 						    	if(file_name.endsWith(".txt") || file_name.endsWith(".sql")){
 						    		response.setContentType("text/plain"); 
 									response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
 									FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
 									 int i; 
 						       		 while ((i=fileInputStream.read()) != -1) {
 						       	     out.write(i); 
 						       	  	}
 						       		 out.flush();
 	 						    	 out.close();
 						      	  	fileInputStream.close(); 
 						    	}else if(file_name.endsWith(".pdf")){
 						    		 response.setContentType("application/pdf"); 
 						   			 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
 						   			 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
 									 int i; 
 						      		 while ((i=fileInputStream.read()) != -1) {
 						      	     out.write(i); 
 						      	  	}
 						      		 out.flush();
 	 						    	out.close();
 						      	  	fileInputStream.close(); 
 						    	}else if(file_name.endsWith(".doc")){
 						    		 response.setContentType("application/msword"); 
 						   			 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
 						   			 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
 						   			 int i; 
 						      		 while ((i=fileInputStream.read()) != -1) {
 						      	     out.write(i); 
 						      	  	} 
 						      		 out.flush();
 	 						    	out.close();
 						      	  	fileInputStream.close(); 
 						      	}else if(file_name.endsWith(".docx")){
 						    	     response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document"); 
 						   			 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
 						   			 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
 									 int i; 
 						      		 while ((i=fileInputStream.read()) != -1) {
 						      	     out.write(i); 
 						      	  	} 
 						      		out.flush();
 	 						    	out.close();
 						      	  	fileInputStream.close(); 
 						      	 }else if(file_name.endsWith(".csv")){
 						    			
 								     response.setContentType("application/csv"); 
 						   			 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
 						   			 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
 						   			 int i; 
 						      		 while ((i=fileInputStream.read()) != -1) {
 						      	     out.write(i); 
 						      	  	}out.flush();
 	 						    	out.close();
 						      	  	fileInputStream.close();  
 						      	  	
 						      	 }else if(file_name.endsWith(".rtf")){
 						    		 response.setContentType("application/rtf"); 
 						   			 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
 						   			 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
 						     	 	 int i; 
 						      		 while ((i=fileInputStream.read()) != -1) {
 						      	     out.write(i); 
 						      	  	}
 						      		out.flush();
 	 						    	out.close();
 						      	  	fileInputStream.close(); 
 						      	}else if(file_name.endsWith(".xls")){
 						    		 response.setContentType("application/vnd.ms-excel"); 
 						   			 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
 						   			 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
 						   			 int i; 
 						      		 while ((i=fileInputStream.read()) != -1) {
 						      	     out.write(i); 
 						      	  	}
 						      		out.flush();
 	 						    	out.close();
 						      	  	fileInputStream.close(); 
 						      	}else if( file_name.endsWith(".xlsx")){
 							     	 response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"); 
 									 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
 									 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
 								 	 int i; 
 								 	 while ((i=fileInputStream.read()) != -1) {
 								 		 out.write(i); 
 								 	 } 
 								 	out.flush();
 	 						    	out.close();
 								 	 fileInputStream.close(); 
 						  	  }else if(file_name.endsWith(".ppt")){
 									response.setContentType("application/vnd.ms-powerpoint"); 
 									response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
									    FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
 								    int i; 
 								    while ((i=fileInputStream.read()) != -1) {
 								    	out.write(i); 
 						  	  		} 
 								   out.flush();
	 						    	out.close();
 						  	  		fileInputStream.close(); 
 						  	  }else if(file_name.endsWith(".pptx")){
 						  		  	response.setContentType("application/vnd.openxmlformats-officedocument.presentationml.presentation"); 
 									response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
 									FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
 								    int i; 
 								    while ((i=fileInputStream.read()) != -1) {
 								    	out.write(i); 
 						  	  		} 
 								    out.flush();
	 						    	out.close();
 						  	  		fileInputStream.close(); 
 						  	  }else if(file_name.endsWith(".xml")){
 									response.setContentType("application/xml"); 
 									response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
 									FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
 									int i; 
 									while ((i=fileInputStream.read()) != -1) {
 										out.write(i); 
 						  	  		}
 									out.flush();
 	 						    	out.close();
 									fileInputStream.close();
 						  	  }	else{
 						  		    logger.debug("filename empty so,this is zipping folder request.....");
 									try{
 										boolean a = zipFiles(file_path + file_name,file_path + file_name+".zip");
 								        response.setContentType("application/zip");
 								        response.setHeader("Content-Disposition","attachment; filename=\"" + file_name.concat(".zip") + "\""); 
 									    FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name+".zip");
 									    int i; 
 									    while ((i=fileInputStream.read()) != -1) {
 									    out.write(i); 
 									   }
 									   out.flush();
 		 						       out.close();
 						    	  	fileInputStream.close(); 
 						    	  	f = new File(file_path + file_name+".zip");
 						    	  	if(f.exists()){
 						    	  		f.delete();
 						    	  		}
 									}catch(Exception e){
 									logger.error("Zip file download error...."+e.toString());
 								}
 							
 								}
 						    }
 				      	 out.flush();
					     out.close();
					     File decTempFile = new File(des_path + file_name);
						 if(decTempFile.exists()){
							logger.debug("The decTempFile.exists() is-----"+decTempFile.exists());
							decTempFile.delete();
							}
 				    }else{
 				    	logger.debug("file is not secure .....");
 				    	out = response.getOutputStream();
 				    	if(file_name!=null && file_path!=null){
					   			if(file_name.endsWith(".txt") || file_name.endsWith(".sql")){					    		
								response.setContentType("text/plain"); 
								response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
					    		FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
					    		int i; 
					       		 while ((i=fileInputStream.read()) != -1) {
					       	     out.write(i); 
					       	  	}
					       		out.flush();
 						    	out.close();
					       	  	fileInputStream.close(); 
					      }else if(file_name.endsWith(".pdf")){
					    	  	 response.setContentType("application/pdf"); 
					   			 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
					   			 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
							 	 int i; 
					      		 while ((i=fileInputStream.read()) != -1) {
					      	     out.write(i); 
					      	  	}
					      		out.flush();
 						    	out.close();
					      	  	fileInputStream.close(); 
					      }else if(file_name.endsWith(".doc")){
					    		 response.setContentType("application/msword"); 
					   			 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
					   			 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
								 int i; 
					      		 while ((i=fileInputStream.read()) != -1) {
					      	     out.write(i); 
					      	  	}
					      		out.flush();
 						    	out.close();
					      	  	fileInputStream.close(); 
					     }else if(file_name.endsWith(".docx")){
					    		 response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document"); 
					   			 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
					   			 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);								  
					     	 	 int i; 
					      		 while ((i=fileInputStream.read()) != -1) {
					      	     out.write(i); 
					      	  	} 
					      		out.flush();
 						    	out.close();
					      	  	fileInputStream.close(); 
					     }else if(file_name.endsWith(".csv")){
					    		
					    	 	 response.setContentType("application/csv"); 
					   			 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
					   			 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);								  
					     	 	 int i; 
					      		 while ((i=fileInputStream.read()) != -1) {
					      	     out.write(i); 
					      	  	}
					      		out.flush();
						    	out.close();
					      	  	fileInputStream.close(); 
					      }else if(file_name.endsWith(".rtf")){					    		
					    		response.setContentType("application/rtf"); 
					   			response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
					   			FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);								  
					     	 	int i; 
					      		while ((i=fileInputStream.read()) != -1) {
					      	    out.write(i); 
					      	  	}
					      		out.flush();
						    	out.close();
					      	  	fileInputStream.close(); 
					      }else if(file_name.endsWith(".xls")){
					    	     response.setContentType("application/vnd.ms-excel"); 
					   			 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
					   			 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);								  
					     	 	 int i; 
					      		 while ((i=fileInputStream.read()) != -1) {
					      	     out.write(i); 
					      	  	}
					      		out.flush();
						    	out.close();
					      	  	fileInputStream.close(); 
					      }else if( file_name.endsWith(".xlsx")){							
					    	  	 response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"); 
								 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
								 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);							  
								 int i; 
								 while ((i=fileInputStream.read()) != -1) {
									 out.write(i); 
								 }
								 out.flush();
	 						     out.close();
								 fileInputStream.close(); 
					      }else if(file_name.endsWith(".ppt")){							
					    	  	 response.setContentType("application/vnd.ms-powerpoint"); 
								 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\"");
								 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);							  
								 int i; 
								 while ((i=fileInputStream.read()) != -1) {
									 out.write(i); 
								 } 
								 out.flush();
							     out.close();
						  	  	fileInputStream.close(); 
					      }else if(file_name.endsWith(".pptx")){							
					    	  	 response.setContentType("application/vnd.openxmlformats-officedocument.presentationml.presentation"); 
								 response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
								 FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);							  
								 int i; 
								 while ((i=fileInputStream.read()) != -1) {
									 out.write(i); 
								 }
								 out.flush();
	 						     out.close();
								 fileInputStream.close(); 
					      }else if(file_name.endsWith(".xml")){							
								response.setContentType("application/xml"); 
								response.setHeader("Content-Disposition","attachment; filename=\"" + file_name + "\""); 
								FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name);
								int i; 
								while ((i=fileInputStream.read()) != -1) {
									out.write(i); 
					  	  		}
								out.flush();
								out.close();
					  	  		fileInputStream.close(); 
					  	
					
						}else{
							logger.debug("filename empty so,this is zipping folder request.....");
							try{
								boolean a = zipFiles(file_path + file_name,file_path + file_name+".zip");						    
					            response.setContentType("application/zip");
					            response.setHeader("Content-Disposition","attachment; filename=\"" + file_name.concat(".zip") + "\""); 								
					            FileInputStream fileInputStream = new java.io.FileInputStream(file_path + file_name+".zip");
					            int i; 
					    		 while ((i=fileInputStream.read()) != -1) {
					    	     out.write(i); 
					    	  	}
					    		 out.flush();
							     out.close();
					    	  	fileInputStream.close(); 
					    	  	File f = new File(file_path + file_name+".zip");
					    	  	if(f.exists()){
					    	  		f.delete();
					    	  		}
					    	  	}catch(Exception e){
								logger.debug("Zip file download error...."+e.toString());
							}
						
							}
					    }
 				    		out.flush();
					    	out.close();
			 			 }
			 			
					  	  }catch(Exception e){
					  		  logger.debug("downloading files / folder....."+e.toString()); 
					  	  }
		 				}
	 			}
	 
	
	 @Override
		public boolean shareFile(HttpServletRequest request,HttpServletResponse response,String logged_user_mail, String strEmailID,
				String fileid, int Days, int Hours, int Minutes, String download, String share, String print, String isfolder,String filename1) {		 
	
		 		final Calendar cal = Calendar.getInstance();
				DateFormat newFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");
				String createdDate=newFormat.format(cal.getTime());			 
				String sharedTime=newFormat.format(cal.getTime());
				
	    if (Days == 0 && Hours == 0  && Minutes == 0)
	     {
	    	  expiredTime=newFormat.format(cal.getTime()); 
	    	  logger.debug("The expiredTime in service is************"+expiredTime);
	     }
	     else 
	     {  	
	    	  	cal.add( Calendar.DATE, +Days ); 	    	 	         	
	    	  	cal.add(Calendar.HOUR_OF_DAY, +Hours);  	         	    	  	
	         	cal.add(Calendar.MINUTE, Minutes);
	    	  	    	  	
	    	  	expiredTime = newFormat.format(cal.getTime());	    	  	
	    	  	logger.debug("The expiredTime in service is in ELSE************"+expiredTime);
	     }
			try{			
					String strResult = (String) dashboardDao.usp_Insert_ShareFile(logged_user_mail,strEmailID,fileid,sharedTime,expiredTime,createdDate,download,share,print,isfolder);
					int i = Integer.parseInt(strResult);			 	 
			 		if(i==1)
			 		{   request.setAttribute("message1", "Sharefile succuss.");
			 					   
			 					    String to = strEmailID;				
			 					    final String from = "mailkeert@gmail.com";/** gmail id***/		
			 					    final String cc = "mailkeert@gmail.com";
			 					    String host = "smtp.gmail.com";		     
			 					    final String pwd = "keerthikeerthi";/** gmail id password***/		     
			 					 
			 					 //  String body = "Dear User,"+"\n"+logged_user_mail+ " has  shared "+filename1+"  file with you.";
			 					    String body = "Dear User," +"\n"+ logged_user_mail+ " has  shared "+filename1+"  file with you.Now you can login here"+"\n"+"http://defigomail.com:8082/Lockit_Refactored/login.do?UserName="+strEmailID+"";
			 					    Properties props = new Properties();   
			 					    props.setProperty("mail.transport.protocol", "smtp");   
			 					    props.setProperty("mail.host", host);   
			 					    props.put("mail.smtp.auth", "true");   
			 					    props.put("mail.smtp.port", "465");   
			 					    props.put("mail.smtp.socketFactory.port", "465");   
			 					    props.put("mail.smtp.socketFactory.class",  "javax.net.ssl.SSLSocketFactory");   
			 					    props.put("mail.smtp.socketFactory.fallback", "false");   
			 					    props.setProperty("mail.smtp.quitwait", "false"); 
			 					    Session session1 = Session.getInstance(props,  new javax.mail.Authenticator() {
			 					    		protected PasswordAuthentication getPasswordAuthentication() {		   	
			 					    			return new PasswordAuthentication(from,pwd);
			 					    		}
			 					    });
			 			        MimeMessage message = new MimeMessage(session1);
			 			        DataHandler handler = new DataHandler(new ByteArrayDataSource(body.getBytes(), "text/plain"));   
			 			        message.setFrom(new InternetAddress(from));
			 			        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
			 			        message.addRecipient(Message.RecipientType.CC,new InternetAddress(cc));
			 			        message.setSubject("File shared successfully");
			 			        message.setDataHandler(handler); 
			 			        Transport.send(message);
				   
			} else
		    { 
		    	System.out.println("isfolder value in else"+isfolder);
		    	  return false;
		    }  
	 		/* return true;*/
		}  
		     catch (Exception e) {
		    		return false;
			}
			return true;
	
	 }
		@Override
		public String fileOwnerID(String fileid) {			
			String id = dashboardDao.usp_Select_SharedFileOwner(fileid);
			 
			return id; 
		}
		
	   @Override
		public String sharedFilePropertiesUpdate(String userid,String fileid) {
			String id = dashboardDao.usp_Select_SharedUsersandProperties(userid,fileid);
			return id;   
		}

		@Override
		public ArrayList<HashMap<String, Object>> fileOptions(String userid,String fileid) {
			
			try{
				list1.clear();
				list1 =  dashboardDao.usp_Select_SharedUsersandProperty(userid,fileid);		
				return list1;
			}catch(Exception e){
				return null;
			}
		}

		@Override
		public boolean shareFileFolder(HttpServletRequest request, String logged_user_mail, String strEmailID, String fileid,
				int days, int hours, int minutes, String download, String share, String print, String isfolder,String filename1) {
			
			final Calendar cal = Calendar.getInstance();
			DateFormat newFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String createdDate=newFormat.format(cal.getTime());
			 
			String sharedTime=newFormat.format(cal.getTime());
			if (days == 0 && hours == 0  && minutes == 0)
			{
	    	  expiredTime=newFormat.format(cal.getTime()); 
			}
			else 
			{
	    	  	cal.add( Calendar.DATE, +days ); 	    	  
	    		         	
	    	  	cal.add(Calendar.HOUR_OF_DAY, +hours);   
	       	    	  	
	         	cal.add(Calendar.MINUTE, minutes);
	    	 	    	  	
	    	  	expiredTime = newFormat.format(cal.getTime());	    	  	
	    	  
	    	 
			}
			try{							
					String strResult = (String) dashboardDao.usp_Insert_ShareFolder(logged_user_mail,strEmailID,fileid,sharedTime,expiredTime,createdDate,download,share,print,isfolder);			
					int i = Integer.parseInt(strResult);			 	 
			 		if(i==1)
			 		{  
				    	  request.setAttribute("message1", "ShareFolder succuss.");
				    	
			 					  	    
			 					    String fpkey = Long.toString(Calendar.getInstance().getTimeInMillis());
			 					    String to = strEmailID;				
			 					    final String from = "mailkeert@gmail.com";/** gmail id***/
			 					    final String cc = "mailkeert@gmail.com";
			 					    String host = "smtp.gmail.com";		     
			 					    final String pwd = "keerthikeerthi";/** gmail id password***/		     
			 					 
			 					   // String body = "Dear User,"+"\n"+logged_user_mail+ " has  shared "+filename1+" Folder with you.";
			 					    String body = "Dear User," +"\n"+ logged_user_mail+ " has  shared "+filename1+"  Folder with you. Now you can login here"+"\n"+"http://defigomail.com:8082/Lockit_Refactored/login.do?UserName="+strEmailID+"";		
			 			
			 					    Properties props = new Properties();   
			 					    props.setProperty("mail.transport.protocol", "smtp");   
			 					    props.setProperty("mail.host", host);   
			 					    props.put("mail.smtp.auth", "true");   
			 					    props.put("mail.smtp.port", "465");   
			 					    props.put("mail.smtp.socketFactory.port", "465");   
			 					    props.put("mail.smtp.socketFactory.class",  "javax.net.ssl.SSLSocketFactory");   
			 					    props.put("mail.smtp.socketFactory.fallback", "false");   
			 					    props.setProperty("mail.smtp.quitwait", "false"); 
			 					    Session session1 = Session.getInstance(props,  new javax.mail.Authenticator() {
			 					    		protected PasswordAuthentication getPasswordAuthentication() {		   	
			 					    			return new PasswordAuthentication(from,pwd);
			 					    		}
			 					    });
			 			        MimeMessage message = new MimeMessage(session1);
			 			        DataHandler handler = new DataHandler(new ByteArrayDataSource(body.getBytes(), "text/plain"));   
			 			        message.setFrom(new InternetAddress(from));
			 			        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
			 			        message.addRecipient(Message.RecipientType.CC,new InternetAddress(cc));
			 			        message.setSubject("Folder shared successfully");
			 			        message.setDataHandler(handler); 
			 			        Transport.send(message);
			 			      
			 			        return true;
			 			     } else
							    {  
						    	  return false;
						    } 
			 			     
			 				} catch (MessagingException mex) {	
			 			    	 logger.error(mex);
			 			    		return false;
			 				
			 			} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
								 logger.error(e);
							}
			return false; 
				    	
			}
		@Override
		public boolean shareFilePropUpdate(HttpServletRequest request, String logged_user_mail, String strEmailID, String fileID,
				String formattedDate, String download_upd, String sharing_upd, String print_upd) {
			
			String strResult = (String) dashboardDao.usp_update_SharedFileProperties(strEmailID,fileID,logged_user_mail,download_upd,sharing_upd,print_upd,formattedDate);
			
			if(strResult.equals("1"))
				return true;
			else
				return false;
		}
		
		public List getExpiredDateTime(String user_mail,String fileID){
			
			ArrayList<HashMap<String,Object>> listPrintExpiry	= new ArrayList<HashMap<String,Object>>();
			try{
				 logger.debug("The parameters are in service are---"+user_mail+"----"+fileID);
				 listPrintExpiry = (ArrayList<HashMap<String, Object>>) dashboardDao.getExpiredDateTime(user_mail, fileID);
				
			}catch(Exception e){
				
			}
			return listPrintExpiry;
		}
		
		
		@Override
		public ArrayList getAllUserContacts(
				String user_mail) {

			try{
				usersList.clear();			
				usersList = dashboardDao.usp_select_all_users(user_mail);
				return (ArrayList) usersList;
			}catch(Exception e){
				logger.error("AllContacts:"+e.toString());
				return null;
			}
				
		}
}	

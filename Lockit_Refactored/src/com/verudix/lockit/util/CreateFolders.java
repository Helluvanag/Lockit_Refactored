package com.verudix.lockit.util;

import java.io.File;
import javax.servlet.http.*;

import org.apache.log4j.Logger;


public class CreateFolders {
	static Logger logger = Logger.getLogger(CreateFolders.class);
	public static void createRootFolders(HttpServletRequest request,String user_email){
		String rootpath = request.getServletContext().getRealPath("/")+"Userfiles";	
		File dir = new File(rootpath);	
		 if(!dir.exists()){
			   dir = new File(rootpath);/******* creating userfiles folder if not exists******/
			   dir.mkdir(); 
		   }  
		 
		 String email_path = rootpath+File.separator + user_email;      					 
		 File f = new File(email_path);
		 if(!f.exists()){
			 File f1 = new File(email_path);/******* creating email_folder if not exists******/
			 f1.mkdir();
		 }
		 
		String myfiles_path = email_path+ File.separator+"My Files/"; 		
		File f2 = new File(myfiles_path);
		if(!f2.exists()){
		   File f3 = new File(myfiles_path);/******* creating myfiles folder if not exists******/
		   f3.mkdir();
	   }
		
		String convertedPdf_path =  email_path+ File.separator+"convertedPdfs/";
		File f4 = new File(convertedPdf_path);
		 if(!f4.exists()){
		   File f5 = new File(convertedPdf_path);/******* creating convertedPdfs folder if not exists******/
		   f5.mkdir();
	   }
		 
		 String convertedSwf_path =  email_path+ File.separator+"convertedSwfs/";
		File f6 = new File(convertedSwf_path);
		 if(!f6.exists()){
		   File f7 = new File(convertedSwf_path);/******* creating convertedSwfs folder if not exists******/
		   f7.mkdir();
	   }
		 
		 String sharedFiles_path =  email_path+ File.separator+"Shared Files/";
 		File f8 = new File(sharedFiles_path);
		 if(!f8.exists()){
		   File f9 = new File(sharedFiles_path);/******* creating Shared Files folder if not exists******/
		   f9.mkdir();
	   }
	}
}

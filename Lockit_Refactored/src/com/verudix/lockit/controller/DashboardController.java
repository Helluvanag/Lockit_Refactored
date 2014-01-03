package com.verudix.lockit.controller;

import java.io.File;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

import com.verudix.lockit.form.DashboardForm;
import com.verudix.lockit.form.ShareFileForm;
import com.verudix.lockit.service.DashboardService;


@Controller
@SessionAttributes({"user_mail"})
public class DashboardController {
	
	private DashboardService dashboardService;
	Logger logger = Logger.getLogger(DashboardController.class);
	String download="", share="", print="", ownerID="", fileid="";
	int Days,Hours,Minutes;
	static ArrayList<HashMap<String,Object>> list1	= new ArrayList<HashMap<String,Object>>();
	List usersList=new ArrayList();

	public void setDashboardService(DashboardService dashboardService) {
        this.dashboardService = dashboardService;       
    }
	
	public Object formBackingObject(HttpServletRequest request) throws Exception{
  	  	DashboardForm backingObject = new DashboardForm();
	  	 /*The backing object should be set up here, with data for the initial values
	  	 * of the formatted fields. This could either be hard-coded, or retrieved from a
	  	 * database.This technique is useful to set a default selected value for HTML components, like checkbox , radio button or select options.
	  	 */
	  	return backingObject;
  	}
	 	@RequestMapping("/dashboard.do")
	    public ModelAndView dashboard(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail")
        String user_mail,@ModelAttribute("f2path") String f2path,@ModelAttribute("strFileId") String strFileId,
        @ModelAttribute("bool") String bool,@ModelAttribute("strExpiredDateTime") String strExpiredDateTime,@ModelAttribute("strPrint") String strPrint,
        @ModelAttribute("strExpMsg") String strExpMsg,@ModelAttribute("strFolderName") String strFolderName) throws Exception {
	 		
	 		ArrayList<HashMap<String, Object>> mydata = null;
	 		String dropdown="";	
			dropdown = request.getParameter("selection");
			if(dropdown == null)
				dropdown = "";
			String strOwner = "";
			String strUser = user_mail;
			
			if(strFileId != null){
			if(strFileId.length()>0){
				strOwner =  dashboardService.fileOwnerID(strFileId);
			}}
			if(f2path == null)
				f2path = "";
			String rootpath =  request.getServletContext().getRealPath("/")+"Userfiles"+File.separator+strUser+File.separator+ "My Files"+"/";
			String Photourl = dashboardService.GetPhotoUrl(strUser,request.getServletContext().getRealPath("/"));
			if(dropdown.length() > 0){
			if(dropdown.equals("All")){
				if(f2path.length() > 0){
					mydata = dashboardService.GetFilesByFolder(strUser, f2path);//code changed from strOwner to strUser
				}else{
					mydata = dashboardService.GetFiles(strUser, rootpath);
				}
			}
			else if(dropdown.equals("Owned by me")){
					mydata = dashboardService.GetFilesByOwn(strUser, rootpath);
			}
			else if(dropdown.equals("Shared with me")){
					mydata = dashboardService.GetFilesByShare(strUser, rootpath);		
			}
	 	}else{
	 		
				if(f2path.length() > 0){
					mydata = dashboardService.GetFilesByFolder(strUser, f2path);//code changed from strOwner to strUser
				}else{
					mydata = dashboardService.GetFiles(strUser, rootpath);
				}
			}
			String shareUpdate = (String)request.getParameter("shareUpdate");			
				

			ModelAndView mav = new ModelAndView();
			mav.setViewName("dashboard");
			mav.addObject("mydata",mydata);
			mav.addObject("dropdown",dropdown);
			mav.addObject("Photourl",Photourl);
			mav.addObject("shareUpdate",shareUpdate);
			mav.addObject("f2path",f2path);
			mav.addObject("bool",bool);
			mav.addObject("strFileId",strFileId);
			mav.addObject("strFolderName",strFolderName);
			mav.addObject("strExpiredDateTime",strExpiredDateTime);
			mav.addObject("strPrint",strPrint);
			mav.addObject("strExpMsg",strExpMsg);
			
		    return mav;
	    }
	 	
	 	@RequestMapping("/openFile.do")
	 	public ModelAndView openFile(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail")
        String user_mail,@ModelAttribute("dashboardForm")
        DashboardForm dashboardForm, BindingResult result,final RedirectAttributes redirectAttributes) throws Exception {
	 		
	 		String is_secure,is_folder,file_id,file_name,file_path,functionality,owner_id,is_expiry;	
	 		file_id = dashboardForm.getFile_id();
			file_name = dashboardForm.getFile_name();
			file_path = dashboardForm.getFile_path();
			is_folder = dashboardForm.getIs_folder();
			is_secure = dashboardForm.getIs_secure();
			functionality = dashboardForm.getFunctionality();
			owner_id = dashboardForm.getOwner_id();
			is_expiry = dashboardForm.getIs_expiry();	
			String f2path = dashboardForm.getF2path();
			String strExpiredDateTime = "";
			String strPrint = "";
			String strExpMsg = "";
			String strFolderExpMsg = "";
			String bool = "";
			String update_fileviewedproperty = dashboardService.usp_update_fileviewedproperty(request, response,file_id,user_mail);
			if(is_expiry.equals("0")){
				ArrayList<HashMap<String,Object>>  item = (ArrayList<HashMap<String, Object>>) dashboardService.getExpiredDateTime(user_mail, file_id);			
				for(int i=0;i<item.size();i++){
					strExpiredDateTime =  (String) item.get(i).get("ExpiredDateTime");
					strPrint =  (String) item.get(i).get("Print");
				}
				logger.debug("The strExpiredDateTime is**********"+strExpiredDateTime+"****Print is****"+strPrint);
				if(strExpiredDateTime.equals("1969-01-01 00:00:00")){}else{
					redirectAttributes.addFlashAttribute("strExpiredDateTime", strExpiredDateTime);
					redirectAttributes.addFlashAttribute("strPrint", strPrint);
				}
			}else{
				strExpMsg = "THE FILE IS EXPIRED.";				
			}
			
			bool = dashboardService.openFile(request, response,is_folder, file_name, file_id,  file_path,  is_secure, functionality);
			logger.debug("The result of openFile is----"+bool);	
			if(f2path.length() > 0){
				
				dashboardForm.setFolderName("");
				redirectAttributes.addFlashAttribute("dashboardForm",dashboardForm);	
				redirectAttributes.addFlashAttribute("strOpenFileResult",bool);
				redirectAttributes.addFlashAttribute("strExpMsg", strExpMsg);
				redirectAttributes.addFlashAttribute("strExpiredDateTime", strExpiredDateTime);
				redirectAttributes.addFlashAttribute("strPrint", strPrint);
				return new ModelAndView("redirect:openFolder.do");
			}else{
				if(bool.equals("")){				
					return new ModelAndView("redirect:dashboard.do");
				}
				else{	
					redirectAttributes.addFlashAttribute("bool", bool);				
					redirectAttributes.addFlashAttribute("strExpMsg", strExpMsg);
					return new ModelAndView("redirect:dashboard.do");				
				}
				
			}
			
	    }
	 	
	 	@RequestMapping("/openFolder.do")
	 	public ModelAndView openFolder(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("dashboardForm")
        DashboardForm dashboardForm,@ModelAttribute("strFileResult") String strFileResult,@ModelAttribute("strFolderResult")
        String strFolderResult, @ModelAttribute("counter") String IntCounter,
        @ModelAttribute("folderFail") String folderFail,
        @ModelAttribute("fileSuccess") String fileSuccess,
        @ModelAttribute("folderSuccess") String folderSuccess,
        @ModelAttribute("fileFail") String fileFail,
        @ModelAttribute("strOpenFileResult") String strOpenFileResult,
        @ModelAttribute("strExpMsg") String strExpMsg,
        @ModelAttribute("strExpiredDateTime") String strExpiredDateTime,@ModelAttribute("strPrint") String strPrint,
        @ModelAttribute("strFileDeleteResult") String strFileDeleteResult, @ModelAttribute("errMsg") String errMsg,BindingResult result,final RedirectAttributes redirectAttributes) throws Exception {
	 		
	 		String cntInc = dashboardForm.getCntInc();
	 		String strFileId = dashboardForm.getFolderId();
	 		String is_expiry = dashboardForm.getIs_expiry();// or dashboardForm.getFolderExpiry();
	 		String f2path = dashboardForm.getF2path();
	 		String strFolderName = dashboardForm.getFolderName();
	 	
	 		if(is_expiry.equals("0")){
	 		redirectAttributes.addFlashAttribute("f2path", f2path);
	 		redirectAttributes.addFlashAttribute("strFileId", strFileId);
	 		redirectAttributes.addFlashAttribute("strFolderName", strFolderName);
	 		redirectAttributes.addFlashAttribute("strIsExpiry", is_expiry);
	 		redirectAttributes.addFlashAttribute("strCntInc", cntInc);
	 		if(strFileResult.equals("Success")){
				redirectAttributes.addFlashAttribute("message", "File Uploaded Successfully.");	
			}else if(strFileResult.equals("Failed")){
				 redirectAttributes.addFlashAttribute("message1", "File Already Exists.");
			 }else if(strFileResult.equals("Format")){
				 logger.debug("Inside format***************");
				 redirectAttributes.addFlashAttribute("message1", "Upload File Supported Formats-[doc, .docx, .txt, .rtf, .xml, .xls, .xlsx, .csv, .ppt, .pptx, .pdf, .sql]");
			 }
	 		if(strFolderResult.equals("Success")){
				redirectAttributes.addFlashAttribute("message", "Folder Created Successfully.");
			}else if(strFolderResult.equals("Exists")){					
				redirectAttributes.addFlashAttribute("error_message", "Folder Already Exists.");
			}else{
				if(errMsg.length()>0)
					redirectAttributes.addFlashAttribute("error_message", errMsg); 	
				else
					redirectAttributes.addFlashAttribute("error_message", null);
			}
	 		if(strFileDeleteResult.equals("Success")){
				redirectAttributes.addFlashAttribute("message", "File/Folder deleted successfully.");	
			}else if(strFileDeleteResult.equals("Failed")){
				 redirectAttributes.addFlashAttribute("message1",  "File/Folder cannot be deleted.");
			 }
	 		String isfolder = dashboardForm.getFile_txt_isfolder();
	 		if(IntCounter.equals("GreaterThanZero")){
	 			 		    	   
		    	   if(isfolder.equals("0")){ 
		    		    redirectAttributes.addFlashAttribute("message",  fileSuccess);
		    	   }else{		    		   
	   			 		redirectAttributes.addFlashAttribute("message",  folderSuccess);
		    	   }
	 		}else if(IntCounter.equals("LessThanZero")){ 
			 	   if(isfolder.equals("0")){ 
		    		    redirectAttributes.addFlashAttribute("message1",  fileFail);
		    	   }else{		    		   
	   			 		redirectAttributes.addFlashAttribute("message1",  folderFail);
		    	   }		   					
				}
	 		if(strOpenFileResult.equals("")){		
				
			}else{
				logger.debug("The strExpMsg value is : "+strExpMsg);
				logger.debug("The strPrint value is : "+strPrint);
				redirectAttributes.addFlashAttribute("bool", strOpenFileResult);				
				redirectAttributes.addFlashAttribute("strExpMsg", strExpMsg);
				redirectAttributes.addFlashAttribute("strExpiredDateTime", strExpiredDateTime);
				redirectAttributes.addFlashAttribute("strPrint", strPrint);
				return new ModelAndView("redirect:dashboard.do");				
			}
	 		}else{
	 			redirectAttributes.addFlashAttribute("message1", "Folder Is Expired");				
	 		}
	 		return new ModelAndView("redirect:dashboard.do");
	 		
	    }	 	
	 	
	 	@RequestMapping("/downloadFile.do")
	 	public void downloadFile(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("dashboardForm")
        DashboardForm dashboardForm, BindingResult result) throws Exception {
	 		
	 		String is_secure,is_folder,file_id,file_name,file_path,functionality,dropdown="";	
			file_id = dashboardForm.getFile_id();
			file_name = dashboardForm.getFile_name();
			file_path = dashboardForm.getFile_path();
			is_folder = dashboardForm.getIs_folder();
			is_secure = dashboardForm.getIs_secure();
			functionality = dashboardForm.getFunctionality();		
			dashboardService.downloadFile(request, response,is_folder, file_name, file_id,  file_path,  is_secure, functionality);	
	    }
	 	
	 	@RequestMapping("/deleteFile.do")
	 	public ModelAndView deleteFile(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("dashboardForm")
        DashboardForm dashboardForm, BindingResult result,final RedirectAttributes redirectAttributes) throws Exception {
	 		
	 		String is_secure,is_folder,file_id,file_name,file_path,functionality,strCntInc,strIsExpiry;
	 		String message="";	 
	 		String f2path = (String)request.getParameter("f2path");
	 		strCntInc = dashboardForm.getCntInc();
			file_id = dashboardForm.getFile_id();
			file_name = dashboardForm.getFile_name();
			file_path = dashboardForm.getFile_path();
			is_folder = dashboardForm.getIs_folder();
			is_secure = dashboardForm.getIs_secure();
			functionality = dashboardForm.getFunctionality();
			strCntInc = dashboardForm.getCntInc();
			strIsExpiry = dashboardForm.getIs_expiry();
			String strFileDeleteResult = null;
			
			boolean bool = dashboardService.deleteFile(request, response,is_folder, file_name, file_id,  file_path,  is_secure, functionality);
			if(bool)
				strFileDeleteResult = "Success";
			else
				strFileDeleteResult = "Failed";
			if(f2path.length() >0){
				
				dashboardForm.setFolderName("");
				redirectAttributes.addFlashAttribute("dashboardForm",dashboardForm);	
				redirectAttributes.addFlashAttribute("strFileDeleteResult",strFileDeleteResult);
				return new ModelAndView("redirect:openFolder.do");
			}
			else{
				if(strFileDeleteResult.equals("Success")){
					redirectAttributes.addFlashAttribute("message", "File/Folder deleted successfully.");	
				}else if(strFileDeleteResult.equals("Failed")){
					 redirectAttributes.addFlashAttribute("message1",  "File/Folder cannot be deleted.");
				 }
				return new ModelAndView("redirect:dashboard.do");
			}
			
			}
	 	
	 	@RequestMapping("/sharePopup.do")//Written for using Ajax function for Share functionality - Not used presently
	 	public @ResponseBody String sharePopup(HttpServletRequest request, HttpServletResponse response, String fileShareid) throws Exception {
	 		String returnText;
			if(fileShareid != null){
				returnText = fileShareid;
			}else{
				returnText = "Error";
			}
			HttpSession session = request.getSession();
			String	 logged_user_mail = (String)session.getAttribute("user_mail");
			ArrayList<HashMap<String, Object>> arrlistObj =  dashboardService.fileOptions(logged_user_mail, fileShareid);
			Map hmap = new HashMap();
			JSONArray jarray = new JSONArray();
			for( Iterator i=arrlistObj.iterator(); i.hasNext(); ){
				   hmap = (HashMap) i.next();
				    for( Iterator j = hmap.keySet().iterator(); j.hasNext(); ){
				      String key = (String) j.next();
				      String value = (String) hmap.get( key );
				      hmap.put(key, value);
				   }
				  jarray.add(hmap);
				}
			logger.debug("The JSONArray is*******"+jarray.toString());
			response.setHeader( "Pragma", "no-cache" );
			response.setHeader( "Cache-Control", "no-cache" );
			return jarray.toString();
	    }
		 	
	 	//Display Details of SharedFile In DashBoard Page
	 	@RequestMapping("/sharefile.do")
	    public ModelAndView shareFile(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail")
        String user_mail,@ModelAttribute("dashboardForm")
        DashboardForm dashboardForm, BindingResult result) throws Exception { 
	   		
			 try
			 {		
				 String	 logged_user_mail = user_mail; 
				 String Photourl = dashboardService.GetPhotoUrl(logged_user_mail, request.getServletContext().getRealPath("/"));
				 fileid=dashboardForm.getFile_txt_id();				
				 String file_txt_filename=dashboardForm.getFile_txt_filename();
				 String isfolder=dashboardForm.getFile_txt_isfolder();
				 String strf2path = dashboardForm.getF2path();
				 String strIsExpiry = dashboardForm.getIs_expiry();
				 String strIntCnt =  dashboardForm.getCntInc();
				 String strFileId = dashboardForm.getFolderId();
				 String strFolderName = dashboardForm.getFolderName();
				 String strFolderExpiry = dashboardForm.getFolderExpiry();
			
				 list1.clear();
				 list1 = dashboardService.fileOptions(logged_user_mail,fileid);		
				 String ownerEmaiId=dashboardService.fileOwnerID(fileid);	
				 usersList = dashboardService.getAllUserContacts(user_mail);
			 	
			 			
				 ModelAndView mav=new ModelAndView();
				 mav.addObject("Photourl", Photourl);
				 mav.addObject("ownerEmaiId", ownerEmaiId);
				 mav.addObject("shareFileData",list1);				
				 mav.addObject("file_txt_filename", file_txt_filename);				
				 mav.addObject("fileShareid", fileid);
				 mav.addObject("isfolder", isfolder);
				 mav.addObject("strIntCnt", strIntCnt);
				 mav.addObject("strf2path", strf2path);
				 mav.addObject("strIsExpiry", strIsExpiry);
				 mav.addObject("strFileId", strFileId);
				 mav.addObject("strFolderName", strFolderName);
				 mav.addObject("strFolderExpiry", strFolderExpiry);
				 mav.setViewName("sharefile");			
				 return mav;
			 }
		    catch(Exception e){
		    		logger.debug("Error inside -Display- Share Controller...."+e.toString());
		    		return new ModelAndView("sharefile");
		    }
	   		
	    }
	 	
	 	//Insert File Share Details
	 	@RequestMapping("/sharefile_folder.do")
	    public ModelAndView shareFile_Folder(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail")
        String user_mail,@ModelAttribute("dashboardForm")
        DashboardForm dashboardForm, BindingResult result,final RedirectAttributes redirectAttributes) throws Exception { 	 	
	 		 try
			 {
	 			 String message="";
	 			 logger.debug("--start------sharefile_folder.do-------------------");
	 			 HttpSession session = request.getSession(false);
		 		 if(session == null){
		 			 return new ModelAndView("login");
		 		 }
		 		
				 String	 logged_user_mail = user_mail;					 
				 String strEmailID = dashboardForm.getFile_txt_email();
				 String strDays = dashboardForm.getFile_txt_edays();
				 String strHours = dashboardForm.getFile_txt_ehours();
				 String strMinutes = dashboardForm.getFile_txt_eminuts();			
				 String shareProperties = dashboardForm.getFile_options();	
				 String filename1 = dashboardForm.getFile_txt_name();
				 String strIntCnt = dashboardForm.getCntInc();
				 String strIsExpiry = dashboardForm.getIs_expiry();
				 String strf2path = dashboardForm.getF2path();
				 String strFileId = dashboardForm.getFolderId();
				 String strFolderName = dashboardForm.getFolderName();
				 String strFolderExpiry = dashboardForm.getFolderExpiry();
		
				 if(shareProperties != ""){
					 String[] strs = shareProperties.split(",");
					 for( int i=0;i<strs.length; i++){
			       		 if(strs[i].equals("save")){
			       			 download="1";
			       		 }else if(strs[i].equals("share")){
			       			 share="1";
			       		 }else if(strs[i].equals("print")){
			       			 print="1";
			       		 }
			       	 }
				 }else{
					 download="0";share="0";print="0";
				 }
				 fileid=dashboardForm.getFile_txt_id();	
				
				 String isfolder=dashboardForm.getFile_txt_isfolder();				
				 if(strDays.equals("")){  Days=Integer.parseInt("0"); } else {Days=Integer.parseInt(strDays);}
				 if(strHours.equals("")){Hours=Integer.parseInt("0"); }else {Hours=Integer.parseInt(strHours);} 
				 if(strMinutes.equals("")){Minutes=Integer.parseInt("0"); }else {Minutes=Integer.parseInt(strMinutes);}
		         logger.debug("strDays:"+Days+"||Hours:"+Hours+"||Minutes:"+Minutes);			   
		          
		       	 String[]  reciepEmail=strEmailID.split(";");
		       	 String fileSuccess = "File shared with ";
		       	 String fileFail = "File cannot be shared with ";
		       	 String folderSuccess = "Folder shared with ";
		       	 String folderFail = "Folder cannot be shared with ";		         
		         int counter=0;
		  
			        if(reciepEmail.length>0){
				         for(int i=0;i<reciepEmail.length;i++){
				       	 if(reciepEmail[i].contains("@")){
				       		 if(isfolder.equals("0")){ 
				       			 boolean bool  = dashboardService.shareFile(request,response, logged_user_mail, reciepEmail[i],fileid,Days,Hours,Minutes,download,share,print,isfolder,filename1);
				       			 	if(bool)
				       			 	{				       			 		
				       			 		counter=counter+1;
				       			 		fileSuccess += reciepEmail[i] +" ";
				       			 	}else{
				       			 		 logger.debug("fileFail****"+reciepEmail[i]);				       			 	     
				       			 	     fileFail += reciepEmail[i] +" ";
				       			 		 continue;
				       			 	}
				       		 }else if(isfolder.equals("1")){				 
				       			 	boolean bool = dashboardService.shareFileFolder(request,logged_user_mail, reciepEmail[i],fileid,Days,Hours,Minutes,download,share,print,isfolder,filename1);			 
				       			 		if(bool)
				       			 		{
				       			 			counter=counter+1;
				       			 		    folderSuccess += reciepEmail[i] +" ";
				       			 		}else{
				       			 		    folderFail += reciepEmail[i] +" ";			       			 		  
					       			 		continue;
					       			 	}	
				       		 }
				      	 }else {
				            	String groupName=reciepEmail[i];
				            	List li=dashboardService.groupUsers(request,user_mail,groupName);
				            for(int j=0;j<li.size();j++){
				            	String email=(String) li.get(j);
				                if(isfolder.equals("0")){ 
				                	boolean bool  = dashboardService.shareFile(request,response, logged_user_mail, email,fileid,Days,Hours,Minutes,download,share,print,isfolder,filename1);
				                	if(bool)
			       			 		{
				                		fileSuccess +=  email +" ";
			       			 			counter=counter+1;
			       			 		}else{
			       			 			fileFail +=  email +" ";
			       			 			continue;
			       			 		}	
				                }else if(isfolder.equals("1")){				 
				                	boolean bool = dashboardService.shareFileFolder(request,logged_user_mail,email,fileid,Days,Hours,Minutes,download,share,print,isfolder,filename1);			 
					              	if(bool)
			       			 		{
					              		folderSuccess +=email +" ";
			       			 			counter=counter+1;
			       			 		}else{
			       			 		folderFail += email +" ";	
			       			 			continue;
			       			 		}	
				                }
					   		}
				     	 }
				      
				      }
					}
			        if(strf2path.length()>0){
			        	dashboardForm.setFile_id(fileid);
			        	if(counter>0)
			        		redirectAttributes.addFlashAttribute("counter",  "GreaterThanZero");
			        	else
			        		redirectAttributes.addFlashAttribute("counter",  "LessThanZero");
			        	dashboardForm.setFolderName("");//Need to empty foldername otherwise names printing twice in folder hierarchy
			        	redirectAttributes.addFlashAttribute("dashboardForm",  dashboardForm);
			        	redirectAttributes.addFlashAttribute("fileSuccess",  fileSuccess);
			        	redirectAttributes.addFlashAttribute("folderSuccess",  folderSuccess);
			        	redirectAttributes.addFlashAttribute("fileFail",  fileFail);
			        	redirectAttributes.addFlashAttribute("folderFail",  folderFail);			        	
			        	return new ModelAndView("redirect:openFolder.do"); 			        	
			        }else{
			        if(counter>0)
	   			 	{
			    	   logger.debug("success- "+fileSuccess);
			    	   if(isfolder.equals("0")){ 
			    		    redirectAttributes.addFlashAttribute("message",  fileSuccess);
			    	   }else{		    		   
		   			 		redirectAttributes.addFlashAttribute("message",  folderSuccess);
			    	   }
	   			 	}
	   				else 
	   			 	{	
	   					logger.debug("fail- "+fileFail);
	   					if(isfolder.equals("0")){ 
			    		    redirectAttributes.addFlashAttribute("message1",  fileFail);
			    	   }else{		    		   
		   			 		redirectAttributes.addFlashAttribute("message1",  folderFail);
			    	   }		   					
	   				} 
			     } 
			 }
		 		catch(Exception e){
			    		logger.error(".Error inside (sharefile_folder.do---method) file Controller:"+e.toString());
			    		return new ModelAndView("redirect:dashboard.do");
			    }
		 		return new ModelAndView("redirect:dashboard.do"); 
		 	}
	        		
	 	
	 	// File Share Properties Update
	 	@RequestMapping("/sharefile_prpUpdate.do")
	    public ModelAndView shareFile_Folder_properties(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail")
        String user_mail,@ModelAttribute("shareFileForm") ShareFileForm shareFileForm, BindingResult result,final RedirectAttributes redirectAttributes) throws Exception { 
	 		String message ="";
	 		String error_message = "Update Failed.";
	 	 try
			 {
				 String	 logged_user_mail = user_mail;					 
				 String strEmailID = shareFileForm.getSharedemailid();	
				 String fileID=shareFileForm.getSharedfileid();				
				 String fileExpireDate=shareFileForm.getExpiredate();				
				 String download_upd=shareFileForm.getDownloadprop();				
				 String sharing_upd=shareFileForm.getSharingprop();				 
				 String print_upd=shareFileForm.getPrintprop();				 
				 String dateStr = fileExpireDate;
		         DateFormat readFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");		          
		         DateFormat writeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		         Date date = null;
		         try{
		            date = readFormat.parse( dateStr );
		         }catch ( ParseException e ) {
		             e.printStackTrace();
		         }
		         String formattedDate = "";
		         if( date != null ) {
		        	 formattedDate = writeFormat.format( date );
		         }else{
		        	 
		        	 formattedDate="1969-01-01 00:00:00";
		         }
		         boolean bool  = dashboardService.shareFilePropUpdate(request,logged_user_mail, strEmailID,fileID,formattedDate,download_upd,sharing_upd,print_upd);       
		      if(bool)
		         {
		        	 redirectAttributes.addFlashAttribute("message", "Updated Successfully.");	
		         }
		         else
		         {
		        	 redirectAttributes.addFlashAttribute("message1", "Cannot update.");
		         }
		         
			 } catch(Exception e){
				 logger.error("---shareFile_Folder_properties()-----Error inside Share file Controller...."+e.toString());
		    	 return new ModelAndView("redirect:dashboard.do");
		    }
	 	 return new ModelAndView("redirect:dashboard.do");
	 	
	 	}
	 
}

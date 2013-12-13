package com.verudix.lockit.controller;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.verudix.lockit.service.DashboardService;
import com.verudix.lockit.service.ProfileService;
@Controller
@SessionAttributes({"user_mail"})
public class ProfileController {
	private ProfileService profileService;
	private DashboardService dashboardService;
	String frstname="",lstname="";
	
	String organization="";
	String location="";
	String mail="";
	String mobile="";
	String phone="";
	String display="";
	String name="";
	String value="";
	String photourl="";
	String logged_user_mail="";
	String modifieddate="";
	 String imageName="";
	private Logger logger = Logger.getLogger(ProfileController.class); 
	ArrayList<HashMap<String,Object>> profileList	= new ArrayList<HashMap<String,Object>>();
	boolean status=false;
	
	public void setProfileService(ProfileService profileService) {
        this.profileService = profileService;
        String message1="";
    }
	public void setDashboardService(DashboardService dashboardService) {
        this.dashboardService = dashboardService;
        String message1="";
    }
	// Displaying Profile Details...
	@RequestMapping("/editprofile1.do")	
	public ModelAndView displayProfile(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail") String user_mail) throws Exception{ 
		try{
				 logger.debug("Inside DisplayProfile() of ProfileController.");				 
				 try{
					 profileList.clear();
				 }catch(Exception e){					 
				 }
				 HttpSession session = request.getSession();
				 profileList = profileService.displayProfile(request, user_mail);				 
				 ModelAndView model = new ModelAndView("editprofile1","profileData",profileList);				
				 return model;
		}catch(Exception e){
			 return new ModelAndView("editprofile1");
		}
	 
	}
	
	// Editing & Update Profile Details
	@RequestMapping("/updateprofile.do")
	public ModelAndView updateProfile(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("user_mail") String user_mail,final RedirectAttributes redirectAttributes) throws Exception{ 
		         logger.debug("Inside ProfileController------");	 
	           try{		 
	        	   HttpSession session = request.getSession(true);
	        	   boolean status=false;
	        
	        		String rootpath="",strFileName;
	        		int maxSize =  2 * 1024 * 1024; //equals to 2MB
	        		int filesize = 0;
	     
	        	   List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	        	   for(FileItem item : multiparts){
	        		   if(item.isFormField()){       	
	        			   name = item.getFieldName();
	        			   value    =item.getString();       	         
	        			   if(name.equals("fname"))                    
	        			   {       	
	        				   frstname=value;
	        			   }else if(name.equals("lname"))
	        			   {
	        				   lstname=value;       	
	        			   }else if(name.equals("email"))
	        			   {
	        				   mail=value;       	
	        			   }else if(name.equals("organization"))
	        			   {
	        				   organization=value;       	
	        			   }else if(name.equals("location"))
	        			   {
	        				   location=value;       	
	        			   }else if(name.equals("mobile"))
	        			   {
	        				   mobile=value;       	
	        				   logger.debug("Entered Mobile:"+mobile);       	
	        			   }else if(name.equals("officephone"))
	        			   {
	        				   phone=value;       	
	        			   }else if(name.equals("dname"))
	        			   {
	        				   display=value;
	        				   logger.debug("Entered DisplayName value:"+display);
	        			   }       
	        		   }else{
	        			  
	        			   try{
	          				   imageName = new File(item.getName()).getName();
	               			   String[] imageExtensions = new String[] {  ".bmp", ".gif", ".png", ".jpg", ".jpeg" };
	               			   filesize = (int) item.getSize();
	               			   strFileName = "img_" + Calendar.getInstance().getTimeInMillis() + imageName;
	               			   String Extension = imageName.substring(imageName.lastIndexOf('.')).toLowerCase();
	               		       String ext = Extension.substring(1,Extension.length());
	               			   logger.debug("file Extension.."+Extension);
	               		   	  for(int i=0;i<imageExtensions.length;i++){
	               				   if(imageExtensions[i].equals(Extension))
	               				   {
	               			  		  rootpath =  request.getServletContext().getRealPath("/");
	               					  File dir = new File(rootpath);
	               					  if(!dir.exists()){
	               						  dir.mkdir();
	               					  }
	                       			photourl = dir +File.separator+"Images" + File.separator + strFileName;
	                       			BufferedImage bi = ImageIO.read(item.getInputStream()); 
	                       			Image img = bi.getScaledInstance(60,60,Image.SCALE_SMOOTH);
	                       			int w = img.getWidth(null);
	                       			int h = img.getHeight(null);  
	                       			BufferedImage scaled = new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB);       
	                       			Graphics2D g = scaled.createGraphics();
	                       			g.drawImage(img,0,0,null); 
	                       			if(g != null) g.dispose();
	                       			ImageIO.write(scaled,ext, new File(photourl));
	                       			logger.debug("actual file path"+photourl);
	                       			status = true;
	                       			break; }
	               			   } }catch(Exception e){
	               			   }    }
	              	   }
	        	   			Calendar dateTime=Calendar.getInstance();
	        	   			DateFormat newFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss ");
	        	   			modifieddate=newFormat.format(dateTime.getTime());
	        	   			if(frstname.length()>0 ){
	        	   				if(lstname.length()>0  ){
	        	   					if(display.length()>0 ){ 
	        	   						if(mail.length()>0){
	        	   						 String regEx = "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}\\b";
	        		                	  Pattern p = Pattern.compile(regEx);
	        		                	  Matcher m = p.matcher(mail);
	        		                	  if(m.find()) 
	        		                	  {
	        		                		 
	        		                	  
	       	   		    if(imageName==""){
	        	   		    	String Photourl = dashboardService.GetPhotoUrl(user_mail, request.getServletContext().getRealPath("/"));
	        	   			    String profileDetails=profileService.updateProfile(request,user_mail,frstname,lstname,mail,organization,location,mobile,phone,display,Photourl,modifieddate);
	        	   			    redirectAttributes.addFlashAttribute("message1", " Updated successfully.");//at profile picture not selected...
	        	   			 }else{
	        	   			if(status==true){
	        	   				status=false;
	        	   		        if(maxSize >filesize)
	        	   		        {
	        	   		        	String profileDetails=profileService.updateProfile(request,user_mail,frstname,lstname,mail,organization,location,mobile,phone,display,photourl,modifieddate);
	        	   		        	System.out.println("profileDetails in pc..else"+profileDetails);
	        	   		        	redirectAttributes.addFlashAttribute("message1", "updated successfully.");
	        	   				 }else{
	        	   					 redirectAttributes.addFlashAttribute("message", " ImageSize Greater Than 2mb.");
	        	   			 }
	        	   			}else{
	        	   				redirectAttributes.addFlashAttribute("message", " Image Format Not Supported.");
	        	   			}
	        	   			
	                  }}  else
	        		                	  {
	        		                		  redirectAttributes.addFlashAttribute("message", "Please Enter Valid Email ID.");
	        		                	  }
	        		                	  
	        	   						
	        	   						}else{
	        	   						redirectAttributes.addFlashAttribute("message", "Email id is Mandatory.");
	        	   						}
	        	   					}else{
	        	   					 redirectAttributes.addFlashAttribute("message", "Display Name is Mandatory.");
	        	   					}
	        	   				}else{
	        	   				 redirectAttributes.addFlashAttribute("message", "Last Name is Mandatory.");
	        	   				}}
	        	   			else{
	        	   			 redirectAttributes.addFlashAttribute("message", "First Name is Mandatory.");
	        	   			}
	        	   			return new ModelAndView("redirect:editprofile1.do");
	           	}
	           catch(Exception error)
	           {
	        	   logger.debug("Catch --Profile Controller--");		 
	        	   return new ModelAndView("redirect:editprofile1.do");	
	           }	
		}	
}

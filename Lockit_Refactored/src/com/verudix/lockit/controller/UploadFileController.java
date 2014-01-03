package com.verudix.lockit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.verudix.lockit.service.UploadFileService;
import com.verudix.lockit.form.DashboardForm;
@Controller
public class UploadFileController {
	
	private UploadFileService uploadFileService;
	private Logger logger = Logger.getLogger(UploadFileService.class);
	
	public void setUploadFileService(UploadFileService uploadFileService) {
        this.uploadFileService = uploadFileService;
    }
	
	@RequestMapping("/uploadfile.do")
	public ModelAndView uploadFile(HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes) throws Exception {
		logger.debug("Inside /uploadfile.do--------");
		String strFileResult = uploadFileService.uspInsertAddFile(request,response);
		String f2path = (String)request.getAttribute("strF1path");
		String strFileId = (String)request.getAttribute("strFileId");
		String strFolderName = (String)request.getAttribute("strFolderName");
		String strIsExpiry = (String)request.getAttribute("strIsExpiry");
		String strCntInc = (String)request.getAttribute("strCntInc");
		DashboardForm dash = new DashboardForm();
		dash.setFolderId(strFileId);//dash.setFile_id(strFileId);
		dash.setFolderName(strFolderName);//dash.setFile_name(strFolderName);
		dash.setIs_expiry(strIsExpiry);
		dash.setCntInc(strCntInc);	
		dash.setF2path(f2path);
		
		if(f2path.length() >0){
			redirectAttributes.addFlashAttribute("dashboardForm",dash);	
			redirectAttributes.addFlashAttribute("strFileResult",strFileResult);
			return new ModelAndView("redirect:openFolder.do");
		}
		else{
			if(strFileResult.equals("Success")){
				redirectAttributes.addFlashAttribute("message", "File Uploaded Successfully.");	
			}else if(strFileResult.equals("Failed")){
				 redirectAttributes.addFlashAttribute("error_message", "File Already Exists.");
			 }else if(strFileResult.equals("Format")){
				 redirectAttributes.addFlashAttribute("error_message", "Upload File Supported Formats-[doc, .docx, .txt, .rtf, .xml, .xls, .xlsx, .csv, .ppt, .pptx, .pdf, .sql]");
			 }
			return new ModelAndView("redirect:dashboard.do");
		}
	}
	
	@RequestMapping("/createFolder.do")
 	public ModelAndView createFolder(HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes) throws Exception {
 		 logger.debug("Inside /createFolder.do--------");
 		 String strFolderResult = uploadFileService.createFolder(request,response);
 		 String f2path = (String)request.getAttribute("strF1path");
 		 String strFileId = (String)request.getAttribute("strFileId");
 		 String strFolderName = (String)request.getAttribute("strFolderName");
 		 String strIsExpiry = (String)request.getAttribute("strIsExpiry");
 		 String strCntInc = (String)request.getAttribute("strCntInc");
 		 String errMsg = (String)request.getAttribute("error_message");
 		 DashboardForm dash = new DashboardForm();
 		 dash.setFolderId(strFileId);//dash.setFile_id(strFileId);
 		 dash.setFolderName(strFolderName);//dash.setFile_name(strFolderName);
 		 dash.setIs_expiry(strIsExpiry);
 		 dash.setCntInc(strCntInc);	
 		 dash.setF2path(f2path);
 		 if(f2path.length() >0){
			redirectAttributes.addFlashAttribute("dashboardForm",dash);	
			redirectAttributes.addFlashAttribute("strFolderResult",strFolderResult);
			redirectAttributes.addFlashAttribute("errMsg",errMsg);
			return new ModelAndView("redirect:openFolder.do");
		}else{
			if(strFolderResult.equals("Success")){
				redirectAttributes.addFlashAttribute("message", "Folder Created Successfully.");
			}else if(strFolderResult.equals("Exists")){	
				redirectAttributes.addFlashAttribute("error_message", "Folder Already Exists.");
			}else{
				redirectAttributes.addFlashAttribute("error_message", errMsg); 			 
			}		 		 
		 		return new ModelAndView("redirect:dashboard.do");
			}
		}
}

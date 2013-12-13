package com.verudix.lockit.util;

import java.util.StringTokenizer;

import org.apache.log4j.Logger;

import com.verudix.lockit.controller.LoginController;

public class FileExtractorFromUrl {
	 private static Logger logger = Logger.getLogger(FileExtractorFromUrl.class);
	 static String strFile = "";
	 public static String extractFile(String url){
		String str = "My Files";
		String index = url.substring(url.indexOf(str) + 9, url.length());
		StringTokenizer tzr = new StringTokenizer(index, "/");
		logger.debug("The no.of tokens are---"+tzr.countTokens());
	//	logger.debug("The index of My Files is-----" + index.length());
		//if(index.length()>0){
	//	StringTokenizer tzr = new StringTokenizer(index, "/");		
			while (tzr.hasMoreTokens()) {
			strFile = tzr.nextToken();
		//	logger.debug("The file is---"+strFile);
			break;
			}
		//}else{
	//		logger.debug("No files present");
		//}
		return strFile;
	}
}

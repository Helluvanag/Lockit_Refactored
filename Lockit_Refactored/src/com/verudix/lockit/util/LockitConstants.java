package com.verudix.lockit.util;
import org.apache.log4j.Logger;
public class LockitConstants {
	public static final String RETURN_CODE = "RETURN_CODE";
	public static final String RETURN_MESSAGE = "RETURN_MESSAGE";
	public static final String EMAIL = "EMAIL";
	public static final Object PHOTO_URL = "PHOTO_URL";
	public static String USERNAME = "USERNAME";
	public static String PASSWORD = "PASSWORD";
	public static String RESULT_LIST = "RESULT_LIST";
	public static String selected_option = "All";
	public static String CurrentFolder = "";
	public static String FolderPath = "";
	Logger logger = Logger.getLogger(LockitConstants.class);
	public static String[] supportedFileExtensions = new String[] { ".doc", ".docx", ".txt", ".rtf", ".xml", ".xls", ".xlsx", ".csv", ".ppt", ".pptx", ".pdf", ".sql" };
	
}

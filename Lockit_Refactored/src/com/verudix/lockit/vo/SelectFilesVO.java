package com.verudix.lockit.vo;
import org.apache.log4j.Logger;
public class SelectFilesVO {
	Logger logger = Logger.getLogger(SelectFilesVO.class);
	private String userID;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getFileID() {
		return fileID;
	}
	public void setFileID(int fileID) {
		this.fileID = fileID;
	}
	public int getIsSecure() {
		return isSecure;
	}
	public void setIsSecure(int isSecure) {
		this.isSecure = isSecure;
	}
	public String getOwnerID() {
		return ownerID;
	}
	public void setOwnerID(String ownerID) {
		this.ownerID = ownerID;
	}
	public String getFileImage() {
		return fileImage;
	}
	public void setFileImage(String fileImage) {
		this.fileImage = fileImage;
	}
	public String getPrint() {
		return print;
	}
	public void setPrint(String print) {
		this.print = print;
	}
	public String getDownload() {
		return download;
	}
	public void setDownload(String download) {
		this.download = download;
	}
	public String getSharing() {
		return sharing;
	}
	public void setSharing(String sharing) {
		this.sharing = sharing;
	}
	public String getAnnotate() {
		return annotate;
	}
	public void setAnnotate(String annotate) {
		this.annotate = annotate;
	}
	public String getPrintScreen() {
		return printScreen;
	}
	public void setPrintScreen(String printScreen) {
		this.printScreen = printScreen;
	}
	public String getRedAct() {
		return redAct;
	}
	public void setRedAct(String redAct) {
		this.redAct = redAct;
	}
	public String getIsFolderBool() {
		return isFolderBool;
	}
	public void setIsFolderBool(String isFolderBool) {
		this.isFolderBool = isFolderBool;
	}
	public String getIsfileBool() {
		return isfileBool;
	}
	public void setIsfileBool(String isfileBool) {
		this.isfileBool = isfileBool;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public String getIsExpiry() {
		return isExpiry;
	}
	public void setIsExpiry(String isExpiry) {
		this.isExpiry = isExpiry;
	}
	public String getOrgSharing() {
		return orgSharing;
	}
	public void setOrgSharing(String orgSharing) {
		this.orgSharing = orgSharing;
	}
	public String getIsFolder() {
		return isFolder;
	}
	public void setIsFolder(String isFolder) {
		this.isFolder = isFolder;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getSharedBy() {
		return sharedBy;
	}
	public void setSharedBy(String sharedBy) {
		this.sharedBy = sharedBy;
	}
	public String getCreatedDt() {
		return createdDt;
	}
	public void setCreatedDt(String createdDt) {
		this.createdDt = createdDt;
	}
	public String getSharedDateTime() {
		return sharedDateTime;
	}
	public void setSharedDateTime(String sharedDateTime) {
		this.sharedDateTime = sharedDateTime;
	}
	public String getExpiredDateTime() {
		return expiredDateTime;
	}
	public void setExpiredDateTime(String expiredDateTime) {
		this.expiredDateTime = expiredDateTime;
	}
	public String getViewStatus() {
		return viewStatus;
	}
	public void setViewStatus(String viewStatus) {
		this.viewStatus = viewStatus;
	}
	private String fileName;
	private String filePath;
	private String location;
	private int fileID;
	private int isSecure;
	private String ownerID;
	private String fileImage; //Need to check datatype
	private String print;
	private String download;
	private String sharing;
	private String annotate;
	private String printScreen;
	private String redAct;
	private String isFolderBool;
	private String isfileBool;
	private String isDelete;
	private String isExpiry;
	private String orgSharing;
	private String isFolder;
	private String owner;
	private String sharedBy;
	private String createdDt;
	private String sharedDateTime;
	private String expiredDateTime;
	private String viewStatus;
}

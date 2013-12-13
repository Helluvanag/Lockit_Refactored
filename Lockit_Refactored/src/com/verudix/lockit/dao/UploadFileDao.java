package com.verudix.lockit.dao;

import java.sql.SQLException;

public interface UploadFileDao {

	public int  usp_Insert_AddFile(String name, String uploaded_date, String u_mail,
			String replace, String u_mail2, String u_mail3, int i,
			String sharedTime, String expiredTime, int j, int k, int l, int m,
			int n, int o, String u_mail4, String uploaded_date2, String isSecure) throws SQLException;

}

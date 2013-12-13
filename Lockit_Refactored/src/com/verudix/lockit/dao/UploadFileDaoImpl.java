package com.verudix.lockit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.sql.DataSource;
import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.datasource.DataSourceUtils;

public class UploadFileDaoImpl implements  UploadFileDao {
	Logger logger = Logger.getLogger(UploadFileDaoImpl.class);
	@SuppressWarnings("unused")
	private DataSource dataSource;
	private JdbcTemplate	jdbcTemplate = null;
	ArrayList<HashMap<String,Object>> list	= new ArrayList<HashMap<String,Object>>();
	public void setDataSource(DataSource dataSource) {
		if(dataSource!=null){
		this.dataSource = (DataSource) dataSource;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		}
	}
	
	
	public int  usp_Insert_AddFile(String name, String uploaded_date, String u_mail,
			String replace, String u_mail2, String u_mail3, int i,
			String sharedTime, String expiredTime, int j, int k, int l, int m,
			int n, int o, String u_mail4, String uploaded_date2, String isSecure) throws SQLException{
		int intCount = 0;
		Connection	con = null;
		CallableStatement 	cs = null	;	
		ResultSet 			rs = null	;	
		try{			
			
			con = DataSourceUtils.getConnection(dataSource);
			cs = con.prepareCall("{call usp_Insert_AddFile('" + name + "','" + uploaded_date + "','" + u_mail + "','"+replace+"','"+u_mail2+"','"+u_mail3+"',"+i+",'"+sharedTime+"','"+expiredTime+"',"+j+","+k+","+l+","+m+","+n+","+o+",'"+u_mail4+"','"+uploaded_date2+"','"+isSecure+"')}");
			logger.debug("Inside usp_Insert_AddFile() : "+cs);
			cs.execute();
			rs = cs.getResultSet();
			while(rs.next()){
				intCount = Integer.parseInt(rs.getString(1));
			}	
		}catch(Exception e){
			e.getMessage();
		}finally{
			rs.close();
			cs.close();
			con.close();
		}
		logger.debug("The upsinsertaddfile is returning : "+intCount);
		return intCount;
	}

}

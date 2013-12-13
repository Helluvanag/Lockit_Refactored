package com.verudix.lockit.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.RowMapper;

import com.verudix.lockit.vo.RegistrationVO;
import com.verudix.lockit.vo.SelectFilesVO;

public class SelectFilesRowMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int index) throws SQLException {
		SelectFilesVO selectFilesVO = new SelectFilesVO();
        //String strPhotoUrl = StringUtils.trimToEmpty(rs.getString(1));
        //selectFilesVO.setPhotoUrl(strPhotoUrl);
		/*while (rs.next()) {
			
			 String User_ID = rs.getString("UserID");
			 String File_Name = rs.getString("FileName");
			 String File_Path = rs.getString("FilePath");
			 File_Path = File_Path.replace("\\", "/");			
			 String isfolder = rs.getString("IsFolder");
			 String File_Id = rs.getString("FileID");
			 String image_path = rs.getString("fileImage");
			 String IsSecure = rs.getString("IsSecure");
			 image_path = image_path.substring(2,image_path.length());
		
			
			rootpath = rootpath.replace("\\", "/");
			
			//System.out.println("rootpath..."+rootpath+"\n");
			//System.out.println("File_Path..."+File_Path+"\n");
			
			if(File_Path.equals(rootpath)){

			 HashMap<String, Object> item = new  HashMap<String, Object>();
				
			 item.put("UserID",User_ID);  
			 item.put("FileName",File_Name);  
			 item.put("FilePath",File_Path);  
			 item.put("IsFolder",isfolder);  
			 item.put("FileID",File_Id); 
			 item.put("fileImage",image_path); 
			 item.put("IsSecure",IsSecure); 
			 list.add(item);	 
			}
		}*/
        return selectFilesVO;
	}

}

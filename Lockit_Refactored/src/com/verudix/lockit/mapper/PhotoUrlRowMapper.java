package com.verudix.lockit.mapper;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.RowMapper;

import com.verudix.lockit.vo.LoginVO;
import com.verudix.lockit.vo.RegistrationVO;
public class PhotoUrlRowMapper implements RowMapper{
	/**
     * Maps the result set rows to a Claim object
     */
    public Object mapRow(ResultSet rs, int index) throws SQLException {
    	RegistrationVO registrationVO = new RegistrationVO();
        String strPhotoUrl = StringUtils.trimToEmpty(rs.getString(1));
        registrationVO.setPhotoUrl(strPhotoUrl);
        return registrationVO;
    }
}

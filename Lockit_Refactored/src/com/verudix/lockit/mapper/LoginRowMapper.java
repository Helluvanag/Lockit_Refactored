package com.verudix.lockit.mapper;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.RowMapper;

import com.verudix.lockit.vo.LoginVO;
 
/**
 * This class is used to convert ResultSet records to Domain Objects The class
 * is invoked for each Row in the ResultSet. It implements the Spring RowMapper interface
 */
public class LoginRowMapper implements RowMapper {
 
    /**
     * Maps the result set rows to a Claim object
     */
    public Object mapRow(ResultSet rs, int index) throws SQLException {
    	LoginVO loginVO = new LoginVO();
        String strUser = StringUtils.trimToEmpty(rs.getString(1));
        loginVO.setUsername(strUser);
 
       /* String strPass = StringUtils.trimToEmpty(rs.getString(2));
        loginVO.setPassword(strPass);*/
 
        return loginVO;
    }
}


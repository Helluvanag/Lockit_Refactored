package com.verudix.lockit.procedure;
import java.sql.Types;
import java.util.HashMap;
import java.util.Map;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.jdbc.object.StoredProcedure;

import com.verudix.lockit.mapper.LoginRowMapper;
import com.verudix.lockit.mapper.SelectFilesRowMapper;
import com.verudix.lockit.util.LockitConstants;
public class SelectFilesSP extends StoredProcedure {
	 
    /**
     * Constructor for this StoredProcedure class.
     */
    public SelectFilesSP(JdbcTemplate jdbcTemplate) {
        super(jdbcTemplate, "usp_select_files");
 
        // Parameters should be declared in same order here that
        // they are declared in the stored procedure.
        //
        // Note: resultSet must be defined first!
        //
        // define params with syntax:  param_name, param_type
        //
        RowMapper rowMapper = new SelectFilesRowMapper();
        declareParameter(new SqlReturnResultSet(LockitConstants.RESULT_LIST,rowMapper));
        declareParameter(new SqlParameter(LockitConstants.EMAIL,Types.VARCHAR));
      
        compile();
    }
 
    /**
     * Execute stored procedure.
     *
     * @return Results of running stored procedure.
     */
    public Map uspSelectFiles(String email) {
 
        // set the input params
        Map inParameters = new HashMap();
        inParameters.put(LockitConstants.EMAIL, email);
              	 
        // now execute
        Map out = execute(inParameters); // Call on parent class
        System.out.println("The Result is -----"+out.toString());
        return out;
    }
 
}
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
import com.verudix.lockit.util.LockitConstants;
	 
	/**
	 * An access class for the Cars stored procedures.
	 * This interface expects the following args for the store procedures
	 *
	 * <ul>
	 * <li> arg1 (in): username
	 * <li> arg2 (in): password
	 *
	 * <li> arg5 (out): return code
	 * <li> arg6 (out): return message
	 * </ul>
	 *
	 * </pre>
	 *
	 */
	public class CheckLoginSP extends StoredProcedure {
	 
	    /**
	     * Constructor for this StoredProcedure class.
	     */
	    public CheckLoginSP(JdbcTemplate jdbcTemplate) {
	        super(jdbcTemplate, "usp_Check_Login");
	 
	        // Parameters should be declared in same order here that
	        // they are declared in the stored procedure.
	        //
	        // Note: resultSet must be defined first!
	        //
	        // define params with syntax:  param_name, param_type
	        //
	        RowMapper rowMapper = new LoginRowMapper();
	        declareParameter(new SqlReturnResultSet(LockitConstants.RESULT_LIST,rowMapper));
	        declareParameter(new SqlParameter(LockitConstants.USERNAME,Types.VARCHAR));
	        declareParameter(new SqlParameter(LockitConstants.PASSWORD,Types.VARCHAR));
	     //   declareParameter(new SqlOutParameter(LockitConstants.RETURN_CODE,Types.INTEGER));
	     //   declareParameter(new SqlOutParameter(LockitConstants.RETURN_MESSAGE,Types.VARCHAR));
	        // now compile stored proc
	        compile();
	    }
	 
	    /**
	     * Execute stored procedure.
	     *
	     * @return Results of running stored procedure.
	     */
	    public Map uspCheckLogin(String username, String password) {
	 
	        // set the input params
	        Map inParameters = new HashMap();
	        inParameters.put(LockitConstants.USERNAME, username);
	        inParameters.put(LockitConstants.PASSWORD, password);
	       	 
	        // now execute
	        Map out = execute(inParameters); // Call on parent class
	        System.out.println("The Result is -----"+out.toString());
	        return out;
	    }
	 
	}


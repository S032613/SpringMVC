package springmvc.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springmvc.beans.Registration;


public class RegistationBeanMapper implements RowMapper<Registration >  {
	
	 public  Registration mapRow(ResultSet rs,int rowNum) throws SQLException {
		
		 
		 Registration register = new Registration();    
	
		 register.setName(rs.getString("name"));
		 register.setEmail(rs.getString("email"));
		 register.setPhone(rs.getString("phone"));
		 register.setCity(rs.getString("city"));
		
	     return register;
}
}

package springmvc.Repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import springmvc.Mapper.RegistationBeanMapper;
import springmvc.beans.Registration;

@Repository
public class RegistrationRepository {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public boolean insertRSF(Registration rgs) {
        Object[] param = {rgs.getName(), rgs.getEmail(), rgs.getPhone(), rgs.getCity()};
        String sql = "INSERT INTO user(name,email,phone,city) VALUES (?,?,?,?)";
        return jdbcTemplate.update(sql, param) > 0 ? true : false;
    }
	
	  public List<Registration> getAllData(Registration register) {
	  
	  String query = "SELECT name,email,phone,city FROM user";
	  
	 return jdbcTemplate.query(query, new RegistationBeanMapper()); 
	 
	  }

		public List<Registration> editrecords(Registration register) {
			// TODO Auto-generated method stub
			String query = "UPDATE user FROM user SET id = 00";
			return jdbcTemplate.query(query, new RegistationBeanMapper());
		}

		
		
		public List<Registration> deleterecords(Registration register) {
			
			String query = "DELETE FROM user WHERE id";
			return jdbcTemplate.query(query, new RegistationBeanMapper());
	
		}

	
	


}


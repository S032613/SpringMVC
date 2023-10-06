package springmvc.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springmvc.Repository.RegistrationRepository;
import springmvc.beans.Registration;

@Service
public class RegistrationService {

	@Autowired
	
	RegistrationRepository registrationRepository;
	
	public void insertRSF(Registration rgs) {
		
		registrationRepository.insertRSF(rgs);
	}

	public List<Registration> getAllData(Registration register)
	{
		return registrationRepository.getAllData(register);
	}

	
	
	public List<Registration> editData(Registration register) {
		// TODO Auto-generated method stub
		return registrationRepository.editrecords(register);
	}

	public List<Registration> deleteData(Registration register) {
		// TODO Auto-generated method stub
		return registrationRepository.deleterecords(register);
	}



}

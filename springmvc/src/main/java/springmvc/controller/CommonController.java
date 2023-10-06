package springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import springmvc.Service.RegistrationService;
import springmvc.beans.Registration;

@Controller
public class CommonController {
	@Autowired
	RegistrationService registrationService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String returnRgsForm() {
		return "resistration";
		
	}
	
	@RequestMapping(value = "/insertexceldata", method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
	
	public @ResponseBody String postInsert(@RequestBody Registration rgs) 
	{
		registrationService.insertRSF(rgs);
		return" inserted your data successfully";
	}
	
	 @RequestMapping(value = "/showdetails", method = RequestMethod.GET)
     
	 public @ResponseBody List<Registration> allData(HttpServletRequest request ,Registration register)
	 {
		 
		return registrationService.getAllData(register);
	 }
	 
	  @RequestMapping(value="/editrecords", method = RequestMethod.PUT)    
	    public @ResponseBody List<Registration> edit(@PathVariable int id, HttpServletRequest request ,Registration register)
	  { 
		 return registrationService.editData(register);
	    }    
	 
		
	  @RequestMapping(value="/deletedetails",method = RequestMethod.DELETE)    
	    public @ResponseBody List<Registration> delete(@PathVariable int id,HttpServletRequest request ,Registration register){    
	        
	        return registrationService.deleteData(register);    
	    }     

		 
      
		 
	
	 
	
}

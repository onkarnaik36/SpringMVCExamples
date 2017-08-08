package com.jwt.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.jwt.model.Employee;
import com.jwt.service.EmployeeService;

@Controller
public class EmployeeController {

	private static final Logger logger = Logger
			.getLogger(EmployeeController.class);

	public EmployeeController() {
		System.out.println("EmployeeController()");
	}

	@Autowired
	private EmployeeService employeeService;

	/*@RequestMapping("/listUsers")
	public @ResponseBody List<Employee> listEmployee() {  
	  List<Employee> studentList = new ArrayList<Employee>();  
	  studentList=employeeService.getAllEmployees() ;
	  return studentList;  
	 }  */
	@RequestMapping("/listUsers")
	public void  listEmployee(HttpServletRequest request, HttpServletResponse response) {  
		try
		{
		List<Employee> employeeList=new ArrayList<Employee>();
		employeeList=employeeService.getAllEmployees() ;
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(employeeList, new TypeToken<List<Employee>>() {}.getType());
		JsonArray jsonArray = element.getAsJsonArray();
		response.setContentType("application/json");
		response.getWriter().print(jsonArray);
		}
		catch(Exception e)
		{
			
		}
	}
	  
	@RequestMapping(value = "/list")
	public ModelAndView home(ModelAndView model) throws IOException {
		model.addObject("employee", new Employee());
		model.setViewName("home");
		return model;
	}

	@RequestMapping(value = "/newEmployee", method = RequestMethod.GET)
	public ModelAndView newContact(ModelAndView model) {
		Employee employee = new Employee();
		model.addObject("employee", employee);
		model.setViewName("EmployeeForm");
		return model;
	}

	@RequestMapping(value = "/saveEmployee", method = RequestMethod.POST)
	public void saveEmployee(@ModelAttribute Employee employee,HttpServletRequest request, HttpServletResponse response) {
		try
		{
		if (employee.getId() == 0) { 
			employeeService.addEmployee(employee);
		}
		}
		catch(Exception e)
		{
			
		}
	}
	@RequestMapping(value = "/editEmployee", method = RequestMethod.POST)
	public void editEmployee(@ModelAttribute Employee employee,HttpServletRequest request, HttpServletResponse response) {
		try
		{
		employeeService.updateEmployee(employee);
		}
		catch(Exception e)
		{
			
		}
	}
	

	@RequestMapping(value = "/deleteEmployee", method = RequestMethod.GET)
	public void deleteEmployee(HttpServletRequest request,HttpServletResponse response) {
		try
		{
		int employeeId = Integer.parseInt(request.getParameter("id"));
		employeeService.deleteEmployee(employeeId);
		response.setContentType("text/html");
		response.getWriter().print(1);
		}
		catch(Exception e)
		{
			
		}
		}

	@RequestMapping(value = "/editEmployee", method = RequestMethod.GET)
	public @ResponseBody Employee editContact(HttpServletRequest request,ModelAndView model) {
		int employeeId = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeService.getEmployee(employeeId);
		model.addObject("employee", employee);
		return employee;
	}

}
package com.mythri.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mythri.dao.EmployeeDao;
import com.mythri.dao.LoginDAO;
import com.mythri.dto.CreateEmpDetails;
import com.mythri.dto.EmployeeRequest;
import com.mythri.dto.ResponseDTO;
import com.mythri.entity.Address;
import com.mythri.entity.Employee;
import com.mythri.entity.Login;
import com.mythri.util.ErrorCodes;
import com.mythri.util.UserException;

@Service("employeeService")
@Transactional
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	private EmployeeDao employeeDao;
	
	@Autowired
	private LoginDAO loginDAO;
	
	@Transactional
	public Employee addEmployee(Employee employee) throws UserException {
		if(employeeDao.isEmployeeExists(employee.getLoginName()))
			throw new UserException(ErrorCodes.ERROR2.getErrorCode(), ErrorCodes.ERROR2.getDesc());
		employee.setJoinDate(new Date());
		//mapEmployeeWithAddress(employee);
		Login login = getLogin(employee);
		employee.setLogin(login);
		return employeeDao.addEmployee(employee);
	}

	private Login getLogin(Employee employee) {
		Login login = employee.getLogin();
		login.setAttempts(0);
		login.setType(0);
		return login;
	}

	private void mapEmployeeWithAddress(Employee employee) {
		List<Address> addresses = employee.getAddresses();
		if(addresses!=null){
			for(Address address:addresses){
				address.setEmployee(employee);
			}
		}
	}

	@Override 
	@Transactional
	public ResponseDTO<Employee> getEmployees(int pageNo) {
		return employeeDao.getEmployees(pageNo);
	}

	@Override 
	@Transactional
	public Employee getValidEmpByAuth(Employee employee) throws UserException{
		//valid user
		Integer  empId = employeeDao.isValidLoginName(employee.getLoginName());
		if(empId==null || empId==0) {
			throw new UserException(ErrorCodes.ERROR7.getErrorCode(), ErrorCodes.ERROR7.getDesc());
		}
		Employee validUser = employeeDao.getValidEmpByAuth(employee);

		//valid userName , invalid creds.
		if(validUser==null) {
			//update the attempts +1 
			loginDAO.updateAttempts(empId);
			throw new UserException(ErrorCodes.ERROR7.getErrorCode(), ErrorCodes.ERROR7.getDesc());
		}
		
		Login loginDetails = loginDAO.getLoginDetails(validUser.getId());
		if(loginDetails!=null && loginDetails.getAttempts()>=5) {
			throw new UserException(ErrorCodes.ERROR5.getErrorCode(), ErrorCodes.ERROR5.getDesc());
		}
		
		if(loginDetails!=null && loginDetails.getStatus()!= null && loginDetails.getStatus()!=1) {
			throw new UserException(ErrorCodes.ERROR6.getErrorCode(), ErrorCodes.ERROR6.getDesc());
		}
		loginDAO.resetAttempts(empId);
		return validUser;
	}

	@Transactional
	public Employee getEmpById(int id) {
		return employeeDao.getEmployee(id);
	}

	@Override 
	@Transactional
	public void deleteEmployee(Employee employee) {
		employeeDao.deleteEmployee(employee);
	}

	@Override 
	@Transactional
	public Employee getEmpByName(String name) {
		return employeeDao.getEmployeeByName(name);
	}

	@Override 
	@Transactional
	public Employee updateEmployee(Employee employee) throws UserException {
		if(!employeeDao.isEmployeeExists(employee.getLoginName()))
			throw new UserException(ErrorCodes.ERROR3.getErrorCode(), ErrorCodes.ERROR3.getDesc());
		mapEmployeeWithAddress(employee);
		return employeeDao.updateEmployee(employee);
	}

	@Override
	public ResponseDTO<Employee> getFilteredEmployees(EmployeeRequest employeeReq) {
		return employeeDao.getAdvancedSearchResult(employeeReq);
	}

	@Override
	public ResponseDTO<Employee> getAllEmps(String sortBy) {
		return employeeDao.getAllEmps(sortBy);
	}

	@Override
	public CreateEmpDetails getManagerAndDepts() {
		return employeeDao.getManagerAndDepts();
	}

	@Override
	public List<Employee> getBasicEmpDetails() {
		return employeeDao.getBasicEmpDetails();
	}
	
	@Override
	public boolean changePwd(Employee employee,String oldPass, String newPass){
		if(!employee.getPassword().equals(oldPass)){
			return false;
		}
		employeeDao.updatePwd(employee.getId(),newPass);
		return true;
	}

	@Override
	public ResponseDTO<Employee> getAllSubordinates(Integer managerId) {
		return employeeDao.getAllSubordinates(managerId);
	}
}
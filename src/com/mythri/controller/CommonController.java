package com.mythri.controller;

import static com.mythri.util.Constants.COMMAND;
import static com.mythri.util.Constants.INDEX;
import static com.mythri.util.Constants.LOGIN;
import static com.mythri.util.Constants.LOGOUT;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mythri.entity.Employee;
import com.mythri.service.EmployeeService;
import com.mythri.util.UserException;

@Controller
public class CommonController {
	
	private static final String EMP_SESSION = "empSession";
	@Autowired
	private EmployeeService employeeService;

	@RequestMapping(value = INDEX, method = RequestMethod.GET)
	public ModelAndView welcome() {
		return new ModelAndView("index");
	}

	@RequestMapping(value = LOGIN, method = RequestMethod.GET)
	public String loginForm() {
		return "login";
	}

	@RequestMapping(value = "changePwd", method = RequestMethod.GET)
	public String changePwdScreen() {
		return "changePwd";
	}
	
	@RequestMapping(value = "changePwd", method = RequestMethod.POST)
	public ModelAndView changePwd(HttpSession session,
			@RequestParam("currPass") String oldPass,
			@RequestParam("newPass") String newPass) {
		Employee employee = (Employee) session.getAttribute(EMP_SESSION);
		boolean changePwd = employeeService.changePwd(employee, oldPass, newPass);
		String msg = "Invalid Old password";
		if (changePwd) {
			msg = "Password update successful.";
		}
		return new ModelAndView("changePwd", "msg", msg);
	}
	
	@RequestMapping(value = LOGIN, method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute(COMMAND) Employee employee,
			BindingResult result, HttpSession session) {
		try {
			Employee validUser = employeeService.getValidEmpByAuth(employee);
			session.setAttribute(EMP_SESSION, validUser);
			ModelAndView modelAndView = new ModelAndView("empProfile", "employee", validUser);
			modelAndView.addObject("addresses", validUser.getAddresses());
			return modelAndView;
		} catch (UserException e) {
			String msg = e.getMessage();
			ModelAndView modelAndView = new ModelAndView("login", COMMAND, employee);
			modelAndView.addObject("msg", msg);
			return modelAndView;
		}
	}

	@RequestMapping(LOGOUT)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute(EMP_SESSION);
		session.invalidate();
		return "login";
	}
}

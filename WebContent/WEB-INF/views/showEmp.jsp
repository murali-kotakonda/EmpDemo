<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Search Employee By Name</title>
</head>
<body>
<h3>Search Result</h3>
	<a href="empUpdate?id=${employee.id}"><label id="updateProfile">Update Profile</label></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="empDelete?id=${employee.id}"><label id="deleteLbl">Delete Profile</label></a>
 <br/><br/><br/>
	<table align="left" border="1" width="35%">
		<tr>
			<td><label id="idLbl">ID</label></td>
			 <td> ${employee.id}</td>
		</tr>
		
		<tr>
			<td><label id="desigLbl">Designation</label></td> <td> ${employee.designation}</td>
		</tr>
		
		<tr>
			<td><label id="fNameLbl">First Name</label></td> <td> ${employee.fName}</td>
		</tr>
		
		<tr>
			<td><label id="lNameLbl">Last Name</label></td> <td> ${employee.lName}</td>
		</tr>
		
		<tr>
			<td><label id="genderLbl">Gender</label></td> <td> ${employee.gender}</td>
		</tr>		
		
		<tr>
			<td><label id="deptNameLbl">Department Name:</label></td> <td> ${employee.deptName}</td>
		</tr>
		
		<tr>
			<td><label id="managerLbl">Manager Name:</label></td> <td> ${employee.manager.fName} , ${employee.manager.lName}</td>
		</tr>
		
		<tr>
			<td><label id="loginNameLbl">Login Name</label> </td> <td> ${employee.loginName}</td>
		</tr>
		
		<tr>
			<td><label id="dobLbl">Date of Birth</label></td> <td> ${employee.dateOfBirth}</td>
		</tr>
		
		<tr>
			<td><label id="dojLbl">Date Of Join</label></td> <td> ${employee.joinDate}</td>
		</tr>
		
		<tr>
			<td><label id="mnoLbl">Mobile No:</label></td> <td> ${employee.mobileNo}</td>
		</tr>	
		
		<tr>
			<td><label id="maritalStatusLbl">Marital Status:</label></td> <td> ${employee.maritalStatus}</td>
		</tr>	
		
		<tr>
			<td><label id="statusLbl">Status:</label></td>
			 <td> ${employee.login.status eq 1?'Active' :'Inactive'}</td>
		</tr>
 	</table>
		
</body>
</html>
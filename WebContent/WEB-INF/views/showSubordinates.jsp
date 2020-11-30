<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Subordinates</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<br/><br/>
<c:if test="${empty emps}">
No Employees assigned so far..
</c:if>

<c:if test="${!empty emps}">
  	<table class="table-bordered table pull-right" align="left" border="1">
		<thead>
 		<tr role="row">
			<th><label id="idLbl">ID</label></th>
			<th><label id="fNameLbl">First Name</label></th>
			<th><label id="lNameLbl">Last Name</label></th>
			<th><label id="desigLbl">Designation</label></th>
			<th><label id="genderLbl">Gender</label></th>
			<th><label id="deptLbl">Department</label></th>
			<th><label id="joinDateLbl">Join Date</label></th>
			<th><label id="mnoLbl">Mobile No</label></th>
			<th><label id="statusLbl">Status</label></th>
			
		</tr>
	</thead>

	<tbody>
		<c:forEach items="${emps}" var="employee">
			<tr>
				<td> ${employee.id}</td>
				<td> ${employee.fName}</td>
				<td> ${employee.lName}</td>
				<td> ${employee.designation}</td>
				<td> ${employee.gender}</td>
				<td> ${employee.deptName}</td>
				<td> ${employee.joinDate}</td>
				<td> ${employee.mobileNo}</td>
  			   <td> ${employee.login.status eq 1?'Active' :'Inactive'}</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	</c:if>
</body>
</html>
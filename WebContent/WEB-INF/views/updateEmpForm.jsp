<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript">
	function check() {
	
	 var loginName = document.forms["empUpdate"]["loginName"];
	 var fName = document.forms["empUpdate"]["fName"];
	 var mobileNo = document.forms["empUpdate"]["mobileNo"];
	 var salary = document.forms["empUpdate"]["salary"];
	 
	 if(loginName.value == "" ){
		 alert( "Please provide loginName!" );
		 loginName.focus() ;
	     return false;
	 }
	 
	 if(fName.value == "" ){
		 alert( "Please provide first Name!" );
		 fName.focus() ;
	     return false;
	 }
	 
	 if(mobileNo.value == "" ){
		 alert( "Please provide mobile Number!" );
		 mobileNo.focus() ;
	     return false;
	 }
	 if(mobileNo.value.length != 10){
		 alert( "mobileNo has to be minimum 10 digits!" );
		 mobileNo.focus() ;
	     return false;
	 }
	 
	 if(salary.value == "" ){
		 alert( "Please provide Salary!" );
		 salary.focus() ;
	     return false;
	 }
	 return true;
}

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
</script>
<title>Update Employee Form</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<h3>Updating Profile Screen</h3>
	${errorMsg}
	<form:form action="empUpdate" method="POST" commandName="command" onsubmit="return check();">
		<table>
		<tr>
			<td><label id="IdLbl">ID</label></td> 
			<td> 
					<form:input path="id" readonly="true"/>
					<form:hidden path="loginName"/>
			</td>
		</tr>
		
		<tr>
			<td><label id="desigLbl">Designation</label></td> <td> ${command.designation}</td>
		</tr>
			
		<tr>
			<td><label id="fNameLbl">First Name</label></td> <td> <form:input path="fName" /></td>
		</tr>
		
		<tr>
			<td><label id="lNameLbl">Last Name</label></td> <td> <form:input path="lName" /></td>
		</tr>
		
		<tr>
			<td><label id="dobLbl">Date of Birth</label></td> <td> <form:input path="dateOfBirth" /></td>
		</tr>
		
		<tr>
			<td><label id="dojLbl">Date Of Join</label></td> <td> <form:input path="joinDate" readonly="true"/></td>
		</tr>	
		
		<tr>
			<td><label id="mnoLbl">Mobile No:</label></td> 
			<td> <form:input path="mobileNo" onkeypress="return isNumber(event)"/></td>
		</tr>	
		
		<tr>
			<td><label id="statusLbl">Status:</label></td> 
			<td>  <form:select path="login.status">
				        <form:option value="1">Active</form:option>
				        <form:option value="0">Inactive</form:option>
 				</form:select></td>
		</tr>	
		
		<tr>
			<td><label id="mStatusLbl">Marital Status:</label></td> 
			<td>
			   <form:select path="maritalStatus">
				        <form:option value="single">Single</form:option>
				        <form:option value="divorsed">Divorsed</form:option>
				        <form:option value="married">Married</form:option>
 				</form:select>
			 </td>
		</tr>
			   
					<c:forEach var="i" begin="0" end="1">
	   			<tr><td>
		   			<c:if test="${i eq 0}">
		   				<h3><label id="presentAddrLbl">Present Address :</label></h3>
		   			</c:if>
		   			
		   			<c:if test="${i eq 1}">
		   				<h3><label id="permAddrLbl">Permanent Address :</label></h3>
		   			</c:if>
		   			
	   			</td>
	   			</tr>
			   
			     <tr>
			        <td><label id="addr1Lbl${i}">Address Line 1:</label> </td>
			        <td><input type="text" name="addresses[${i}].addrLine1"  
			        value='<c:out value="${addresses[i].addrLine1}"/>'/></td>
			    </tr>
			     
			     <tr>
			        <td><label id="addr2Lbl${i}">Address Line 2:</label> </td>
			        <td><input type="text" name="addresses[${i}].addrLine2" 
			        value='<c:out value="${addresses[i].addrLine2}"/>' /></td>
			    </tr>
			    
			    <tr>
			        <td><label id="cityLbl${i}">City:</label> </td>
			        <td><input type="text" name="addresses[${i}].city" 
			        value='<c:out value="${addresses[i].city}"/>' /></td>
			    </tr>
			    
			    <tr>
			        <td><label id="stateLbl${i}">State:</label> </td>
			        <td><input type="text" name="addresses[${i}].state" 
			        value='<c:out value="${addresses[i].state}"/>' /></td>
			    </tr>
			    
			    <tr>
			        <td><label id="countryLbl${i}">Country:</label> </td>
			        <td><input type="text" name="addresses[${i}].country" 
			        value='<c:out value="${addresses[i].country}"/>' /></td>
			    </tr>
			    
			    <tr>
			        <td><label id="pinLbl${i}">Pin Code:</label> </td>
			        <td><input type="text"  name="addresses[${i}].pin" 
			        value='<c:out value="${addresses[i].pin}"/>' />
			        <input type="hidden" name="addresses[${i}].addressType" value= "${i +1}"/>
			        <input type="hidden" name="addresses[${i}].id" value= "addresses[${i}].id"/>
			        
			        </td>
			    </tr>
			    
			</c:forEach>
				<tr>
				<td colspan="2"><input type="submit" value="Update" /></td>
			</tr>
		
		</table>
	</form:form>
</body>
</html>
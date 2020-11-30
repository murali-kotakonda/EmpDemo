<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title>Add Employee</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	</head>
	<script type="text/javascript">

	function check() {
	
	 var loginName = document.forms["empCreate"]["loginName"];
	 var password = document.forms["empCreate"]["password"] ;
	 var fName = document.forms["empCreate"]["fName"];
	 var mobileNo = document.forms["empCreate"]["mobileNo"];
	 var salary = document.forms["empCreate"]["salary"];
	 
	 if(loginName.value == "" ){
		 alert( "Please provide loginName!" );
		 loginName.focus() ;
	     return false;
	 }
	 
	 if(password.value == "" ){
		 alert( "Please provide Password!" );
		 password.focus() ;
	     return false;
	 }
	 
	 if(password.value.length <= 5 || password.value.length >=10){
		 alert( "password has to be minimum 5 chars and max 10 chars!" );
		 password.focus() ;
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
	 
	 var inputText = document.forms["empCreate"]["dateOfBirth"];
	 var dateformat = /^(0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])[\/\-]\d{4}$/;
	  // Match the date format through regular expression
	  if(inputText.value.match(dateformat))
	  {
		 inputText.focus();
	  //Test which seperator is used '/' or '-'
	  var opera1 = inputText.value.split('/');
	  var opera2 = inputText.value.split('-');
	  lopera1 = opera1.length;
	  lopera2 = opera2.length;
	  // Extract the string into month, date and year
	  if (lopera1>1)
	  {
	  var pdate = inputText.value.split('/');
	  }
	  else if (lopera2>1)
	  {
	  var pdate = inputText.value.split('-');
	  }
	  var mm  = parseInt(pdate[0]);
	  var dd = parseInt(pdate[1]);
	  var yy = parseInt(pdate[2]);
	  // Create list of days of a month [assume there is no leap year by default]
	  var ListofDays = [31,28,31,30,31,30,31,31,30,31,30,31];
	  if (mm==1 || mm>2)
	  {
	  if (dd>ListofDays[mm-1])
	  {
	  alert('Invalid date format!');
	  inputText.focus();
	  return false;
	  }
	  }
	  if (mm==2)
	  {
	  var lyear = false;
	  if ( (!(yy % 4) && yy % 100) || !(yy % 400)) 
	  {
	  lyear = true;
	  }
	  if ((lyear==false) && (dd>=29))
	  {
	  alert('Invalid date format!');
	  inputText.focus();
	  return false;
	  }
	  if ((lyear==true) && (dd>29))
	  {
	  alert('Invalid date format!');
	  inputText.focus();
	  return false;
	  }
	  }
	  }
	  else
	  {
	  alert("Invalid date format!");
	  inputText.focus();
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

	<body>
	<jsp:include page="header.jsp"/>
		<h2>Add Employee Data</h2>
		<font id="errorMsg" color="red"> ${errorMsg }</font>
		<form:form method="post" action="empCreate" name="empCreate" commandName="command" onsubmit="return check();">
	   		<table>
			   <tr>
			        <td><label id="empLoginLbl">Employee login Name:</label></td>
                    <td><form:input path="loginName" /></td>
			    </tr>
			    
			     <tr>
			        <td><label id="empPwdLbl">Employee Password:</label></td>
                    <td><form:password path="password" /></td>
			    </tr>
			    <tr>
			        <td><label id="empFnameLbl">Employee First Name:</label> </td>
			        <td><form:input path="fName" /></td>
			    </tr>
			    <tr>
			        <td><label id="empLnameLbl">Employee Last Name:</label> </td>
			        <td><form:input path="lName" /></td>
			    </tr>
			   
			    <tr>
			        <td><label id="desigLbl">Designation:</label> </td>
			        <td>
			        <form:select path="designation">
				        <form:option value="Associate Engineer">Associate Engineer</form:option>
				        <form:option value="Senior Engineer">Senior Engineer</form:option>
				        <form:option value="Analyst">Analyst</form:option>
				        <form:option value="System Engineer">System Engineer</form:option>
				        <form:option value="Manager">Manager</form:option>
				     </form:select> 
			        </td>
			    </tr> 
			    
			    <tr>
			        <td><label id="genderLbl">Gender:</label></td>
			        <td>
			        	<input type="radio" id="mRadio" name="gender" value="male"  checked/>Male
			        	<input type="radio" id="fRadio" name="gender" value="female" />Female
			        </td>
			    </tr>
			    
			    <tr>
			        <td><label id="dobLbl">Date of Birth:</label></td>
			        <td><form:input path="dateOfBirth" /> &nbsp;&nbsp;(mm/dd/yyyy)</td>
			    </tr>

			    <tr>
			        <td><label id="statusLbl">Status:</label></td>
			        <td>
			        <form:select path="login.status">
			      		<form:option value="1">Active</form:option>
			      		<form:option value="0">Inactive</form:option>
			      	</form:select>
			        </td>
			    </tr>
			  
			    <tr>
			        <td><label id="deptLbl">Department:</label></td>
			        <td><form:select path="department.id">
			   		    <c:forEach items="${departments}" var="dept">
			      			<form:option value="${dept.id}">${dept.name}</form:option>
			      		</c:forEach>
			      		</form:select>
					</td>
			    </tr>
			  
			   
			   <tr>
			        <td><label id="managerLbl">Manager :</label></td>
			        <td>
			      <form:select path="manager.id">
			      <c:forEach items="${managers}" var="manager">
			      <form:option value="${manager.id}">${manager.fName} -  ${manager.lName} </form:option>
			      </c:forEach>
			      </form:select>
			        </td>
			    </tr>

		 	    <tr>
			        <td><label id="empSalLbl">Employee Salary:</label></td>
			        <td><form:input path="salary" onkeypress="return isNumber(event)"/></td>
			    </tr>
				
				<tr>
			   <td><label id="mnoLbl">Mobile No:</label></td>
			        <td><form:input path="mobileNo" onkeypress="return isNumber(event)"/></td>
			    </tr>			    
			    
			    <tr>
			   <td><label id="maritalStatusLbl">Marital Status:</label></td>
			        <td>
			         <form:select path="maritalStatus">
				        <form:option value="single">Single</form:option>
				        <form:option value="divorsed">Divorsed</form:option>
				        <form:option value="married">Married</form:option>
				     </form:select> 
			        </td>
			    </tr>		
			    
			<jsp:include page="addAddress.jsp"/>
			<tr> <td>
			  <input id="accept" type="checkbox" value="Accept"/>
			  <label id="acceptLabl" >I accept</label> 
			  </td> </tr>
			  
			 <tr>
			      <td colspan="2">
			      <input id="submit" type="submit" value="Submit"/></td>
		      </tr>
		      </table>
		</form:form>
	</body>
</html>

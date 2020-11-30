<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Change Pass</title>
</head>
<script type="text/javascript">

function check() {
	 var currPass = document.forms["changePwd"]["currPass"];
	 var newPass = document.forms["changePwd"]["newPass"] ;
	 var confirmPass = document.forms["changePwd"]["confirmPass"];
	 
	 if(currPass.value == "" ){
		 alert( "Please provide current Password!" );
		 currPass.focus() ;
	     return false;
	 }
	 
	 if(newPass.value == "" ){
		 alert( "Please provide new Password!" );
		 newPass.focus() ;
	     return false;
	 }
	 
	 if(newPass.value.length <5 || newPass.value.length >=10){
		 alert( "password has to be minimum 5 chars and max 10 chars!" );
		 newPass.focus() ;
	     return false;
	 }
	 
	 if(confirmPass.value == "" ){
		 alert( "Please provide confirm new Password!" );
		 confirmPass.focus() ;
	     return false;
	 }
	 
	 if(newPass.value != confirmPass.value ){
		 alert( "New Pass and  confirmPass should be same!" );
		 newPass.focus() ;
	     return false;
	 }
	 return true;
}
</script>

<body>
	<jsp:include page="header.jsp" />
	<h3>Change Password Screen</h3>
	${msg}
		<form name="changePwd" method="post" action="changePwd"  onsubmit="return check();">
	   		<table>
			   <tr>
			        <td><label id="currPassLabl">Current Password:</label></td>
                    <td><input type="password" name="currPass" /></td>
			    </tr>
			    
			     <tr>
			        <td><label id="newPassLabl1">New Password:</label></td>
                    <td><input type="password" name="newPass" /></td>
			    </tr>
			    
			     <tr>
			        <td><label id="newPassLabl2">Confirm Password:</label></td>
                    <td><input type="password" name="confirmPass" /></td>
			    </tr>
			    
			     <tr>
			        <td><input type="submit" 
			        name="Change Password" value="Change"></td>
			    </tr>
			 </table>
		</form>
</body>
</html>
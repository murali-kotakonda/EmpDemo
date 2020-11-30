<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<script type="text/javascript">
	function check() {
	 var loginName = document.forms["login"]["loginName"];
	 var password = document.forms["login"]["password"] ;
	 
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
	 

	 if(password.value.length < 5 || password.value.length >=10){
		 alert( "password has to be minimum 5 chars and max 10 chars!" );
		 password.focus() ;
	     return false;
	 }
	
	return true;
	}
</script>

<title>Employee Application</title>
</head>
<body>
	<h1>Login Page</h1>
	<font color="Red">${msg}</font>    
		<form:form name="login" action="login" method = "POST" 
		commandName="command" onsubmit="return check();">
		<table>
		<tr>
			<td><label id="userNameLbl">User Name:</label></td>
			<td><input type="text" name="loginName"><td/> 
		</tr>
		<tr>
			<td><label id="passwordLbl">Password:</label></td>
			<td><input type="password" name="password"><td/>
		</tr>
	 		<tr>	    
			<td colspan="2" align="center">
			<input type="submit" value="Login"></td>	
		</tr>
		</table>
		</form:form>
</body>
</html>

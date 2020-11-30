<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Welcome to Employee Application</title>
</head>
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
<body>
	<c:if test='${!empty sessionScope["empSession"]}'> 
   		 <jsp:forward page="/empProfile"/>
	</c:if>
	<h1>Login Page</h1>
	<font color="Red">${msg}</font>    
		<form name="login" action="login" method = "POST" onsubmit="return check();" >
		<table>
		<tr>
			<td><label id="userNameLbl">User Name:</label></td>
			<td><input type="text" id="loginName" name="loginName"><td/> 
		</tr>
		<tr>
			<td><label id="passwordLbl">Password:</label></td>
			<td><input type="password" id="password" name="password"><td/>
		</tr>
	 		<tr>	    
			<td colspan="2" align="center">
			<input name="login" type="submit" value="Login"></td>	
		</tr>
		</table>
		</form>
</body>
</html>

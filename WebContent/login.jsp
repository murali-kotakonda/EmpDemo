<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>Welcome to Employee Application</title>
</head>
<body>
	<c:if test='${!empty sessionScope["empSession"]}'> 
   		 <jsp:forward page="/empProfile"/>
	</c:if>
	<h1>Login Page</h1>
	<font color="Red">${msg}</font>    
		<form action="login" method = "POST" >
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
			<input name="login" type="submit" value="Login"></td>	
		</tr>
		</table>
		</form>
</body>
</html>

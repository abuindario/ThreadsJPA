<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up form</title>
</head>
<body>
<h1>Sign up form</h1>
	<c:out value="${message}" />
	<form action="loginController" method="post">
		<label id="fname">First Name: </label><input id="fname" type="text" name="fname" placeholder="First Name" required/>
		<label id="lname">Last Name: </label><input id="lname" type="text" name="lname" placeholder="Last Name" required/>
		<label id="email">Email: </label><input id="email" type="email" name="email" placeholder="Email" required/>
		<label id="uname">Username: </label><input id="uname" type="text" name="userName" placeholder="Name" required/>
		<label id="upass">Password: </label><input id="upass" type="password" name="userPassword" placeholder="Password" required/>
		<button name="button" value="signup">Sign up</button>
	</form>
	<p><a href="http://localhost:8080/loginJPA/loginController?button=">Already have an account?</a></p>
</body>
</html>
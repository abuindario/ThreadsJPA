<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login JSTL</title>
</head>
<body>
	<h1>Login</h1>
	<c:out value="${message}" />
	<form action="loginController" method="post">
		<label id="uname">Username: </label><input id="uname" type="text" name="userName" placeholder="Username"/>
		<label id="upass">Password: </label><input id="upass" type="password" name="userPassword" placeholder="Password"/>
		<button name="button" value="login">Login</button>
		<button name="button" value="kill">Kill Session</button>
	</form>
	<p><a href="signup.jsp">Don't have an account?</a></p>
	<p><a href="http://localhost:8080/loginJPA/loginController?button=access">Already logged-in?</a></p>
</body>
</html>
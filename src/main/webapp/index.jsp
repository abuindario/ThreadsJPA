<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Threads:: Login Page</title>
<style type="text/css">
	body {
		background: #ffffff;
	}
	
	.screen {
		width: 100%;
		display: flex;
		flex-wrap: no-wrap;
	}
		
	.col {
		width: 10%;
	}	
	
	.login {
		background: #ffffff;
		margin: 0;
		padding: 0;
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		align-items: center;
		width: 80%;
		height: 500px;
		font-family: sans-serif;
		overflow: hidden;
	}
	
	h1 {
		color: #6732E1;
		font-size: 2.3em;
		justify-content: center;
		display: flex;
		margin: 0;
		font-weight: bold;
		width: 100%;
		cursor: default;
	}
	
	form {
		margin: 0;
		padding: 0;
		width: 100%;
	}
	
	input {
		width: 60%;
		height: 40px;
		background: #e0dede;
		display: flex;
		margin: 20px auto;
		border: none;
		outline: none;
		border-radius: 5px;
		padding-left: 10px;
	}
	
	input:focus {
		background: #C8B1FF;
	}
	
	button {
		width: 60%;
		height: 40px;
		margin: 10px auto;
		justify-content: center;
		display: block;
		color: #fff;
		background: #6732E1;
		font-size: 1em;
		font-weight: bold;
		margin-top: 20px;
		outline: none;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}
	
	button:hover {
		background: #6d44b8;
	}
	
	a {
		justify-content: center;
		display: flex;
		width: 100%;
		margin: 10px;
		padding: 0;
		cursor: pointer;
		text-decoration: none;
		color: #6732E1;
	}
	
	a:hover {
		color: #6d44b8;
	}
	
	a:visited, a:active {
		text-decoration: none;
	}

</style>
</head>
<body>
	<div class="screen">
	<div class="col"></div>
	<div class="login">
		<form action="loginController" method="post">
			<h1>Login</h1>
			<c:out value="${message}" />
			<input id="uname" type="text" name="userName" placeholder="Username"/>
			<input id="upass" type="password" name="userPassword" placeholder="Password"/>
			<button name="button" value="login">Login</button>
			<button name="button" value="kill">Terminate Session</button>
			<a href="signup.jsp">Don't have an account?</a>
			<a href="http://localhost:8080/loginJPA/loginController?button=access">Already logged-in?</a>
		</form>
	</div>
	<div class="col"></div>
	</div>
</body>
</html>
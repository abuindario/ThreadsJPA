<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error while logging</title>
<style>
	.screen {
		width: 100%;
		display: flex;
		flex-wrap: no-wrap;
	}
		
	.col {
		width: 10%;
	}	
	
	.content {
		background: #ffffff;
		display: flex;
		flex-wrap: wrap;
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
	
	a {
		justify-content: center;
		display: flex;
		margin: auto;
		cursor: pointer;
		text-decoration: none;
		color: #6732E1;
		font-size: large;
		border-bottom: 1px solid #6732E1;
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
		<div class="content">
			<h1>There is no user logged</h1>
			<a href="http://localhost:8080/loginJPA/loginController?button=">Return to login page</a>
		</div>
		<div class="col"></div>
	</div>
</body>
</html>
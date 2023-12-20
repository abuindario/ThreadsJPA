<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Threads:: Sign Up Page</title>
<style type="text/css">
	.screen {
		width: 100%;
		display: flex;
		flex-wrap: no-wrap;
	}
		
	.col {
		width: 10%;
	}	
	
	.signup {
		background: #ffffff;
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		width: 80%;
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
		margin-top: 20px;
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
	
	#passwordRules {
		display:none;
		border: 1px solid #6732E1;
		color: #6732E1;
		width: 60%;
		margin: auto;
		border-radius: 10px;
	}
	
	#passwordRules h3 {
		padding: 10px 15px;
	}
	
	#passwordRules p {
		padding: 0px 15px 10px;
	}
		
	.valid {
	 	color: green;
	}
	
	.invalid {
	 	color: red;
	}
	
	#passwordValidation {
		display: none;
		width: 60%;
		margin: auto;
	}

</style>
</head>
<body>
	<div class="screen" >
		<div class="col"></div>
		<div class="signup">
			<h1>Sign Up form</h1>
			<c:out value="${message}" />
			<form action="loginController" method="post">
				<input id="fname" type="text" name="fname" placeholder="First Name" required/>
				<input id="lname" type="text" name="lname" placeholder="Last Name" required/>
				<input id="email" type="email" name="email" placeholder="Email" required/>
				<input id="uname" type="text" name="userName" placeholder="Username" required/>
				<input id="upass" type="password" name="userPassword" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required/>
				<div id="passwordRules">
				  <h3>Password must contain the following:</h3>
				  <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
				  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
				  <p id="number" class="invalid">A <b>number</b></p>
				  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
				</div>
				<input id="upass2" type="password" name="userPassword2" placeholder="Repeat password" required/>	
				<div id="passwordValidation">
				  <p id="match" class="invalid">Passwords must match</p>
				</div>		
				<button name="button" value="signup">Sign Up</button>
				<a href="http://localhost:8080/loginJPA/loginController?button=">Already have an account?</a>
			</form>
		</div>
		<div class="col"></div>
	</div>
	<script>
		var password = document.getElementById("upass");
		var letter = document.getElementById("letter");
		var capital = document.getElementById("capital");
		var number = document.getElementById("number");
		var length = document.getElementById("length");
		
		var lowerCaseLetters = /[a-z]/g;
		var upperCaseLetters = /[A-Z]/g;
		var numbers = /[0-9]/g;

		password.onfocus = function() {
			if( !password.value.match(lowerCaseLetters) || !password.value.match(upperCaseLetters) || !password.value.match(numbers) || !password.value.length >= 8 ) {
				document.getElementById("passwordRules").style.display = "block";				
			}
		}
		
		password.onblur = function() {
			document.getElementById("passwordRules").style.display = "none";
		}
		
		password.onkeyup = function() {
		  // Validate lowercase letters
		  if(password.value.match(lowerCaseLetters)) {
		    letter.classList.remove("invalid");
		    letter.classList.add("valid");
		  } else {
		    letter.classList.remove("valid");
		    letter.classList.add("invalid");
		  }
		  // Validate capital letters
		  if(password.value.match(upperCaseLetters)) {
		    capital.classList.remove("invalid");
		    capital.classList.add("valid");
		  } else {
		    capital.classList.remove("valid");
		    capital.classList.add("invalid");
		  }	
		  // Validate numbers
		  if(password.value.match(numbers)) {
		    number.classList.remove("invalid");
		    number.classList.add("valid");
		  } else {
		    number.classList.remove("valid");
		    number.classList.add("invalid");
		  }	
		  // Validate length
		  if(password.value.length >= 8) {
		    length.classList.remove("invalid");
		    length.classList.add("valid");
		  } else {
		    length.classList.remove("valid");
		    length.classList.add("invalid");
		  }
		  
		  if(password.value.match(lowerCaseLetters) && password.value.length >= 8 && password.value.match(numbers) && password.value.match(upperCaseLetters)) {
			  document.getElementById("passwordRules").style.display = "none";
		  } else {
			  document.getElementById("passwordRules").style.display = "block";
		  }
		}
		
		var repeatPassword = document.getElementById("upass2");
		var match = document.getElementById("match");
		
		repeatPassword.onfocus = function() {
			if(!repeatPassword.value.match(password.value)) {
		  		document.getElementById("passwordValidation").style.display = "block";
			}
		}
			
		repeatPassword.onblur = function() {
		  document.getElementById("passwordValidation").style.display = "none";
		}
		
		repeatPassword.onkeyup = function() {
			if(repeatPassword.value.match(password.value)) {
				document.getElementById("passwordValidation").style.display = "none";
			} else {
				document.getElementById("passwordValidation").style.display = "block";
			}
		}
		
		
	</script>
</body>
</html>
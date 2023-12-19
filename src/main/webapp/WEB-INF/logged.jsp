<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Threads:: Home Page</title>
<style>
	.top {
		left: 10%;
		position:fixed; 
		top:0; 
		width:100%; 
		height: 50px;
		background: white;
		font-size: large;
	}
	
	.screen {
		width: 100%;
		display: flex;
		flex-wrap: no-wrap;
		margin-top: 50px;
	}
		
	.col {
		width: 10%;
	}	
	
	.threadlist {
		background: #ffffff;
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		width: 80%;
		font-family: sans-serif;
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
		width: 100%;
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
		height: 30px;
		color: #fff;
		background: #6732E1;
		font-size: 1em;
		font-weight: bold;
		margin-top: 10px;
		outline: none;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}
	
	button:hover {
		background: #6d44b8;
	}
	
	a {
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
	table {
		text-align: center;
		width: 100%;
	}
	
	th {
		background-color: #6732E1;
		color: white;
		position: sticky;
		top: 50px;
	}
	
	th, td {
		border-bottom: 1px solid #6732E1;
		padding: 10px;
	}
	
	.otherwise, .when {
		margin: auto;
	}
</style>
</head>
<body>
	<div class="top">
		<p>
		User: ${name} | <a href="http://localhost:8080/loginJPA/loginController?button=kill">Logout</a> | <a href="http://localhost:8080/loginJPA/loginController?button=">Return to Login Page</a>
		</p>
	</div>
	<div class="screen" >
		<div class="col"></div>
		<div class="threadlist">
			<h1>Welcome to Threads!</h1>
			<c:choose>
				<c:when test="${threads.size() > 0}">
					<div class="when">
						<form action="loginController" method="post">
							<table>
								<tr>
									<th style="width:50%">Thread</th>
									<th style="width:20%">Actions</th>
									<th style="width:10%">Author</th>
									<th style="width:10%">Publication Date</th>
									<th style="width:10%">Number of messages</th>
								</tr>
								<c:forEach var="thread" items="${threads}">
									<tr id="row${thread.getId() }">
										<td>
											<input type="text" name="threadName" value="${thread.getThreadName() }"/>
										</td>
										<td>
											<button onClick="send('threadById', ${thread.getId()})">Access</button>
											<c:if test="${thread.getCreator().getUsername().equals(user.getUsername())}" >
												<button onClick="send('editThread', ${thread.getId()})">Edit</button>
												<button onClick="send('deleteThread', ${thread.getId()})">Delete</button>
											</c:if>
										</td>
										<td><c:out value="${thread.creator.getUsername()}"/></td>
										<td><c:out value="${thread.getCreationDate()}"/></td>
										<td><c:out value="${thread.getMessages().size()}"/></td>
									</tr>
								</c:forEach>
								<tr>
									<td>
										<input type="text" name="createThreadName" placeholder="Thread name..."/>
										<c:out value="${badThreadNaming }"/>
									</td>
									<td>
										<button onClick="send('createThread', 0)">Thread!</button>
									</td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</table>
							<input type="hidden" name="newThreadName" />
							<input type="hidden" name="threadId" />
							<input type="hidden" name="button" />
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<div class="otherwise">
						<form action="loginController" method="post">
							<table>
								<tr>
									<th>Create the first Thread!</th>
								</tr>
								<tr>
									<td>
										<c:out value="${badThreadNaming }"/>
										<input type="text" name="createThreadName" placeholder="Thread name"/>
										<button name="button" value="createThread">Thread!</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="col"></div>
	</div>
	<script>
		const send = (action, id) => {
			if(action == 'createThread') {
				document.querySelector('[name=button]').value = action;
				document.querySelector("form").submit();
			} else {
				const row = document.querySelector('#row' + id);
				const threadName = row.querySelector('input[name="threadName"]').value;
				if(threadName.length > 0) {
					document.querySelector('[name=threadId]').value = id;
					document.querySelector('[name=button]').value = action;
					document.querySelector('[name=newThreadName]').value = threadName;
					document.querySelector("form").submit();					
				} else {
					document.querySelector('[name=threadId]').value = id;
					document.querySelector('[name=button]').value = action;
					window.alert("Thread name cannot be empty!");
					document.querySelector("form").submit();					
				}
			}
		}
	</script>
</body>
</html>
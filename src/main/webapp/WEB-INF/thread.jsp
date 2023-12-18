<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Threads:: Thread</title>
<style>
	.top {
		position:fixed; 
		top:0;
		left: 10%; 
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
	
	.messagelist {
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
	<div class="screen" >
		<div class="top">
			<p>
			User: ${user.getUsername()} | <a href="http://localhost:8080/loginJPA/loginController?button=kill">Logout</a> | <a href="http://localhost:8080/loginJPA/loginController?button=access">Back to Threads</a>
			</p>		
		</div>
		<div class="col"></div>
		<div class="messagelist">
			<c:choose>
				<c:when test="${thread.getMessages().size() >0}">
					<form action="loginController" method="post">
						<h1><c:out value="Thread: ${thread.getThreadName() }" /></h1>
						<table>
							<tr>
								<th style="width:60%">Message</th>
								<th style="width:20%">Actions</th>
								<th style="width:10%">Author</th>
								<th style="width:10%">Publication Date</th>
							</tr>
							<c:forEach var="msg" items="${thread.getMessages()}">
								<tr id="row${msg.getId() }">
									<td>
										<input type="text" name="postContent" value="${msg.getContent()}"/>
									</td>
									<td>
										<c:if test="${msg.getSender().getEmail().equals(user.getEmail())}" >
												<button onClick="send('deleteMessage', ${msg.getId()})">Delete</button>
												<button onClick="send('editMessage', ${msg.getId()})">Edit</button>
										</c:if>
									</td>
									<td><c:out value="${msg.getSender().getUsername()}"/></td>
									<td><c:out value="${msg.getCreationDate()}"/></td>
								</tr>
							</c:forEach>
								<tr>
									<td>
										<input type="text" name="content" placeholder="Write here your message..."/>
									</td>
									<td>
										<button onClick="send('postMessage', 0)">Post!</button>
									</td>
									<td></td>
									<td></td>
								</tr>
						</table>
						<input type="hidden" name="threadId" value="${thread.getId() }"/>
						<input type="hidden" name="messageId" />
						<input type="hidden" name="button" />
						<input type="hidden" name="updateContent" />
					</form>
				</c:when>
				<c:otherwise>
					<table>
						<tr>
							<th>Post the first Message</th>
						</tr>
						<tr>
							<td>
								<c:out value="${msg}" />
								<form action="loginController" method="post">
									<input type="hidden" name="threadId" value="${thread.getId() }" />
									<input type="text" name="content" placeholder="Write here your post..."/>
									<button name="button" value="postMessage">Post!</button>
								</form>
							</td>
						</tr>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="col"></div>
	</div>
	<script>
		const send = (action, id) => {	
			if(action == 'postMessage') {
				document.querySelector('[name=button]').value = action;
			} else {	
				const row = document.querySelector('#row' + id);
				const msg = row.querySelector('input[name="postContent"]').value;
				document.querySelector('[name=messageId]').value = id;
				document.querySelector('[name=content]').value = msg;
				document.querySelector('[name=button]').value = action;
				document.querySelector("form").submit();
			}
		}
	</script>
</body>
</html>
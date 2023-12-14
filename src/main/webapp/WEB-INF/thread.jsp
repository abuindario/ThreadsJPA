<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Threads:: Thread</title>
<style>
	table {
		text-align: center;
		border: 3px solid black;
	}
	
	th {
		background-color: #C1C1C1;
	}
	
	th, td {
		border-bottom: 1px solid #ddd;
		padding: 10px;
	}
	
	.otherwise, .when {
		margin: auto;
	}
</style>
</head>
<body>
	<p>
	User logged: ${user.getUsername()} | <a href="http://localhost:8080/loginJPA/loginController?button=kill">Logout</a>
	</p>
	<h1><c:out value="Thread: ${thread.getThreadName() }" /></h1>
	<c:choose>
		<c:when test="${thread.getMessages().size() >0}">
			<form action="loginController" method="post">
				<table>
					<tr>
						<th>Author</th>
						<th>Publication Date</th>
						<th>Message</th>
					</tr>
					<c:forEach var="msg" items="${thread.getMessages()}">
						<tr>
							<td><c:out value="${msg.getSender().getUsername()}"/></td>
							<td><c:out value="${msg.getCreationDate()}"/></td>
							<td>
								<c:out value="${msg.getContent()}"/>
								<c:if test="${msg.getSender().getEmail().equals(user.getEmail())}" >
										<input type="hidden" name="threadId" value="${thread.getId() }" />
										<input type="hidden" name="messageId" value="${msg.getId() }" />
										<button name="button" value="deleteMessage">Delete</button>
								</c:if>
							</td>
						</tr>
					</c:forEach>
						<tr>
							<td></td>
							<td></td>
							<td>
								<input type="text" name="content" />
								<button name="button" value="postMessage">Post!</button>
							</td>
						</tr>
				</table>
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
	<c:out value="${msg}"/>
	<a href="http://localhost:8080/loginJPA/loginController?button=access">Return to Thread list</a>
</body>
</html>
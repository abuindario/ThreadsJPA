<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Threads:: Home Page</title>
</head>
<body>
	<p>
	User logged: ${name} | <a href="http://localhost:8080/loginJPA/loginController?button=kill">Logout</a>
	</p>
	<h1>Welcome to Threads!</h1>
	<c:choose>
		<c:when test="${threads.size() > 0}">
			<table>
				<tr>
					<th>Name</th>
					<th>Author</th>
					<th>Publication Date</th>
					<th>Number of messages</th>
				</tr>
				<c:forEach var="thread" items="${threads}">
					<tr>
						<td><form action="loginController" method="post"><input type="hidden" name="threadId" value="${thread.getId()}"/><button name="button" value="threadById"><c:out value="${thread.threadName}"/></button></form></td>
						<td><c:out value="${thread.creator.getUsername()}"/></td>
						<td><c:out value="${thread.getCreationDate()}"/></td>
						<td><c:out value="${thread.getMessages().size()}"/></td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<c:out value="There are no more Threads to show!"></c:out>
			<br>
			<c:out value="Create the first Thread!"></c:out>
		</c:otherwise>
	</c:choose>
	<table>
		<tr>
			<td>
				<c:out value="${badThreadNaming}"></c:out>
				<form action="loginController" method="post">
					<input type="text" name="threadName" placeholder="Thread Name"/>
					<button name="button" value="createThread">New Thread</button>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
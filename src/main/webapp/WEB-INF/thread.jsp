<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Threads:: Thread</title>
</head>
<body>
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
				<td><c:out value="${msg.getContent()}"/></td>
			</tr>
		</c:forEach>
	</table>
	<table>
		<tr>
			<td>
			<form action="loginController" method="post">
				<input type="hidden" name="threadId" value="${thread.getId() }" />
				<input type="text" name="content" placeholder="Write here your post..."/>
				<button name="button" value="postMessage">Post Message</button>
			</form>
			</td>
		</tr>
	</table>
	<c:out value="${msg}"/>
	<a href="http://localhost:8080/loginJPA/loginController?button=access">Return to Thread list</a>
</body>
</html>
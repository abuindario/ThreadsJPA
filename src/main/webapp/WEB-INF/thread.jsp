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
	<p>
	User logged: ${user.getUsername()} | <a href="http://localhost:8080/loginJPA/loginController?button=kill">Logout</a>
	</p>
	<h1><c:out value="Thread: ${thread.getThreadName() }" /></h1>
	<c:choose>
		<c:when test="${thread.getMessages().size() >0}">
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
						<td>
							<c:if test="${msg.getSender().getEmail().equals(user.getEmail())}" >
								<form action="loginController" method="post">
									<input type="hidden" name="threadId" value="${thread.getId() }" />
									<input type="hidden" name="messageId" value="${msg.getId() }" />
									<button name="button" value="deleteMessage">Delete this message</button>
								</form>
							</c:if>
						<td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<c:out value="There are no more messages to display!" />
			<br>
			<c:out value="Post the first message!" />
		</c:otherwise>
	</c:choose>
	<table>
		<tr>
			<td>
			<c:out value="${msg}" />
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
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
			<form action="loginController" method="post">
				<table>
					<tr>
						<th>Name</th>
						<th>Author</th>
						<th>Publication Date</th>
						<th>Number of messages</th>
					</tr>
					<c:forEach var="thread" items="${threads}">
						<tr id="row${thread.getId() }">
							<td>
								<input type="text" name="threadName" value="${thread.getThreadName() }"/>
								<button onClick="send('threadById', ${thread.getId()})">Access</button>
								<button onClick="send('editThread', ${thread.getId()})">Edit</button>
								<c:if test="${thread.getCreator().getUsername().equals(user.getUsername())}" >
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
							<input type="text" name="createThreadName" />
							<button onClick="send('createThread', 0)">New Thread</button>
						</td>
					</tr>
				</table>
				<input type="hidden" name="newThreadName" />
				<input type="hidden" name="threadId" />
				<input type="hidden" name="button" />
			</form>
		</c:when>
		<c:otherwise>
			<c:out value="There are no more Threads to show!"></c:out>
			<br>
			<c:out value="Create the first Thread!"></c:out>
		</c:otherwise>
	</c:choose>
	<script>
		const send = (action, id) => {
			if(action == 'createThread') {
				document.querySelector('[name=button]').value = action;
				document.querySelector("form").submit();
			} else {
				const row = document.querySelector('#row' + id);
				const threadName = row.querySelector('input[name="threadName"]').value;
				document.querySelector('[name=threadId]').value = id;
				document.querySelector('[name=button]').value = action;
				document.querySelector('[name=newThreadName]').value = threadName;
				document.querySelector("form").submit();
			}
		}
	</script>
</body>
</html>
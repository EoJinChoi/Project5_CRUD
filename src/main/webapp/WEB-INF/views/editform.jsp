<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.example.board.BoardDAO, com.example.board.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
</head>
<body>

<h1>Edit Form</h1>
<form:form modelAttribute="boardVO" method="POST" action="../editok">
	<form:hidden path="seq"/>
	<table id = "edit">
		<tr><td>Item:</td><td><form:input path="item" /></td></tr>
		<tr><td>Writer:</td><td><form:input path="writer" /></td></tr>
		<tr><td>Price:</td><td><form:input path="price" /></td></tr>
		<tr><td>Content:</td><td><form:textarea cols="50" rows="5" path="content" /></td></tr>
		<tr><td>Method:</td><td><form:input path="method" /></td></tr>
	</table>
	<input type="submit" value="Edit Post"/>
	<input type="button" value="Cancel" onclick="history.back()"/></td></tr>
</form:form>

</body>
</html>
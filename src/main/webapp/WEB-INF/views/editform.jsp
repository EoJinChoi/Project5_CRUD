<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.example.board.BoardDAO, com.example.board.BoardVO" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <table id="edit">
        <tr>
            <td>Item:</td>
            <td><form:input path="item"/></td>
        </tr>
        <tr>
            <td>Status:</td>
            <td><form:checkbox path="" value="중고"/>중고<form:checkbox path="" value="새제품"/>새제품</td>
        </tr>
        <tr>
            <td>Writer:</td>
            <td><form:input path="writer"/></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><form:input path="price"/></td>
        </tr>
        <tr>
            <td>Content:</td>
            <td><form:textarea cols="50" rows="5" path="content"/></td>
        </tr>
        <tr>
            <td>Method:</td>
            <td><form:radiobutton path="method" value="직거래"/>직거래<form:radiobutton path="method" value="택배"/>택배</td>
        </tr>
    </table>
    <input type="submit" value="Edit Post"/>
    <input type="button" value="Cancel" onclick="history.back()"/></td></tr>
</form:form>

</body>
</html>
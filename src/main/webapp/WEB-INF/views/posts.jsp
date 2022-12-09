<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="com.example.board.BoardDAO, com.example.board.BoardVO,java.util.*"%>
<%@ page import="java.io.File" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>free board</title>
<style>
#list {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#list td, #list th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
#list tr:nth-child(even){background-color: #f2f2f2;}
#list tr:hover {background-color: #ddd;}
#list th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #5695c0;
  color: white;
}
.photo{
	width: 150px;
	hieght: 120px;
}
button{
	position: absolute;
	right: 10px;
	color: #5695c0;
	border-collapse: collapse;
}
</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deleteok/' + id;
	}
</script>
</head>
<body>
<h1>중고물품 거래 서비스</h1>
<%--<%--%>
<%--	BoardDAO boardDAO = new BoardDAO();--%>
<%--	List<BoardVO> list = boardDAO.getItemsList();--%>
<%--	request.setAttribute("list",list);--%>
<%--%>--%>

<table id="list" width="90%">
<tr>
	<th>Seq</th>
	<th>Item</th>
<%--	<th>Photo</th>--%>
	<th>Writer</th>
	<th>Price</th>
	<th>Content</th>
	<th>method</th>
	<th>Regdate</th>
	<th>Editdate</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.seq}</td>
		<td>${u.item}</td>
<%--		<td><img src="${pageContext.request.contextPath }/upload/${u.getPhoto()}" class = "photo"></td>--%>
		<td>${u.writer}</td>
		<td>${u.price}</td>
		<td>${u.content}</td>
		<td>${u.method}</td>
		<td>${u.regDate}</td>
		<td>${u.updateAt}</td>
		<td><a href="editform/${u.seq}">Edit</a></td>
		<td><a href="javascript:delete_ok('${u.seq}')">Delete</a></td>
	</tr>
</c:forEach>
</table>
<br/><a href="add">Add New Post</a>
<button type="logout" onclick="location.href='../login/logout'">Logout</button>
</body>
</html>
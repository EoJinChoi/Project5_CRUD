<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.board.BoardDAO, com.example.board.BoardVO,java.util.*"%>
<%@ page import="java.io.File" %>
<%--<%@ page import="com.oreilly.servlet.MultipartRequest" %>--%>
<%--<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
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
  background-color: #006bb3;
  color: white;
}
.photo{
	width: 150px;
	hieght: 120px;
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
<h1>자유게시판</h1>
<%--<%--%>
<%--	BoardDAO boardDAO = new BoardDAO();--%>
<%--	List<BoardVO> list = boardDAO.getItemsList();--%>
<%--	request.setAttribute("list",list);--%>
<%--%>--%>

<table id="list" width="90%">
<tr>
	<th>Seq</th>
	<th>Item</th>
	<th>Photo</th>
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
		<td>${u.getSeq()}</td>
		<td>${u.getItem()}</td>
<%--		<td><img src="${pageContext.request.contextPath }/upload/${u.getPhoto()}" class = "photo"></td>--%>
		<td>${u.getWriter()}</td>
		<td>${u.getPrice()}</td>
		<td>${u.getContent()}</td>
		<td>${u.getMethod()}</td>
		<td>${u.getRegDate()}</td>
		<td>${u.getUpdateAt()}</td>
		<td><a href="editform/${u.getSeq()}">Edit</a></td>
		<td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
	</tr>
</c:forEach>
</table>
<br/><a href="addpostform.jsp">Add New Post</a>
</body>
</html>
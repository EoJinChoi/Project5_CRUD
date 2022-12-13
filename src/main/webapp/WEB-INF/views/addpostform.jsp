<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Add New Post</h1>
<form action="addok" method="post">
    <table id = "edit">
        <tr><td>Item:</td><td><input type="text" name="item"/></td></tr>
        <tr><td>Status:</td><td><input type="radio" name="method"/>중고<input type="radio" name="method"/>새제품</td></tr>
        <tr><td>Writer:</td><td><input type="text" name="writer"/></td></tr>
        <tr><td>Price:</td><td><input type="text" name="price"/></td></tr>
        <tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"></textarea></td></tr>
        <tr><td>Method:</td><td><input type="checkbox" name="method" value="직거래"/>직거래<input type="checkbox" name="method" value="택배"/>택배</td></tr>
    </table>
    <button type="button" onclick="location.href='posts'">목록보기</button>
    <button type="submit">등록하기</button>
</form>

</body>
</html>
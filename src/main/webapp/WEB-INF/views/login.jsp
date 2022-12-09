<%--
  Created by IntelliJ IDEA.
  User: choieojin
  Date: 2022/12/06
  Time: 9:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        img, label{display: inline-block;}
        label{width:130px}
        button{
            width: 45px;
            height: 45px;
            color: #5695c0;
            fontsize:15px;
            margin-top: 10px;
            position: absolute;
            right: 515px;
            bottom: 415px;
        }
    </style>
</head>
<body>
<div style='width:100%;text-align:center;padding-top:100px'>
    <img src='../img/snowman.jpeg' height="250">
    <form method="post" action="loginOk">
        <div><label>User ID: </label><input type='text' name='userid' /></div>
        <div><label>Password: </label>
        <input type='password' name='password' /></div>
        <button type='submit'>login</button>
    </form>
</div>
</body>
</html>

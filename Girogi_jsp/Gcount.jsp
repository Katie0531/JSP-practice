<%@page import="girogi.GDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>게시물 수</title>
<style>
    .count-container {
        display: flex;
        align-items: center;
        margin-top: 50px;
    }
    
    .count-container img,
    .count-container h1 {
        display: inline;
        margin: 10px;
    }
    
    .count-container h1 {
        font-size: 50px;
    }
</style>    
</head>
<body>
<%
   GDao adao = new GDao();
   int postCount = adao.getPostCount();
%>
   <div class="count-container">
       <img src="./assets/count.png" alt="..." style="height:5vh;">
       <h1><%= postCount %>개 </h1>
       <img src="./assets/is.png" alt="..." style="height:4vh;">
   </div>
</body>
</html>

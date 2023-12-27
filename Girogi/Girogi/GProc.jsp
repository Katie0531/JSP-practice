<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="girogi.GDo" %>
<%@ page import="girogi.GDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
.button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #4CAF50;
  color: white;
  text-decoration: none;
  border-radius: 4px;
}

.button:hover {
  background-color: #45a049;
}
</style>
</head>
<body>
<center>
<div class="container">
	<%@ include file="Gnav.jsp" %>
</div>
<%
    // 한글 깨짐 방지
    request.setCharacterEncoding("utf-8");

    // GDo 객체 생성 및 데이터 설정
    GDo ado = new GDo();
    ado.setTitle(request.getParameter("title"));
    ado.setContent(request.getParameter("content"));

 	// 등록일시 문자열을 java.util.Date 타입으로 변환
    SimpleDateFormat dateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
    Date createdDate = dateFormat.parse(request.getParameter("createdAt"));

    // java.util.Date를 java.sql.Timestamp로 변환
    java.sql.Timestamp createdTimestamp = new java.sql.Timestamp(createdDate.getTime());

    ado.setCreatedAt(createdTimestamp);


    // dao 클래스를 이용하여 입력값을 저장 (insertAddr())
    GDao adao = new GDao();
    adao.insertAddr(ado);
%>

<hr>
<a href="GList.jsp" class="button">전체 게시글 보기</a>
<div><br></div>
<h3>게시글을 등록했어요!</h3>
<div><br></div>
<table border="1">
    <tr height="50" align="center">
        <td width="100">제목</td>
        <td width="300">
            <%= ado.getTitle() %>
        </td>
    </tr>
    <tr height="50" align="center">
        <td width="100">내용</td>
        <td width="300">
            <%= ado.getContent() %>
        </td>
    </tr>
    <tr height="50" align="center">
        <td width="100">등록일시</td>
        <td width="300">
            <%= ado.getCreatedAt() %>
        </td>
    </tr>
</table>
</center>
</body>
</html>

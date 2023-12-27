<%@page import="girogi.GDo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td {padding: 10px;}
</style>
</head>
<body>
	<div class="container">
	<%@ include file="Gnav.jsp" %>
	</div>
   <hr>
	
	<jsp:useBean id="adao" class="girogi.GDao"/>
	
	<%
		//어떤 주소 데이터를 수정할지 데이터 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		
		//dao에서 getOneAddr() 이용하여 num에 해당되는 데이터 가져오기
		GDo ado = adao.getOneAddr(num);	
	%>
	<center>
	<img src="./assets/관리.png" class="d-block w-30" alt="..." style="height:15vh;">
	<table border="1">
		<tr height="50" align="center">
			<td width="100"> 제목 </td>
				<td width="300"> 
					<!-- <input type="text" name="title"> -->
					<%= ado.getTitle() %>
				</td>
			</tr><tr height="50" align="center">
			<td width="100">  </td>
				<td width="300"> 
				</td>
			</tr>
			<tr height="50" align="center">
			<td width="100"> 내용 </td>
				<td width="300"> 
					<!--  <input type="text" name="text"> -->
					<%= ado.getContent() %>
				</td>
			</tr>
		
		<tr height="50" align="center">
			<td colspan="2" align="center">
				<input type="button" value="수정하기"
				onclick="location.href='GModify.jsp?num=<%= ado.getNum() %>'">
				<input type="button" value="삭제하기"
				onclick="location.href='GaddrDelete.jsp?num=<%= ado.getNum() %>'">
				<input type="button" value="목록보기"
				onclick="location.href='GList.jsp?'">
			</td>
		</tr>	
				
	</table>
</center>

</body>
</html>
<%@page import="girogi.GDo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<form action="GModifyProc.jsp" method="get">
	<center>
	<img src="./assets/수정.png" class="d-block w-30" alt="..." style="height:15vh;">
	<br>
	<table border="1">
		<tr height="50" align="center">
			<td width="100"> 제목 </td>
				<td width="300"> 
					<input type="text" value="<%=ado.getTitle()%>" name="title">
				</td>
			</tr>
			<tr height="50" align="center">
			<td width="100"> 내용 </td>
				<td width="300"> 
					<input type="text" value="<%=ado.getContent()%>" name="content">
				</td>
			</tr>	
				
		<tr height="50" align="center">
			<td colspan="2" align="center">
				<input type="hidden" name="num" value="<%= ado.getNum() %>" >
				<input type="hidden" name="createdAt" value="<%= ado.getCreatedAt() %>" >

				<input type="submit" value="수정하기">
				<input type="button" value="목록보기"
				onclick="location.href='GList.jsp'">
			</td>
		</tr>	
				
	</table>
	</center>
	</form>
</body>
</html>
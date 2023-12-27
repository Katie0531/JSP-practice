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
	<center>
	<br>
	<img src="./assets/입력.png" class="d-block w-50" alt="..." style="height:15vh;">
	<div><br></div>
	<form action="GProc.jsp" method="get">
	<table border="1">
		<tr height="50" align="center">
			<td width="100"> 제목 </td>
				<td width="300"> 
					<input type="text" name="title">
				</td>
			</tr>
			<tr height="50" align="center">
			<td width="100"> 내용 </td>
				<td width="300"> 
					<input type="text" name="content">
				</td>
			</tr>	
		
			<tr height="50" align="center"> 
			<td colspan="2">
					<input type="submit" value="확인">
					<input type="reset" value="지우기">
					<input type="hidden" name="createdAt" value="<%= new java.util.Date() %>">
				</td>
			</tr>			
	</table>
	</form>
	</center>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> addrDelete.jsp (해당 데이터 삭제)</h2>
	<jsp:useBean id="adao" class="girogi.GDao" />
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		//dao의 deleteAddr() 함수 이용하여 삭제 처리
		adao.deleteAddr(num);
		//삭제 후에 전체 목록보기로 이동...
		response.sendRedirect("GList.jsp");
		
		
	%>
</body>
</html>
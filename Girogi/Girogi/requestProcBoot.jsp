<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   
   <% request.setCharacterEncoding("utf-8"); 
   	  String username = request.getParameter("username");
   	  String password = request.getParameter("password");
   	  
   	  //세션에 이름과 비번을 저장
   	  session.setAttribute("username", username);
   	  session.setAttribute("password", password);
   	  
   	  //세션에 데이터 저장 후에는 main.jsp로 이동
   	  response.sendRedirect("Gmain.jsp");
   	  
   %>
   
   
   
</body>
</html>
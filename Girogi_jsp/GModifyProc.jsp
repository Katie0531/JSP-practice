<%@ page import="girogi.GDao" %>
<%@ page import="girogi.GDo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    // 어떤 주소 데이터를 수정할지 데이터 가져오기
    int num = Integer.parseInt(request.getParameter("num"));

    // dao에서 getOneAddr() 이용하여 num에 해당되는 데이터 가져오기
    GDao adao = new GDao();
    GDo originalData = adao.getOneAddr(num);

    // 원래 값 유지
    GDo ado = new GDo();
    ado.setNum(originalData.getNum());
    ado.setCreatedAt(originalData.getCreatedAt());

    // 입력된 수정 데이터 설정
    ado.setTitle(request.getParameter("title"));
    ado.setContent(request.getParameter("content"));

    // 주소 데이터 수정
    adao.modifyAddr(ado);

    // 수정된 데이터를 다시 가져오기
    ArrayList<GDo> aList = adao.getAllAddr("asc"); // Assuming ascending order for simplicity

    // 수정된 데이터를 저장
    request.setAttribute("aList", aList);

    // GList.jsp로 이동
    request.getRequestDispatcher("GList.jsp").forward(request, response);
%>
</body>
</html>

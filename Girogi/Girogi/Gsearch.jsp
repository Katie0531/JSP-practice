<%@page import="girogi.GDo"%>
<%@page import="girogi.GDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
h4 {font-family: 'Hanna', sans-serif;}
td {padding: 15px;}
</style>
</head>
<body>
   <div class="container">
	<%@ include file="Gnav.jsp" %>
	</div>

   <center>
   <img src="./assets/giro2.png" class="d-block w-100" alt="..." style="height:20vh;">
    </center>
<jsp:useBean id="adao" class="girogi.GDao"></jsp:useBean>
<%
   ArrayList<GDo> aList = adao.getAllAddr("1"); // 여기서 정렬 순서를 전달
%>


<%
   String searchTitle = request.getParameter("searchTitle"); // 검색어 가져오기
   ArrayList<GDo> filteredList = new ArrayList<>(); // 검색 결과를 담을 리스트

   if (searchTitle != null && !searchTitle.isEmpty()) {
      for (GDo ado : aList) {
         if (ado.getTitle().contains(searchTitle)) {
            filteredList.add(ado); // 검색어를 포함하는 게시물만 필터링하여 리스트에 추가
         }
      }
   } else {
      filteredList = aList; // 검색어가 없는 경우, 모든 게시물을 표시
   }
%>

<form action="Gsearch.jsp" method="GET" style="width: 300px; margin-left: 880px">
   <input type="text" name="searchTitle" placeholder="제목 검색" style="width: 200px; height: 30px;" />
   <button type="submit" style="height: 35px;">검색</button>
</form>

<br>
<center>
<table width="1000" border="2">
   <tr height="40">
      <td width="150" align="center" ><b> 번호 </b></td>
      <td width="150" align="center"> <b>제목 </b></td>
      <td width="150" align="center"><b> 내용 </b></td>
      <td width="200" align="center"><b> 등록일시 </b></td>
   </tr>
   <%      
      for (GDo ado : filteredList) {
   %>
   <tr height="40">
      <td width="150" align="center"> <%=ado.getNum() %> </td>
      <td width="150" align="center"> 
         <a href="addrInfo.jsp?num=<%=ado.getNum() %> ">
            <%=ado.getTitle() %>
         </a>
      </td>
      <td width="150" align="center"> <%=ado.getContent() %> </td>
      <td width="150" align="center"> <%=ado.getCreatedAt() %> </td>
   </tr>
   <%      
      }
   %>
</table>
</center>
<br><br>
</body>
</html>

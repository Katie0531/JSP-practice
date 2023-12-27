<%@page import="girogi.GDao"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page import="girogi.GDo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #626567;
  color: white;
  text-decoration: none;
  border-radius: 4px;
}

.button:hover {
  background-color: #C57EDC;
}

.card-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.card {
  flex-basis: 40%; /* 카드가 한 줄에 최대 2개가 되도록 설정하며 각 카드의 너비를 30%로 줄임 */
  margin: 50px;
}



@media (max-width: 768px) {
  /* 뷰포트 크기가 768px 이하일 때 한 줄에 1개의 카드만 표시 */
  .card {
    flex-basis: 100%;
  }
}
</style>

<!-- CSS 라이브러리 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- JS 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script>
  // Function to handle the change event of the select element
  function changeOrder() {
    var order = document.getElementById("orderSelect").value;
    // Redirect to the current page with the selected order as a parameter
    window.location.href = "GList.jsp?order=" + order;
  }
</script>
</head>
<body>
   <div class="container">
     <%@ include file="Gnav.jsp" %>
   </div>

   <center>
   <img src="./assets/giro.png" class="d-block w-100" alt="..." style="height:20vh;">
   <br><br>
   <a href="GForm.jsp" class="button">기록 추가하기</a> </center>
   <br>
  <div><br></div>
  <select id="orderSelect" class="form-select" aria-label="Default select example" onchange="changeOrder()" style="width:250px; margin-left: 974px">
      <option value="asc" <%= (request.getParameter("order") != null && request.getParameter("order").equals("asc")) ? "selected" : "" %>>오래된 게시글부터</option>
      <option value="desc" <%= (request.getParameter("order") != null && request.getParameter("order").equals("desc")) ? "selected" : "" %>>최근 게시글부터</option>
    </select>
    <div><br></div>
    <a href="Gsearch.jsp" class="button" style="margin-left: 1010px">제목으로 검색하러 가기</a>
  <div><br></div>
  <center>
    
   <% 
   GDao adao = new GDao();
   String order = request.getParameter("order");
   if (order == null || order.isEmpty()) {
       order = "asc"; // Default sorting order: ascending
   }
   ArrayList<GDo> aList = adao.getAllAddr(order);

   if (order.equals("desc")) {
       Collections.sort(aList, new Comparator<GDo>() {
           public int compare(GDo o1, GDo o2) {
               return o2.getCreatedAt().compareTo(o1.getCreatedAt());
           }
       });
   }
   %>

   <div class="card-container">
   <% for (GDo ado : aList) { %>

   <div class="card" style="width: 400px">
      <div class="card-header" style="background-color: #D5DBDB ">
         <%= ado.getNum() %>
      </div>
      <div class="card-body">
         <h4 class="card-num">제목: <%= ado.getTitle() %></h4>
         <h5 class="card-text">내용: <%= ado.getContent() %></h5>
         <p class="card-date"><%= ado.getCreatedAt() %></p>
         <a href="addrInfo.jsp?num=<%= ado.getNum() %>" class="btn btn-primary" style="background-color: #34495E">상세보기</a>
      </div>
   </div>

   <% } %>
   </div>

   <br><br><br>
   </center>
</body>
</html>

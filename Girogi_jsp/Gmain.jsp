<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS 라이브러리 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- JS 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
h2 {
  font-family: 'Times New Roman', sans-serif;
  font-size: 44px;
  font-weight: bold;
  color: #553C0A;
}
</style>
</head>
<body>
<center>
<div class="container">
	<%@ include file="Gnav.jsp" %>
	<h2>MY GIROGI HOME</h2>
	<%@ include file="Gcarousel.jsp" %>
	<%-- <%@ include file="service.jsp" --%>
	<hr>
	<%@ include file="Gcount.jsp" %>
</div>
<div>
<br><br><br>
</div>
	</center>
</body>
</html>
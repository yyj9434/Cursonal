<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cusonal</title>
	<link rel="stylesheet" href="css/joinSuccess.css">
	<link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
</head>
<body>

<header>
	<jsp:include page="top.jsp"/>
</header>

<hr style="color: gray; opacity: 0.5;">

<div align="center">
	<h2>회원가입을 축하드립니다!</h2>
	<h4>Cusonal을 마음껏 이용해보세요.</h4>
</div>

<div align="center">
	<input type="button" value="로그인하러 가기" onClick="location='login_join.jsp'" style="background-color: rgb(182, 210, 239)">
	<input type="button" value="홈으로 가기" onClick="location='index.jsp'" style="background-color: rgb(238, 221, 255)">
</div>

<footer>
	<jsp:include page="footer.jsp"/>
</footer>

</body>
</html>
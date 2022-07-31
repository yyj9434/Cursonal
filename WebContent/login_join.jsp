<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login & Join</title>
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
</head>
<body>
	<header>
		<jsp:include page="top.jsp" flush="false"/>
	</header>
	
	<section>
		<jsp:include page="login.jsp" flush="false"/>
	</section>
	
	<aside>
		<jsp:include page="join.jsp" flush="false"/>
	</aside>

	<footer>
    	<jsp:include page = "footer.jsp" flush = "false" />
    </footer>
</body>
</html>
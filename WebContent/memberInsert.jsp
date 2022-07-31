<%@ page contentType="text/html;charset=utf-8"%>

<% 
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="regBean" class="cusonal.RegisterBean" scope="session" />
<jsp:useBean id="regMgr" class="cusonal.RegisterMgr" scope="session" />
<jsp:setProperty name="regBean" property="*"/>
<% boolean flag = regMgr.insertMember(regBean);
%>
<html>
<head>
<title>회원가입 확인</title>
<link href="style.css" rel="stylesheet" type="text/css">

<html>
	<head>
		<title>회원 추가</title>
	</head>
	<body>
		<jsp:getProperty property="username" name="regBean" />
		<% if(flag) %>
			<%= regBean.getUsername() %>의 레코드를 CN_member 테이블에 삽입했습니다.
	</body>
	<a href="index.jsp">홈으로 돌아가기</a>
</html>


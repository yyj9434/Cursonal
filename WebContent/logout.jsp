<%@ page contentType="text/html;charset=UTF-8"%>
<%
	session.invalidate();
%>

<script>
    alert("로그아웃되었습니다");
	location.href="login_join.jsp";
</script>



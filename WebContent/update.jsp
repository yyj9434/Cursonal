<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	if(session.getAttribute("id") == null) {
		response.sendRedirect("login_join.jsp");
	}else{
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/update.css">
<title>회원정보 수정</title>
</head>
<body>

<header>
    <jsp:include page="loginSuccessTop.jsp" flush="false" />
</header>

<hr style="color: gray; opacity: 0.5;">


   <form action="updateProcess.jsp" method="post">
      <table class="table" border="1" align="center">
         <tr>
            <th>아이디</th>
            <td><input type="text" name="id"  size="20"></td>
          </tr>
          <tr>
             <th>비밀번호</th>
             <td><input type="text" name="pw" size="20"></td>
          </tr>
          <tr>
            <th>이름</th>
            <td><input type="text" name="username"  size="10"></td>
          </tr>
          <tr>
            <th>생년월일</th>
            <td><input type="text" name="birth" size="10"></td>
          </tr>
          <tr>
            <th>이메일</th>
            <td><input type="text" name="email"  size="30"></td>
          </tr>
          <tr>
            <th>거주 지역</th>
            <td><input type="text" name="location" size="40"></td>
          </tr>
          <tr>
            <th colspan="2"><input id="edit" type="submit" value="변경"></th>
         </tr>   
      </table>
   </form>
   
  <footer>
     <jsp:include page="footer.jsp"/>
  </footer>
  
</body>
</html>
<%}%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/top.css">
 <link rel="stylesheet" href="css/section.css">
<link rel="stylesheet" href="css/nav.css">
<meta charset="UTF-8">
<title>Cusonal</title>
<style>
hr {
   margin-top: 50px;
}
</style>

<header style="text-align: right;">

<%
   if(session.getAttribute("id") == null) {
%>
      <jsp:include page="top.jsp" flush="false" />
<%
   } else {
%>
      <jsp:include page="loginSuccessTop.jsp" flush="false" />
<%
   }
%>
</header>
<div>

   <nav>
   <jsp:include page="nav.jsp" flush="false" />
   </nav>
   
   <hr>
   
   <section>
   <jsp:include page="section.jsp" flush="false"/>
   </section>
   
</div>
<footer>
   <jsp:include page="footer.jsp" flush="false" />
</footer>
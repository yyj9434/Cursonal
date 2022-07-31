<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, cusonal.*"%>
<link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">

<%
   if(session.getAttribute("id") == null) {
      response.sendRedirect("login_join.jsp");
   }else{
%>

<jsp:useBean id="proMgr" class="cusonal.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script language="JavaScript" src="script.js"></script>
<link rel="stylesheet" href="css/section.css">
<title>Clothes_Top</title>
</head>
<body>
<header>
   <jsp:include page="loginSuccessTop.jsp" flush="false" />
</header>

<hr style="color:gray; opacity: 0.5; margin-top: 50px;">

<%
      Vector vResult= proMgr.getProductList();
      if(vResult.size() ==0){
      %>
      <div align="center" style="margin-top: 10px;">등록된 상품이 없습니다</div>
      <%}else{
         for(int i=0; i<vResult.size(); i++){
         ProductBean product = (ProductBean)vResult.get(i);
      %>

   <div id="items">
   <a href="javascript:productDetail('<%=product.getNum()%>')">
      <img src="data/<%=product.getImage()%>" alt="item" height="250px" width="350px">
      <span id="i_name" align="center"><h4><%=product.getName()%></h4></span><br>
      <span style="display: inline-block; text-align: center;">
         <%=product.getDetail() %><br>
         <%=product.getPrice() %></span>
   </a>
      </div>
            <%}
         }%>
      <form name="detail" method="post" action="custom.jsp" >
         <input type="hidden" name="num">
         </form>



<footer>
   <jsp:include page="footer.jsp" flush="false" />
</footer>
</body>
</html>
<%}%>
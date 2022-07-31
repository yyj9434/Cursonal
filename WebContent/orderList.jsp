<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, cusonal.*" %>
<jsp:useBean id="proMgr" class="cusonal.ProductMgr" />
<jsp:useBean id="orderMgr" class="cusonal.OrderMgr" />
<jsp:useBean id="regMgr" class="cusonal.RegisterMgr" />
<link rel="stylesheet" href="css/table.css">

<%
   if(session.getAttribute("id") == null) {
      response.sendRedirect("login_join.jsp");
   }else{
%>

<html>
<head>
<title>주문 내역</title>

<script language="JavaScript" src="script.js"></script>
</head>

<body>

<header>
   <jsp:include page="loginSuccessTop.jsp" flush="false" />
</header>
    
<hr>
   <%
      String id = (String) session.getAttribute("id");
      Vector vResult = orderMgr.getOrder(id);
      %>
      <table class="table" width="100%" border="0" style="margin-top: 30px;">
      <tr> 
      <th align="center">주문번호</th>
      <th align="center">제품</th>
      <th align="center">주문수량</th>
      <th align="center">주문날짜</th>
      <th align="center">주문상태</th>
      </tr>
      
      <% if(vResult.size() ==0){
      %>
      
      주문하신 물품이 없습니다.
      
      <%}else{
         for(int i=0; i< vResult.size(); i++){
         OrderBean order = (OrderBean)vResult.get(i);
         ProductBean product = proMgr.getProduct(order.getProduct_num());
      %>
      <tr> 
      <td align="center"><%=order.getNum()%></td>
      <td align="center"><a href="javascript:productDetail('<%=order.getProduct_num()%>')"><%=product.getName()%></a></td>
      <td align="center"><%=order.getQuantity()%></td>
      <td align="center"><%=order.getDate()%></td>
      <td align="center">
      <%
      switch(Integer.parseInt(order.getState())){
      case 1 : out.println("접수중");
      break;
      case 2 : out.println("접수");
      break;
      case 3 : out.println("입금확인");
      break;
      case 4 : out.println("배송준비");
      break;
      case 5 : out.println("배송중");
      break;
      default : out.println("완료");
      }
      %> 
      </td>
      </tr>
      <%}
      }%>
      </table> 
   
   <form name="detail" method="post" action="productDetail.jsp" >
   <input type="hidden" name="num">
   </form>
   
   <footer>
      <jsp:include page="footer.jsp" flush="false" />
   </footer>
</body>
</html>
<%}%>

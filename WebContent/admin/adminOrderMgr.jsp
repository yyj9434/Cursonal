<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, cusonal.*"%>
<jsp:useBean id="orderMgr" class="cusonal.OrderMgr" />
<jsp:useBean id="proMgr" class="cusonal.ProductMgr" />

<html>
<head>
<title>Admin 주문 현황/확인</title>
<link rel="stylesheet" href="../css/table.css">
<link rel="stylesheet" href="../css/footer.css">
<script language="JavaScript" src="../script.js"></script>
</head>
 
<body>
<header>
   <jsp:include page="managerTop.jsp" flush="false" />
</header>

<hr style="color: gray; opacity: 0.5;">
 
   <table align="center">
   <tr> 
   <td align="center">

      <table class="table" width="1440px" cellpadding="0" cellspacing="0" border="0">
      <tr align="center" > 
         <th>주문번호</th>
         <th>주문자</th>
         <th>제품</th>
         <th>주문수량</th>
         <th>주문날짜</th>
         <th>주문상태</th>
         <th>보기</th>
      </tr>
      <%
      Vector vResult = orderMgr.getOrderList();
      if(vResult.size() ==0){
      %>
      <tr> 
      <td align="center" colspan="7">주문 내역이 없습니다</td>
      </tr>
      <%}else{
         for(int i=0; i< vResult.size(); i++){
         OrderBean order = (OrderBean)vResult.get(i);
         ProductBean product = proMgr.getProduct(order.getProduct_num());
      %>
      <tr> 
      <td align="center"><%=order.getNum()%></td>
      <td align="center"><%=order.getId()%></td>
      <td align="center"><%=product.getName()%></td>
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
      }%>
      </td>
      <td align="center" ><a href="javascript:orderDetail('<%=order.getNum()%>')" style="color: blue;">상세보기</a></td>
      </tr>
      <%}
      }%>
      </table>
   
   </td>
   </tr>
   </table>
   

   <form name="detail" method="post" action="adminOrderDetail.jsp" >
   <input type="hidden" name="num">
   </form>
   
   <footer>
      <jsp:include page="../footer.jsp" flush="false"/>
   </footer>

</body>
</html>
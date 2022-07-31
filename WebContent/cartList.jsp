<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*, cusonal.*" %>
<jsp:useBean id="cartMgr" class="cusonal.CartMgr" scope="session"/>
<jsp:useBean id="proMgr" class="cusonal.ProductMgr" />
<%
   if(session.getAttribute("id") == null) {
      response.sendRedirect("login_join.jsp");
   }else{
%>   
<html>
<head>
<title>장바구니</title>
<script language="JavaScript" src="script.js"></script>
<style>
.btn {
   border: none;
   font-size: 17px;
   padding: 8px 15px;
}
</style>
<link rel="stylesheet" href="css/table.css">
</head>

<body>

<header>
   <jsp:include page="loginSuccessTop.jsp" flush="false" />
</header>

<hr style="color:gray; opacity: 0.5; margin-top: 50px;">

      <table class="table" width="100%" align="center">
      <tr>
      <th align="center">제품</th>
      <th align="center">수량</th>
      <th align="center">가격</th>
      <th align="center">수정/삭제</th>
      <th align="center">조회</th>
      </tr>
      <%
      int totalPrice =0 ;      
      Hashtable hCart = cartMgr.getCartList();
      if(hCart.size() == 0){
      %>
      <tr><td colspan="5" align="center">선택하신 물품이 없습니다.</td></tr>   

      <%
      }else{
      Enumeration hCartKey=hCart.keys();
         while(hCartKey.hasMoreElements()){
         OrderBean order = (OrderBean)hCart.get(hCartKey.nextElement());
         ProductBean product = proMgr.getProduct(order.getProduct_num());
         int price = Integer.parseInt(product.getPrice());
         int quantity = order.getQuantity();
         int subTotal = price*quantity;
         totalPrice += price*quantity;
         
      %>
      <form method="post"action="cartProcess.jsp">
      <input type="hidden" name="product_num" value="<%=product.getNum()%>">
      <input type="hidden" name="flag">
      <tr> 
      <td align="center">   <%=product.getName()%></td>
      <td align="center"><input type=text name=quantity value="<%=order.getQuantity()%>" size=5 >개</td>
      <td align="center"><%=subTotal+""%></td>
      <td align="center">
      <input class="btn" type="button" value="수정" size="3" onclick="javascript:cartUpdate(this.form)"> /
      <input class="btn" type="button" value="삭제" size="3" onclick="javascript:cartDelete(this.form)">
      </td>
      <td align="center"><a href="javascript:productDetail('<%=product.getNum()%>')">상세보기</a></td>
      </tr>
      </form>
      <%}%>
      <tr> 
      <td colspan="4" align="right">총 금액 : <%=totalPrice%>원</td>
      <td align="center"><a href="orderProcess.jsp">주문하기</a></td>
      </tr>
      <%
      }
      %>         
         
      </table>

   
   </td>
   </tr>
   </table>
   
   <form name="detail" method="post" action="custom.jsp" >
   <input type="hidden" name="num">
   </form>   
      
      
      <footer>
   <jsp:include page="footer.jsp" flush="false" />
</footer>
</body>
</html>
<%}%>
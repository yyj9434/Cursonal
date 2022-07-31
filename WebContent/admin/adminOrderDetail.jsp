<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, cusonal.*"%>
<jsp:useBean id="orderMgr" class="cusonal.OrderMgr" />
<jsp:useBean id="proMgr" class="cusonal.ProductMgr" />

<%
OrderBean order = orderMgr.getOrderDetail(Integer.parseInt(request.getParameter("num")));
ProductBean product = proMgr.getProduct(order.getProduct_num());
%>

<html>
<head>
<title>주문 상세 관리</title>
<script language="JavaScript" src="../script.js"></script>
<style>
input {
   border: none;
   font-size: 17px;
   padding: 8px 15px;
}
</style>
<link rel="stylesheet" href="../css/table.css">
</head>
 
<body>
<header>
   <jsp:include page="managerTop.jsp" flush="false" />
</header>

<hr style="color: gray; opacity: 0.5;">
 
      <form method=post name="order" action="adminOrderProcess.jsp">
      <table class="table" width="100%" align="center" border="0">
      <tr> 
      <th colspan="2" align="center">주문 상세내역</th>
      </tr>
      <tr> 
      <th align="center" style="width: 400px;">고객아이디</th>
      <td align="center" ><%=order.getId()%></td>
      </tr>
      <tr> 
      <th align="center" style="width: 400px;">주문번호</th>
      <td align="center"><%=order.getNum()%></td>
      </tr>
      <tr> 
      <th align="center" style="width: 400px;">제품번호</th>
      <td align="center"><%=product.getNum()%></td>
      </tr>            
      <tr> 
      <th align="center" style="width: 400px;">제품이름</th>
      <td align="center"><%=product.getName()%></td>
      </tr>
      <tr> 
      <th align="center" style="width: 400px;">제품가격</th>
      <td align="center"><%=product.getPrice()%>원</td>
      </tr>
      <tr> 
      <th align="center" style="width: 400px;">주문수량</th>
      <td align="center"><%=order.getQuantity()+""%>개</td>
      </tr>
      <tr> 
      <th align="center" style="width: 400px;">재고수량</th>
      <td align="center"><%=product.getStock()%>개</td>
      </tr>      
      <tr> 
      <th align="center" style="width: 400px;">주문날짜</th>
      <td align="center"><%=order.getDate()%></td>
      </tr>
      <tr> 
      <th align="center" style="width: 400px;">금액</th>
      <td align="center"><%=order.getQuantity()*Integer.parseInt(product.getPrice())%>원</td>
      </tr>
      <tr> 
      <th align="center" style="width: 400px;">주문상태</th>
      <td align="center">
      <select name="state">
      <option value="1">접수중</option>
      <option value="2">접수</option>
      <option value="3">입금확인</option>
      <option value="4">배송준비</option>
      <option value="5">배송중</option>
      <option value="6">완료</option>
      </select>
      <script>document.order.state.value=<%=order.getState()%></script>
      </td>
      </tr>
      <tr> 
      <td colspan="2" align="center">
      <input type="button" value="수정" size="3" onclick="javascript:orderUpdate(this.form)">
      <input type="button" value="삭제" size="3" onclick="javascript:orderDelete(this.form)">
      </td>
      </tr>
      </table>
      <input type="hidden" name="num" value="<%=order.getNum()%>">
      <input type="hidden" name="flag">
      </form>      
   
   
</body>
</html>
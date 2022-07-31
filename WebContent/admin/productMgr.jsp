<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, cusonal.*"%>
    <link rel="stylesheet" href="../css/top.css">
 <link rel="stylesheet" href="../css/section.css">
  <link rel="stylesheet" href="../css/nav.css">
<jsp:useBean id="proMgr" class="cusonal.ProductMgr" />

<!DOCTYPE html>
<html>
<head>
<title>상품 목록</title>
<script language="JavaScript" src="../script.js"></script>
<link rel="stylesheet" href="../css/memberList.css">
</head>
 
<body>

<header id="p_header">
   <jsp:include page="managerTop.jsp" flush="false" />
</header>

<hr style="color: gray; opacity:0.5;">

<table class="table" style="margin-left : auto; margin-right : auto; width : 1440px;">
      <tr> 
      <th align="center">이름</th>
      <th align="center">가격</th>
      <th align="center">날짜</th>
      <th align="center">재고</th>
      <th align="center">&nbsp;</th>
      </tr>
      <%
      Vector vResult= proMgr.getProductList();
      if(vResult.size() ==0){
      %>
      <tr> 
      <td align="center" colspan="5">등록된 상품이 없습니다.</td>
      </tr>
      <%}else{
         for(int i=0; i<vResult.size(); i++){
         ProductBean product = (ProductBean)vResult.get(i);
      %>
      <tr> 
      <td align="center"><%=product.getName()%></td>
      <td align="center"><%=product.getPrice()%></td>
      <td align="center"><%=product.getDate()%></td>
      <td align="center"><%=product.getStock()%></td>
      <td align="center"><a href="javascript:productDetail('<%=product.getNum()%>')">상세보기</a></td>
      </tr>
      <%}
      }%>
      <tr>
      <td colspan="5" align="center"><a href="productInsert.jsp">상품등록</a></td>
      </tr>
      </table>
   
   <form name="detail" method="post" action="productDetail.jsp" >
   <input type="hidden" name="num">
   </form>

</body>
</html>
   
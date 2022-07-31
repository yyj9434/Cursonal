<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@ page import="java.util.*, cusonal.*"%>
    
<jsp:useBean id="orderMgr" class="cusonal.OrderMgr" />
<jsp:useBean id="proMgr" class="cusonal.ProductMgr" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/section.css">
<link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
<title>section_BEST</title>
</head>
<body>
<section>
  <div class="best">BEST</div><div class="underline"></div>
  
  
  <%
     Vector vResult = orderMgr.getBestList();
     for(int i = 0; i<6; i++) {
        OrderBean order = (OrderBean)vResult.get(i);
        int num = order.getProduct_num();
        ProductBean product= proMgr.getProduct(num);
  %>
  
         <div id="items">
         <img src="data/<%=product.getImage()%>" alt="item1" height="250px" width="350px">
         <a href="javascript:productDetail('<%=product.getNum()%>')">
         <span id="i_name"><h4><%=product.getName()%></h4></span><br>
         <span>
            <%=product.getDetail() %><br>
            <%=product.getPrice() %>
         </span>
      </a>
      </div>
      <% } %>
</section>
</body>
</html>
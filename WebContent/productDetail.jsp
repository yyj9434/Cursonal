<%@ page contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="java.util.*, cusonal.*"%>
<jsp:useBean id="proMgr" class="cusonal.ProductMgr" />

<%ProductBean product= proMgr.getProduct(Integer.parseInt(request.getParameter("num")));%>

<html>
<head>
<title><%=product.getName()%> - 상세</title>
<link rel="stylesheet" href="css/table.css">
<script language="JavaScript" src="script.js"></script>
</head>

<body>
   <header>
         <jsp:include page="loginSuccessTop.jsp"/>
   </header>
   
   <hr style="color: gray; opacity: 0.5;">

      <table class="table" width="100%" align="center" border="0">
      <tr> 
      <th colspan="3" align="center"><span style="font-size: 20px;"><%=product.getName()%></span></th>
      </tr>
      <tr> 
      <td width="20%">
      <img src="data/<%=product.getImage()%>" height="250" width="350">
      </td>
      <td width="30%" valign="top">
         <form name="cart" action="CartProc.jsp">
         <table border="0" width="100%" heigth="100%">
         <tr>
         <td><span style="font-weight: bold;">상품이름 : </span><%=product.getName()%></td>
         </tr>         
         <tr>
         <td><span style="font-weight: bold;">가    격 : </span><%=product.getPrice()%></td>
         </tr>
         <tr>
         <td><span style="font-weight: bold;">수    량 : </span><%=product.getStock()%></td>
         </tr>
         <tr>
         </tr>
         </table>
         <input type=hidden name=product_num value=<%=product.getNum()%>>         
         </form>
      
      </td>
      <td width="50%" valign="top">
      <span style="font-weight: bold;">상세설명</span><br><pre style="font-size: 16px;"><%=product.getDetail()%></pre>
      </td>
      </tr>
      </table>
</body>
</html>
<%@ page contentType = "text/html; charset = utf-8" pageEncoding = "utf-8" %>
<link rel="stylesheet" href="css/top.css">
<%@ include file = "loginCheck.jspf" %>
<link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
<script language="JavaScript" src="script.js">
	document.querySelector('.logout').addEventListener('click', function() {
		session.invalidate();
	});
</script>

<header>
  <div id="user_name"><span><%= id %></span>님, 어서오세요!</div>
  <ul>
    <li class="dropdown">CLOTHES
       <div class="dropdown-content">
          <a href="clothesTop.jsp">TOP</a>
          <a href="#">BOTTOM</a>
      </div>
    </li>
    <li class="dropdown">PHONE ACC
       <div class="dropdown-content">
          <a href="#">PHONE CASE</a>
          <a href="#">PHONE ETC</a>
       </div>
      </li>
    <li class="dropdown">FASHION ACC
       <div class="dropdown-content">
          <a href="#">BAG</a>
          <a href="#">POUCH</a>
          <a href="#">CAP</a>
       </div>
      </li>
    <li class="title"><a href="index.jsp"><h1>Cusonal</h1></a></li>
    <li class="dropdown">BOARD
       <div class="dropdown-content">
          <a href="designShare.jsp">DESIGN SHARE</a>
          <a href="#">Q&A</a>
       </div>
      </li>
    <li class="dropdown"><a href="#">MY PAGE</a>
       <div class="dropdown-content">
          <a href="update.jsp">MODIFY</a>
          <a href="cartList.jsp">CART</a>
          <a href="orderList.jsp">ORDER</a>
         </div>
    <li class="logout"><a href="logout.jsp">LOGOUT</a></li>
  </ul>
</header>
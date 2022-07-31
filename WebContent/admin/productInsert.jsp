<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>상품 등록</title>
    <link rel="stylesheet" href="../css/table.css">
<script language="JavaScript" src="script.js"></script>
<style>
input {
   outline: none;
   border: none;
   font-size: 16px;
   color: black;
}
</style>
</head>

<body>
<header>
   <jsp:include page="managerTop.jsp" flush="false" />
</header>

<hr>

      <form method="post" action="productProcess.jsp?flag=insert" enctype="multipart/form-data">
      <table class="table" width="100%" align="center" border="0">
      <tr> 
      <th colspan="2" align="center">상품 등록</th>
      </tr>
      <tr> 
      <th align="center" style="width: 400px;">상품이름</th>
      <td align="left"><input type="text" name="name" size="40"></td>
      </tr>
      <tr> 
      <th align="center" style="width: 400px;">상품가격</th>
      <td align="left"><input type="text" name="price" size="10">원</td>
      </tr>
      <tr> 
      <th align="center" style="width: 400px;">상품설명</th>
      <td><textarea rows="10" cols="150" name="detail" style="resize: none;"></textarea></td>
      </tr>
      <tr> 
      <th align="center" style="width: 400px;">상품수량</th>
      <td><input type="text" name="stock" size="5">개</td>
      </tr>
      <tr> 
      <th align="center" style="width: 400px;">상품이미지</th>
      <td><input type="file" name="image"></td>
      </tr>
      <tr> 
      <td colspan="2" align="center"> 
      <input class="insert_btn" type="submit" value="상품등록" style="padding: 6px 10px;">
      <input class="insert_btn" type="reset" value="다시쓰기" style="padding: 6px 10px;">
      </td>
      </tr>
      </table>
      </form>

</body>
</html>
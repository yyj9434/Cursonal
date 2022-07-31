<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/write.css">
<link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
<script language = "javascript">
function writeCheck() {
   var form = document.writeform;
   
   if (!form.name.value) {
      alert("이름을 적어주세요");
      form.name.focus();
      return;
   }
   if (!form.pw.value) {
      alert("비밀번호를 적어주세요");
      form.pw.focus();
      return;
   }
   if (!form.title.value) {
      alert("제목을 적어주세요");
      form.title.focus();
      return;
   }
   if (!form.memo.value) {
      alert("내용을 적어주세요");
      form.memo.focus();
      return;
   }
   form.submit();
}
</script>
<title>Write</title>
</head>
<body>

<header>
   <jsp:include page="loginSuccessTop.jsp"/>
</header>

<hr style="color: gray; opacity: 0.5;">

<form name="write" method="post" action="writeProcess.jsp">
         <table align="center">
            <tr>
               <td align="center" class="category">제목</td>
               <td><input class="writeSize" name="title" type="text" required></td>
            </tr>
            <tr>
               <td align="center" class="category">이름</td>
               <td><input class="writeSize" name="name" ></td>
            </tr>
            <tr>
               <td align="center" class="category">비밀번호</td>
               <td><input class="writeSize" type="password" name="pw" ></td>
            </tr>
            <tr>
               <td align="center" class="category">내용</td>
               <td><textarea id="memo" name="memo" ></textarea></td>
            </tr>         
         </table>


<div align="center">
   <input class="btns" type="submit" value="등록" OnClick="javascript:writeCheck();">
   <input class="btns" type="button" value="취소" OnClick="javascript:history.back(-1);">
</div>
</form>

<footer>
   <jsp:include page="footer.jsp"/>
</footer>
</body>
</html>
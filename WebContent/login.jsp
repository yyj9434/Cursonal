<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
    <title>Login</title>
  </head>
  <body>
    <section>
      <div id="login">
      
        <h2 id="underline">로그인</h2>
        <form method=post action="loginProcess.jsp">
        <div>ID<input id="id" name="id" type="text" placeholder="ID를 입력하세요." ></div>
        <div>PW<input id="pw" name="pw" type="password" placeholder="비밀번호를 입력하세요."></div>
        <input id="button" type="submit" value="로그인">
        </form>
        <div class="img">
          <img src="img/facebook.jpg" alt="facebook">
          <img src="img/instagram.jpg" alt="instagram">
          <img src="img/kakao.jpg" alt="kakaotalk">
          <img src="img/naver.jpg" alt="naver">
        </div>
        <p>페이스북 | 인스타그램 | 카카오톡 | 네이버  로 로그인</p>
      </div>
    </section>
  </body>
</html>
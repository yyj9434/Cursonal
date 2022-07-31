<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="css/join.css">
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">

<title>Join</title>
</head>
<body>
    <aside>
      <div id="join">
        <h2 id="underline">회원가입</h2>
        <form method=post action="joinProcess.jsp">
          <div class="form"><span>아이디</span><input class="other" type="text" name="id" placeholder="ID를 입력하세요." required></div>
          <div class="form"><span>비밀번호</span><input class="other" type="password" name="pw" placeholder="비밀번호를 입력하세요."required></div>
          <div class="form"><span>비밀번호 확인</span><input class="other" type="password" name="pwCorrection" placeholder="한 번 더 입력해 주세요."required></div>
          <div class="form"><span>이름</span><input class="other" type="text" name="username" placeholder="이름을 입력하세요."required></div>
          <div class="form"><span>생년월일</span><input class="other" type="date" name="birth"></div>
          <div class="form"><span>이메일</span><input class="other" type="email" name="email" placeholder="이메일 주소를 입력하세요."required></div>
          <div class="form"><span>성별</span>
          <select name="gender">
             <option>성별</option>
             <option value="남">남</option>
             <option value="여">여</option>
          </select>
          </div>
          <div class="form"><span>거주 지역</span>
            <select name="location">
              <option value="state">시/도</option>
              <option value="인천광역시">인천광역시</option>
              <option value="서울특별시">서울특별시</option>
              <option value="대전광역시">대전광역시</option>
              <option value="대구광역시">대구광역시</option>
              <option value="광주광역시">광주광역시</option>
              <option value="울산광역시">울산광역시</option>
              <option value="부산광역시">부산광역시</option>
              <option value="제주특별자치도">제주특별자치도</option>
              <option value="경기도">경기도</option>
              <option value="충청북도">충청북도</option>
              <option value="충청남도">충청남도</option>
              <option value="강원도">강원도</option>
              <option value="경상북도">경상북도</option>
              <option value="경상남도">경상남도</option>
              <option value="전라북도">전라북도</option>
              <option value="전라남도">전라남도</option>
            </select>
          </div>
          <input id="button" type="submit" value="회원가입" >
        </form>
          <img src="img/facebook.jpg" alt="facebook">
          <img src="img//instagram.jpg" alt="instagram">
          <img src="img//kakao.jpg" alt="kakaotalk">
          <img src="img//naver.jpg" alt="naver">
        <p>페이스북 | 인스타그램 | 카카오톡 | 네이버  로 회원가입</p>
      </div>
    </aside>
</body>
</html>
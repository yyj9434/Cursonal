<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/nav.css">
<link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
<title>navigator</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>

<nav>
  <div class="slideshowcontainer">
    <span id="slideshowimage-1"></span>
    <span id="slideshowimage-2"></span>
    <span id="slideshowimage-3"></span>
    <div class="imagecontainer">
      <a href="#"><img src="img/banner1.jpg" class="slideshowimage" style="width:1440px;height:600px;"></a>
      <a href="#"><img src="img/banner2.jpg" class="slideshowimage" style="width:1440px;height:600px;"></a>
      <a href="#"><img src="img/banner3.jpg" class="slideshowimage" style="width:1440px;height:600px;"></a>
    </div>
  </div>
</nav>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, cusonal.*"%>
<jsp:useBean id="proMgr" class="cusonal.ProductMgr" />

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/memberList.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
<title>주문/제작</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
 <script>
   var dragobject={
   z: 0, x: 0, y: 0, offsetx : null, offsety : null, targetobj : null, dragapproved : 0,
   initialize:function(){
   document.onmousedown=this.drag
   document.onmouseup=function(){this.dragapproved=0}
   },
   drag:function(e){
   var evtobj=window.event? window.event : e
   this.targetobj=window.event? event.srcElement : e.target
   if (this.targetobj.className=="drag"){
   this.dragapproved=1
   if (isNaN(parseInt(this.targetobj.style.left))){this.targetobj.style.left=0}
   if (isNaN(parseInt(this.targetobj.style.top))){this.targetobj.style.top=0}
   this.offsetx=parseInt(this.targetobj.style.left)
   this.offsety=parseInt(this.targetobj.style.top)
   this.x=evtobj.clientX
   this.y=evtobj.clientY
   if (evtobj.preventDefault)
   evtobj.preventDefault()
   document.onmousemove=dragobject.moveit
   }
   },
   moveit:function(e){
   var evtobj=window.event? window.event : e
   if (this.dragapproved==1){
   this.targetobj.style.left=this.offsetx+evtobj.clientX-this.x+"px"
   this.targetobj.style.top=this.offsety+evtobj.clientY-this.y+"px"
   return false
   }
   }
   }

   dragobject.initialize();


$(function() {
  $("#upload_text").on('click', function(){
    $("#myImage").resizable();
    $("#select").resizable();
    $('#dragText').draggable();
    $('#dragText2').draggable();
  });
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#uploadImg').attr('src', e.target.result);
        }
      reader.readAsDataURL(input.files[0]);
    }
}

/* TEXT */

if(window.addEventListener){
    window.addEventListener('load', Init, false);
}
var canvas, context, myText,msgDiv
var isFill = true;
function Init() {
  canvas = document.getElementById('cv');
  context = canvas.getContext('2d');
  context.font = eval("'"+ document.getElementById('fontSize').value +'px '+ document.getElementById('fontFace').value+"'");
  context.textBaseline = "top";
  myText = document.getElementById('myText');
  myText.focus();
  msgDiv = document.getElementById("msgDiv");
}
function inputText(keyCode){
  msgDiv.innerText = keyCode;
  $("#msgDiv").hide();
  //글자의 가로위치를 구하기 위해 현재 입력된 문자열의 너비를 구한다
  var textWidth = context.measureText(myText.value).width;
  drawText(String.fromCharCode(keyCode), textWidth);
}
function inputBackSpace(keyCode){
  if(keyCode == 8 || keyCode == 46){ //백스페이스 키와 Delete키를 받기 위한 함수
    clearCanvas();
    drawText(myText.value,0);
  }
}
function drawText(text, posX){
  if(!isFill){ context.strokeText(text, posX , 0); }
  else{ context.fillText(text, posX , 0); }
}
function chkFill(){
  isFill = myForm.isFill[0].checked;
  clearCanvas();
  drawText(myText.value,0);
}
function changeFont(){
  clearCanvas();
  context.font = eval("'"+ document.getElementById('fontSize').value +'px '+ document.getElementById('fontFace').value+"'");
  drawText(myText.value,0);
}
function changeColor(flag){
  clearCanvas();
  if(flag == 1){
    context.fillStyle = document.getElementById('fontColor').value;
  }
  else{
  context.strokeStyle = document.getElementById('strokeColor').value;
}
drawText(myText.value,0);
}
function clearCanvas(){
  context.clearRect(0,0,canvas.width, canvas.height);
}
function convertImage(){
  var image = new Image();
  var myImage = document.getElementById('myImage');
  myImage.src = canvas.toDataURL();
}


function PrintDiv(div){
   div = div[0]
   html2canvas(div).then(function(canvas){
      var myImage = canvas.toDataURL();
      downloadURI(myImage, "저장이미지이름.png")
   });
}

function downloadURI(uri, name){
   var link = document.createElement("a")
   link.download = name;
   link.href = uri;
   document.body.appendChild(link);
   link.click();
}

function uploadImgPreview() {

   let fileInfo = document.getElementById("upImgFile").files[0];
   let reader = new FileReader();

    reader.onload = function() {
        document.getElementById("select").src = reader.result;
        document.getElementById("select").innerText = reader.result;
    };

   if( fileInfo ) {

        reader.readAsDataURL( fileInfo );
    }
}



</script>
</head>

<body>
  <header>
   <jsp:include page = "loginSuccessTop.jsp" flush = "false" />
</header>

<nav>
<%ProductBean product= proMgr.getProduct(Integer.parseInt(request.getParameter("num")));%>
 <div id="make_zone">
    <div id="make_item">

         <div id = drag>
           <div id = "dragImg">
           <img src="data/<%=product.getImage() %>" width=200px;></div>
             <div id = "dragText" >         
             <img id="select" src="">
            <div id="selectUrl"></div>
              </div>
             <div id = "dragText2"><img id="myImage"></div>      
         </div>     
   </div>

   <div id="make_tools">
    <input type="file" id="upImgFile" onChange="uploadImgPreview();" accept="image/*">
    <div class="save_btn"><button onclick="PrintDiv($('#drag'));">이미지로 저장</button></div>

    <br>
     /* TEXT */

      <form name="myForm">
        <canvas id="cv" width="200" height="70" style="position: relative; border: 1px solid #000;"></canvas>   
    
        <button onclick="clearCanvas()">Clear</button>
        <input type="button" id="upload_text" name="upload_text" onclick="convertImage()" value="이미지로변환">
         <br>
   

        <br>
        <input type="radio" name="isFill" value="Fill" onchange="chkFill();" checked>Fill
        <input type="radio" name="isFill" value="Stroke" onchange="chkFill();">Stroke
        <br>
        Font: <input id="fontSize" type="range" min="10" max="60" step="5" value="50" onchange="changeFont();" />
              <select id="fontFace" onchange="changeFont();">
               <option value="Tahoma" selected>Tahoma</option>
               <option value="Verdana">Verdana</option>
               <option value="Gulim">Gulim</option>
               <option value="Georgia">Georgia</option>
               <option value="Symbol">Symbol</option>
               <option value="Terminal">Terminal</option>
              </select>
        <br>
        Fill Color: <select id="fontColor" onchange="changeColor(1);">
               <option value="Black" selected>Black</option>
               <option value="Red">Red</option>
               <option value="Blue">Blue</option>
               <option value="Green">Green</option>
               <option value="Yellow">Yellow</option>
              </select>
        Stroke Color: <select id="strokeColor" onchange="changeColor(2);">
               <option value="Black" selected>Black</option>
               <option value="Red">Red</option>
               <option value="Blue">Blue</option>
               <option value="Green">Green</option>
               <option value="Yellow">Yellow</option>
              </select>
        <p>
        <input type="text" id="myText" size="60" onkeypress="inputText(event.keyCode);" onkeyup="inputBackSpace(event.keyCode);">
        <div id="msgDiv"></div>
        </form>
   </div>
 </div>
</nav>

		<table class="table" style="margin-left : auto; margin-right : auto; width : 1440px;">
		
		<tr> 
		<td width="30%" valign="top">
			<form name="cart" action="cartProcess.jsp">
			<table border="0" width="100%" heigth="100%">
			<tr>
			<td><b>상품이름 : </b><%=product.getName()%></td>
			</tr>			
			<tr>
			<td><b>가    격 : </b><%=product.getPrice()%></td>
			</tr>
			<tr>
			<td><b>수    량 : </b><input type="text" name="quantity" size="5" value="1">개 <br> (	재고 : <%=product.getStock()%>)</td>
			</tr>
			<tr>
			<td align="center">
			<input type="submit" value="장바구니 담기">
			</td>
			</tr>
			</table>
			<input type=hidden name=product_num value=<%=product.getNum()%>>			
			</form>
		
		</td>
		<td width="50%" valign="top">
		<b>상세설명</b><br><pre><%=product.getDetail()%></pre>
		</td>
		</tr>
		</table>
</body>
</html>



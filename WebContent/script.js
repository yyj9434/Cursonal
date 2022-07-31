
   function loginCheck(){
      if(document.login.mem_id.value==""){
         alert("아이디를 입력해주세요.");
         document.login.mem_id.focus();
         return;
      }
      if(document.login.mem_passwd.value==""){
         alert("암호를 입력해주세요.");
         document.login.mem_passwd.focus();
         return;
      }
      document.login.submit();
   }
   

   function memberReg(){
      document.location="Register.jsp";
   }
   
   function inputCheck(){
      if(document.regForm.mem_id.value==""){
         alert("아이디를 입력해주세요.");
         document.regForm.mem_id.focus();
         return;
      }
      if(document.regForm.mem_passwd.value==""){
         alert("암호를 입력해주세요.");
         document.regForm.mem_passwd.focus();
         return;
      }
      if(document.regForm.mem_repasswd.value==""){
         alert("암호 확인을 입력하세요..");
         document.regForm.mem_repasswd.focus();
         return;
      }
      if(document.regForm.mem_name.value==""){
         alert("이름를 입력해주세요.");
         document.regForm.mem_name.focus();
         return;
      }
      if(document.regForm.mem_email.value==""){
         alert("이메일을 입력해주세요.");
         document.regForm.mem_email.focus();
         return;
      }
      if(document.regForm.mem_phone.value==""){
         alert("연락처를 입력해주세요.");
         document.regForm.mem_phone.focus();
         return;
      }
      if(document.regForm.mem_job.value=="0"){
         alert("직업을 선택해주세요.");
         document.regForm.mem_job.focus();
         return;
      }
      
      if(document.regForm.mem_passwd.value != document.regForm.mem_repasswd.value){
         alert("암호가 일치하지 않습니다.");
         document.regForm.mem_repasswd.focus();
         return;
      }

      if(document.regForm.mem_email.value==""){
         alert("이메일을 입력해주세요.");
         document.regForm.mem_email.focus();
         return;
      }

      var str=document.regForm.mem_email.value;      
      var atPos = str.indexOf('@');
      var atLastPos = str.lastIndexOf('@');
      var dotPos = str.indexOf('.'); 
      var spacePos = str.indexOf(' ');
      var commaPos = str.indexOf(',');
      var eMailSize = str.length;
      if (atPos > 1 && atPos == atLastPos && 
         dotPos > 3 && spacePos == -1 && commaPos == -1 
         && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
      else {
           alert('E-mail 입력 형식이 맞지않습니다.');
           document.regForm.mem_email.focus();
           return;
      }

      document.regForm.submit();
   }
   
   function idCheck(id){
      if(id == ""){
         alert("아이디를 확인해주세요.");
         document.regForm.mem_id.focus();
      }else{
         url="IdCheck.jsp?mem_id=" + id;
         window.open(url,"post","width=300,height=150");
      }
   }
   

   function productDetail(num) {
      document.detail.num.value=num;
      document.detail.submit();
   }
   

   function cartUpdate(form){
      form.flag.value="update"
      form.submit();
   }
   
   function cartDelete(form) {
      form.flag.value="del";
      form.submit();
   }
   
      function Update(id){
      document.update.id.value=id;
      document.update.submit();
   }


//product 


   function productDelete(num) {
      document.del.num.value=num;
      document.del.submit();
   }

   function productUpdate(num){
      document.update.num.value=num;
      document.update.submit();
   }


//order

   function orderDetail(num){
      document.detail.num.value=num;
      document.detail.submit();   
   }
   
   function orderUpdate(form){
      form.flag.value="update"
      form.submit();
   }
   
   function orderDelete(form) {
      form.flag.value="delete";
      form.submit();
   }
   

//order end

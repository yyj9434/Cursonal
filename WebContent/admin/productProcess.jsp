<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="proMgr" class="cusonal.ProductMgr" />
<%
	String flag = request.getParameter("flag");
	boolean result = false;
	
	if(flag.equals("insert")){
    	result=proMgr.insertProduct(request);
	}else if(flag.equals("update")){
    	result=proMgr.updateProduct(request);
    }else if(flag.equals("delete")){
		result=proMgr.deleteProduct(request.getParameter("num"));
	}else{
		response.sendRedirect("productMgr.jsp");
	}
	
	if(result){
%>
	  <script>
	    alert("처리하였습니다");
		location.href="productMgr.jsp";
	  </script>
<%	}else{%>
	  <script>
	    alert("오류가 발생하였습니다.");
		location.href="productMgr.jsp";
	  </script>
<%	}%>
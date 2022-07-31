<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, cusonal.*"%>
<jsp:useBean id="orderMgr" class="cusonal.OrderMgr" />

<%
	String flag = request.getParameter("flag");
    int num = Integer.parseInt(request.getParameter("num"));
	String state = request.getParameter("state");
	boolean result = false;
	
	if(flag.equals("update")){
    	result=orderMgr.updateOrder(num, state);
    }else if(flag.equals("delete")){
		result=orderMgr.deleteOrder(num);
	}else{
		response.sendRedirect("adminOrderMgr.jsp");
	}

    if(result){
%>
	<script>
		alert("정상적으로 처리하였습니다.");
		location.href="adminOrderMgr.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("오류가 발생하였습니다.");
		location.href="adminOrderMgr.jsp";
	</script>
<%
	}
%>
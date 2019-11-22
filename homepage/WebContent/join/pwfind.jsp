<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/jssi.jsp" %>
<% 
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	
	Map map = new HashMap();
	map.put("id" , id);
	map.put("email" , email);
	
	String pw = dao.pwfind(map); 
	
	String str = "";
	if(pw != null){
%>
	{
	pw : "<%=pw%>",
	str : "찾으시는 비밀번호는 : <%=pw%>"
	}
<%}else{ %>
	{
	str : "입력하신 정보가 없습니다."
	}

<% 	}%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/jssi.jsp" %>
<% 
	String jname = request.getParameter("jname");
	String email = request.getParameter("email");
	
	Map map = new HashMap();
	map.put("jname" , jname);
	map.put("email" , email);
	
	String id = dao.idfind(map); 
	
	String str = "";
	if(id != null){
%>
	{
	id : "<%=id%>",
	str : "찾으시는 아이디는 : <%=id%>"
	}
<%}else{ %>
	{
	str : "입력하신 정보가 없습니다."
	}

<% 	}%>

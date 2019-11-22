<%@ page contentType="text/html; charset=UTF-8" %> 
<%
	session.invalidate();
//	session.removeAttribute("id");
	response.sendRedirect("../index.jsp");
%>


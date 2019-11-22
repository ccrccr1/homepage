<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="guestbook.GuestDTO" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.Utility" %>
<jsp:useBean id="dao" class="guestbook.GuestDAO"/>
<% request.setCharacterEncoding("utf-8");%>
<%
	String root = request.getContextPath();
	List<GuestDTO> list = null;
	
	boolean flag = false;
	
	Iterator<GuestDTO> iter = null;
%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="notice.NoticeDTO" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.Utility" %>
<jsp:useBean id="dao" class="notice.NoticeDAO"/>
<% request.setCharacterEncoding("utf-8");%>
<%
	String root = request.getContextPath();
	List<NoticeDTO> list = null;
	
	boolean flag = false;
	
	Iterator<NoticeDTO> iter = null;
%>

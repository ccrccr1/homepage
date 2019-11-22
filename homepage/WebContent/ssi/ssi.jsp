<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="memo.MemoDTO" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.Utility"%>
<jsp:useBean id="dao" class="memo.MemoDAO"/>
<% request.setCharacterEncoding("utf-8");%>
<%
	String root = request.getContextPath();
	List<MemoDTO> list = null;
	
	boolean flag = false;
	
	Iterator<MemoDTO> iter = null;
%>
<%@ page import="join.JoinDTO"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean id="dao" class="join.JoinDAO"/>
<% request.setCharacterEncoding("utf-8");%>
<%
	List<JoinDTO> list = null;
	
	boolean flag = false;
	
	Iterator<JoinDTO> iter = null;
	
	String root = request.getContextPath();
	
	String upDir = application.getRealPath("/join/storage");
	String tempDir = application.getRealPath("/join/temp");

%>
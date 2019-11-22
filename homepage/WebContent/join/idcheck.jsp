<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="join.JoinDAO"/>
<%
	String id = request.getParameter("id");
	
	boolean flag = dao.duplicateId(id);
	
	String str = "";
	
	if(flag){
		str = id + "는 중복되어서 사용할 수 없습니다.";
	}else{
		str = id + "는 사용가능합니다.";
	}
	
	out.print(str);

%>
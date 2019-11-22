<%@ include file="/ssi/ssi.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="memo.MemoDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%	
	flag=dao.create(dto);
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>memo</title>
  <meta charset="utf-8">
  
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">

<div class="well well-lg">
<%
	if(flag){
		out.print("메모등록 성공");
	}else out.print("메모등록 실패");
%>
</div>
<button class="btn" type="button" onclick="location.href='./createForm.jsp'">다시등록</button>
<button class="btn" type="button" onclick="location.href='./list.jsp'">목록</button>
</div>
</body>
</html>

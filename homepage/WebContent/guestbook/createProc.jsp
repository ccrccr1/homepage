<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/gssi.jsp" %>
<jsp:useBean id="dto" class="guestbook.GuestDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	flag = dao.create(dto);
%>


<!DOCTYPE html>
<html>
<head>
<title>guset</title>
<meta charset="utf-8">
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div class="container">
		<div class="well well-large">
		<%
			if(flag){
				out.print("글 등록 성공입니다.");
			}else{
				out.print("글 등록 실패입니다.");
			}
		%>
		</div>
		<button onclick="location.href='./createForm.jsp'" class="btn btn-default">다시등록</button>
		<button onclick="location.href='./list.jsp'" class="btn btn-default">목록</button>
	</div>
</body>
</html>
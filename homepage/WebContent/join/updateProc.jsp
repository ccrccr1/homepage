<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<jsp:useBean id="dto" class="join.JoinDTO"/>
<jsp:setProperty name="dto" property="*"/>
<%
	flag = dao.update(dto);
%>

<!DOCTYPE html>
<html>
<head>
<title>회원수정</title>
<meta charset="utf-8">
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">회원수정</h1>
		<div class="well well-lg">
			<%
				if(flag){
					out.print("정보수정을 성공했습니다.");
				}else{
					out.print("정보수정을 실패했습니다.");
				}
				
			%>
		</div>
		<button class="btn btn-default" onclick="location.href='read.jsp?id=<%=dto.getId()%>'">확인</button>
		<button class="btn btn-default" onclick="history.back()">확인</button>
	</div>
</body>
</html>
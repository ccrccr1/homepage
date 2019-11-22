<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	Map map = new HashMap();
	map.put("id" , id);
	map.put("pw" , passwd);
	
	flag = dao.updatePw(map);
%>

<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경확인</title>
<meta charset="utf-8">
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10" >비밀번호 변경확인</h1>
		<div class="well well-lg">
			<%
				if(flag){
					out.print("비밀번호가 변경되었습니다.");
				}else{
					out.print("비밀번호 변경이 실패했습니다.");
				}
			%>
		</div>
		<button class="btn btn-default" onclick="location.href='loginForm.jsp'">로그인</button>
		<button class="btn btn-default" onclick="history.back()">다시시도</button>
	</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
	String id = (String)request.getParameter("id");
	String oldfile = (String)request.getParameter("oldfile");
	
	flag = dao.delete(id);
	
	if(flag){
		session.invalidate();
	}
	if(flag && !oldfile.equals("member.jpg")){
		UploadSave.deleteFile(upDir, oldfile);
	}
%>

<!DOCTYPE html>
<html>
<head>
<title>회원탈퇴</title>
<meta charset="utf-8">
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">회원탈퇴</h1>
		<div class="well well-lg">
		<%
			if(flag){
				out.print("탈퇴성공. 로그아웃 됩니다.");
			}else{
				out.print("회원탈퇴가 실패했습니다.");
			}
		%>
		
		</div>
		<button class="btn btn-default" onclick="location.href='../index.jsp'">홈</button>
		<button class="btn btn-default" onclick="history.back()">다시시도</button>
	</div>
</body>
</html>
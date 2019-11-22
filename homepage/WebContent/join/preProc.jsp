<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	String id = upload.getParameter("id");
	//String email = upload.getParameter("email");
	
	String str = "";
	
	if(dao.duplicateId(id)){
		str = "중복된 아이디입니다. 아이디를 확인하세요.";
	}else{
		request.setAttribute("upload", upload);
	
%>
	<jsp:forward page="/join/createProc.jsp"/>
<%
	return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<title>회원가입중</title>
<meta charset="utf-8">
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div class="container">
		<div class="well well-lg">
			<br>
				<%=str %>
			<br>
		</div>
		<button onclick="history.back()" class="btn btn-default">다시시도</button>
	</div>
</body>
</html>
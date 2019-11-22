<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<jsp:useBean id="dto" class="join.JoinDTO"/>
<%
	String pw = request.getParameter("passwd");
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	
	Map map = new HashMap();
	map.put("id", id);
	map.put("email", email);
	
	pw = dao.pwfind(map);
	
%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호찾기</title>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<style>
	#red {
		color:red;
	}
</style>
</head>
<body>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">비밀번호찾기</h1>
		<%if(pw==null){ %>
		<div class="well well-lg col-sm-offset-1 col-sm-4">
		<%out.print("입력하신 정보가 없습니다."); %>
		</div>		
		<%}else{ %>
		<div class="well well-lg col-sm-offset-1 col-sm-4">
			비밀번호 : <%=pw %>
		</div>
		<%} %> 
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button type="button" class="btn btn-default" onclick="window.close()">닫기</button>
			</div>
		</div>
	</div>
</body>
</html>
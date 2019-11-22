<%@ page contentType="text/html; charset=UTF-8" %> 
<%
	String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>
<title>비밀번호 수정</title>
<meta charset="utf-8">
<script type="text/javascript">
	function inCheck(f){
		if(f.passwd.value.length==0){
			alert("비번을 입력하세요");
			f.passwd.focus();
			return false;
		}
		if(f.repasswd.value.length==0){
			alert("비번확인을 입력하세요");
			f.repasswd.focus();
			return false;
		}
		if(f.passwd.value != f.repasswd.value){
			alert("비밀번호가 서로 다릅니다.")
			f.passwd.value="";
			f.repasswd.value="";
			f.passwd.focus();
			return false;
		}
	}

</script>

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">비밀번호 변경</h1>
		<form class="form-horizontal" action="updatePwProc.jsp"method="post" onsubmit="return inCheck(this)">
		<input type="hidden" name="id" value="<%=id%>">
			<div class="form-group">
				<label class="control-label col-sm-2" for="passwd">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="passwd"
						placeholder="Enter passwd" name="passwd">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="repasswd">비밀번호 확인</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="repasswd"
						placeholder="Enter password" name="repasswd">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn btn-default">변경</button>
					<button type="button" class="btn btn-default" onclick="history.back()">돌아가기</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
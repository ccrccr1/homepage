<%@ page contentType="text/html; charset=UTF-8" %> 
<%
String ip = request.getRemoteAddr();
if(ip.equals("172.16.81.1")){
	response.sendRedirect("http://www.msn.com/ko-kr/?ocid=iehp");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>guest</title>
<meta charset="utf-8">

<script type="text/javascript">
	function input(f){
		if(f.wname.value==''){
			alert("작성자를 입력하세요");
			f.wname.focus();
			return false;
		}
		if(f.title.value==''){
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if(f.content.value==''){
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
		if(f.passwd.value==''){
			alert("비번을 입력하세요");
			f.passwd.focus();
			return false;
		}
	}
</script>

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">게시판 생성</h1>
		<form class="form-horizontal" action="createProc.jsp" method="post" onsubmit="return input(this)">
			<div class="form-group">
				<label class="control-label col-sm-2" for="wname">작성자</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="wname"
						placeholder="Enter 작성자" name="wname">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">제목</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="title"
						placeholder="Enter 제목" name="title">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="content">내용</label>
				<div class="col-sm-6">
					<textarea rows="12" cols="6" id="content" name="content" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="pwd"
						placeholder="Enter 비밀번호" name="passwd">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn btn-default">Submit</button>
					<button type="reset" class="btn btn-default">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
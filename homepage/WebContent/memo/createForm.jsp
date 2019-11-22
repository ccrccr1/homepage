<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String ip = request.getRemoteAddr();
if(ip.equals("172.16.81.1")){
	response.sendRedirect("http://www.msn.com/ko-kr/?ocid=iehp");
}
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>memo</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  function input(){
		var f = document.frm;
		if(f.title.value.length==0){
			alert("제목을 입력하세요");
			f.title.focus();
			return
		}
		if(f.content.value.length==0){
			alert("내용을 입력하세요");
			f.content.focus();
			return
		}
		f.submit();
	}
  </script>
  </head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">메모 등록</h1>
<form class="form-horizontal" action="createProc.jsp" method="post" name="frm">
	<div class="form-group">
		<label class="control-label col-sm-2" for="title">제목</label>
		<div class="col-sm-6">
			<input type="text" name="title" id="title" class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2" for="content">내용</label> 
		<div class="col-sm-6">
		<textarea rows="5" cols="5" id="content" name="content" class="form-control"></textarea>
		</div>
	</div>
	<div class="form-group">
	<div class="col-sm-offset-2 col-sm-5">
		<button type="button" class="btn" onclick="input()">등록</button>
		<button type="reset" class="btn">취소</button>
	</div>
	</div>
</form>

</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssin.jsp"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	NoticeDTO dto = dao.read(no);
	
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
	if(f.passwd.value.length==0){
		alert("비번을 입력하세요");
		f.passwd.focus();
		return
	}
	
	f.submit();
}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">Notice 수정</h1>
		<form class="form-horizontal" action="updateProc.jsp" method="post" name="frm">
			<input type="hidden" name="no" value="<%=no%>">
			<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
			<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
			<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">작성자</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="id"
						value="<%=dto.getId()%>" name="id" value="admin" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">제목</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="title"
						value="<%=dto.getTitle()%>" name="title">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="content">내용</label>
				<div class="col-sm-6">
					<textarea rows="12" cols="6" id="content" 
					name="content" class="form-control"><%=dto.getContent()%></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="passwd">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="passwd"
						placeholder="Enter 비밀번호" name="passwd">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="button" class="btn btn-default" onclick="input()">수정</button>
					<button type="reset" class="btn btn-default">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
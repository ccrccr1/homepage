<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/gssi.jsp" %>
<%
	int guestno = Integer.parseInt(request.getParameter("guestno"));
	dao.upViewcnt(guestno);
	GuestDTO dto = dao.read(guestno);
	
	String content = dto.getContent().replaceAll("\r\n", "<br>");
%>

<!DOCTYPE html>
<html>
<head>
<title>guest</title>
<meta charset="utf-8">
<script type="text/javascript">
	function listb(){
		var url = "list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>"; 
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href=url;
	}

	function updateb(guestno){
		var url = "updateForm.jsp";
		url += "?guestno="+guestno;
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>"; 
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href=url;
		
	}
	function replyb(guestno){
		var url = "replyForm.jsp";
		url += "?guestno="+guestno;
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>"; 
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href=url;
		
	}
	function delb(guestno){
		var url = "deleteForm.jsp";
		url += "?guestno="+guestno;
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>"; 
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href=url;
	}
</script>

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div class="container">
		<h1>조회</h1>
		<div class="panel panel-default">
			<div class="panel-heading">작성자</div>
			<div class="panel-body"><%=dto.getWname()%></div>
			
			<div class="panel-heading">제목</div>
			<div class="panel-body"><%=dto.getTitle()%></div>
			
			<div class="panel-heading">내용</div>
			<div class="panel-body" style="height: 200px"><%=content%></div>
			
			<div class="panel-heading">조회수</div>
			<div class="panel-body"><%=dto.getViewcnt()%></div>
			
			<div class="panel-heading">등록일</div>
			<div class="panel-body"><%=dto.getWdate()%></div>
		</div>
		
		<button class="btn btn-default" onclick="location.href='./createForm.jsp'">등록</button>
		<button class="btn btn-default" onclick="updateb('<%=guestno%>')">수정</button>
		<button class="btn btn-default" onclick="delb('<%=guestno%>')">삭제</button>
		<button class="btn btn-default" onclick="replyb('<%=guestno%>')">답변</button>
		<button class="btn btn-default" onclick="listb()">목록</button>
	</div>
</body>
</html>
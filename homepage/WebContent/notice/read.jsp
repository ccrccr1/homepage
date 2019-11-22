<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssin.jsp" %>
<%
	String id = request.getParameter("id");	

	int no = Integer.parseInt(request.getParameter("no"));
	dao.upViewcnt(no);
	NoticeDTO dto = dao.read(no);
	
	if(id==null){
		id = (String)session.getAttribute("id");
	}
	
	String grade = (String)session.getAttribute("grade");
	
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

	function updateb(no){
		var url = "updateForm.jsp";
		url += "?no="+no;
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>"; 
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href=url;
		
	}
	function delb(no){
		var url = "deleteForm.jsp";
		url += "?no="+no;
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
			<div class="panel-body"><%=dto.getId()%></div>
			
			<div class="panel-heading">제목</div>
			<div class="panel-body"><%=dto.getTitle()%></div>
			
			<div class="panel-heading">내용</div>
			<div class="panel-body" style="height: 200px"><%=content%></div>
			
			<div class="panel-heading">조회수</div>
			<div class="panel-body"><%=dto.getViewcnt()%></div>
			
			<div class="panel-heading">등록일</div>
			<div class="panel-body"><%=dto.getWdate()%></div>
		</div>
		
		<%if(id !=null && grade.equals("A")) {%>
		<button class="btn btn-default" onclick="location.href='./createForm.jsp'">등록</button>
		<button class="btn btn-default" onclick="updateb('<%=no%>')">수정</button>
		<button class="btn btn-default" onclick="delb('<%=no%>')">삭제</button>
		<button class="btn btn-default" onclick="listb()">목록</button>
		<%} %>
		<%if(id !=null && !grade.equals("A")) {%>
		<button class="btn btn-default" onclick="listb()">목록</button>
		<%}%>
		<%if(id == null){ %>
		<button class="btn btn-default" onclick="listb()">목록</button>
		<%} %>
	</div>
</body>
</html>
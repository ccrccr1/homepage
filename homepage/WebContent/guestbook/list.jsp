<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/gssi.jsp" %>
<%	
	String ip = request.getRemoteAddr();
	if(ip.equals("172.16.82.1")){
		out.print("님차단이요");
	}

	//검색관련
	String word = Utility.checkNull(request.getParameter("word"));
	String col = Utility.checkNull(request.getParameter("col"));	

	if(col.equals("total")){
		word="";
	}
	//페이징관련
	int nowPage = 1;
	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 5;
	int sno = ((nowPage-1) * recordPerPage) + 1;
	int eno = nowPage*recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	list = dao.list(map); 	
	iter = list.iterator();
	int total = dao.total(map);
	
%>


<!DOCTYPE html>
<html>
<head>
<title>guest</title>
<meta charset="utf-8">
<script type="text/javascript">
	function read(guestno){
		var url = "read.jsp";
		url += "?guestno="+guestno;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		 
		location.href=url;
	}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div class="container">
		<h1>게시판 목록</h1>
		<form class="form-inline" action="./list.jsp">
			<div class="form-group">
				<select class="form-control" name= "col">
					<option value="wname" 
					<%if(col.equals("wanme")) out.print("selected");%>
					>성명</option>
					<option value="title" 
					<%if(col.equals("title")) out.print("selected");%>
					>제목</option>
					<option value="content" 
					<%if(col.equals("content")) out.print("selected");%>
					>내용</option>
					<option value="title_content" 
					<%if(col.equals("title_content")) out.print("selected");%>
					>제목+내용</option>
					<option value="total" 
					<%if(col.equals("total")) out.print("selected");%>
					>전체출력</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요" name="word" value="<%=word%>">
			</div>
			<button class="btn btn-default">검색</button>
		    <button type="button" class="btn btn-default" onclick="location.href='createForm.jsp'">등록</button>
		</form>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>grpno</th>
						<th>indent</th>
						<th>ansnum</th>
					</tr>
				</thead>
				<tbody>
				<% 
				if(list.size()==0){
				%>
					<tr>
						<td colspan="6">등록된 글이 없습니다.</td>
					</tr>
				<%		
				}else{
					
				
				while(iter.hasNext()){
					GuestDTO dto = iter.next();
				%>
					<tr>
						<td><%=dto.getguestno()%></td>
						<td>
						<%
						for(int r=0; r<dto.getIndent(); r++){
							out.print("&nbsp;&nbsp;");
						}
						if(dto.getIndent()>0){
							out.print("<img src='../images/re.jpg'>");
						}
						%>
						<a href="javascript:read('<%=dto.getguestno()%>')"><%=dto.getTitle()%></a>
						<% if(Utility.compareDay(dto.getWdate())){%>
						<img src="<%=root %>/images/new.gif">
						<%} %>
						</td>
						<td><%=dto.getWname()%></td>
						<td><%=dto.getGrpno()%></td>
						<td><%=dto.getIndent()%></td>
						<td><%=dto.getAnsnum()%></td>
					</tr>
				<%	
						}}   // end
				%> 
				</tbody>
			</table>
			<div>
			<%=Utility.paging(total, nowPage, recordPerPage, col, word) %>
			</div>
	</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="/ssi/ssi.jsp" %>
<% 
	String ip = request.getRemoteAddr();
	if(ip.equals("172.16.82.1")){
		out.print("님차단이요");
	}
	
	//검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")){
		word = "";
	}
	//페이징관련
	int nowPage = 1;
	if(request.getParameter("nowPage")!= null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 5;
	
	int sno = ((nowPage-1) * recordPerPage)+1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno" , sno);
	map.put("eno", eno);
	
  	list = dao.list(map);
  	int total = dao.total(map);
  	
  	

%> 
<!DOCTYPE html> 
<html> 
<head>
  <title>memo</title>
  <script type="text/javascript">
   function read(memono){
	   var url = "read.jsp";
	   url += "?memono="+memono;
	   url +="&col=<%=col%>";
	   url +="&word=<%=word%>";
	   url +="&nowPage=<%=nowPage%>";
	   
	   location.href=url;
   }
  </script>
  <meta charset="utf-8">
 </head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
	<h2>메모 목록</h2>
	<form class="form-inline" action="list.jsp">
		<div class="form-group">
			<select class="form-control" name="col">
				<option value="title"
				<%if(col.equals("title")) out.print("selected"); %>
				>제목</option>
				<option value="content"
				<%if(col.equals("content")) out.print("selected"); %>
				>내용</option>
				<option value="title_content"
				<%if(col.equals("title_content")) out.print("selected"); %>
				>제목+내용</option>
				<option value="total"
				<%if(col.equals("total")) out.print("selected"); %>
				>전체출력</option>
			</select>
		</div>
		<div class="form-group">
			<input type="text" name="word" class="form-control" placeholder="검색어 입력" value="<%=word%>">
		</div>
		<button class="btn btn-dfault">검색</button>
		<button class="btn btn-dfault" type="button" onclick="location.href='createForm.jsp'">등록</button>
	</form>
	
	
	<table class="table table-striped">
		<thead>
			<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		<%if(list.size()==0){ %>
			<tr><td colspan="4">등록된 메모가 없습니다.</td>
		<%}else{
			
			iter = list.iterator();
			while(iter.hasNext()){
				MemoDTO dto = iter.next();
		%>	
			<tr>
				<td><%=dto.getMemono()%></td>
				<td>
				<a href="javascript:read('<%=dto.getMemono() %>')"><%=dto.getTitle() %></a>
				<%if(Utility.compareDay(dto.getWdate())){ %>
				<img src="<%=root %>/images/new.gif">
				<%} %>
				</td>
				
				<td><%=dto.getWdate() %></td>
				<td><%=dto.getViewcnt() %></td>
			</tr>
		<%
		}//while end
		}//if end
		%>
		</tbody>
	</table>
	<div>
		<%=Utility.paging(total, nowPage, recordPerPage, col, word) %>
	</div>
</div>
</body>
</html>

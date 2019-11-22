<%@ include file="/ssi/ssi.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="memo.MemoDTO"></jsp:useBean>
<jsp:setProperty property="*"  name="dto"/>

<%
	flag = dao.update(dto);
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>memo</title>
  <meta charset="utf-8">
<script type="text/javascript">
function listM(){
	 var url = "list.jsp";
	 url += "?col=<%=request.getParameter("col")%>";
	 url += "&word=<%=request.getParameter("word")%>";
	 url += "&nowPage=<%=request.getParameter("nowPage")%>";
	 
	 location.href= url;
}
</script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<div class ="well well-lg">
<%
 if(flag) out.print("메모수정 성공");
 else out.print("메모수정 실패");
%>
<button class="btn" type="button" onclick="location.href='./createForm.jsp'">다시 등록</button>
<button class="btn" type="button" onclick="listM()">목록</button>
</div>

</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssin.jsp" %>
<% int no = Integer.parseInt(request.getParameter("no")); 
	
%>

<!DOCTYPE html>
<html>
<head>
<title>guest</title>
<meta charset="utf-8">
<style>
	#red{
		color : red;
	}
</style>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div class="container">
		<%if(flag){ %>
			<div class="well well-lg" >
				<p id="red" class="col-sm-offset-2">부모글 입니다. 삭제할 수 없습니다.</p>
			</div>
			<button type="button" class="btn btn-default" onclick="history.back()">뒤로가기</button>
		<%}else{ %>
		<h1 class="col-sm-offset-2 col-sm-10">삭제</h1>
		<form class="form-horizontal" action="deleteProc.jsp"method="post">
		<input type="hidden" name="no" value="<%=no%>">
		<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
		<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Password:</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="pwd"
						placeholder="Enter password" name="passwd" required="required">
				</div>
			</div>
			
			<p id="red" class="col-sm-offset-2">삭제하면 복구할 수 없습니다.</p>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn btn-default">삭제</button>
					<button type="reset" class="btn btn-default">취소</button>
				</div>
			</div>
		</form>
		<%} %>
	</div>
</body>
</html>
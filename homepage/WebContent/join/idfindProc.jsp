<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
	String id = request.getParameter("id");
	String jname = request.getParameter("jname");
	String email = request.getParameter("email");
	
	Map map = new HashMap();
	map.put("jname" , jname);
	map.put("email" , email);
	
	id = dao.idfind(map); 
%>

<!DOCTYPE html>
<html>
<head>
<title>아이디찾기</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<style>
	#red {
		color:red;
	}
</style>
<script>
		function use(){
			opener.frm.id.value='<%=id%>';
			opener.frm.id.diabled = "disabled";
			self.close();
		}
</script>
</head>
<body>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">아이디찾기</h1>
		<%if(id == null){ %>
		<div class="well well-lg col-sm-offset-1 col-sm-4">
		<%out.print("입력하신 정보의 회원이 없습니다."); %>
		</div>
		<%}else{ %>
		<div class="well well-lg col-sm-offset-1 col-sm-4">
			아이디 : <%=id %>
		</div> 
		<%} %>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="button" class="btn btn-default" onclick="use()">닫기</button>
				</div>
			</div>
		</div>
</body>
</html>
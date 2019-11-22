<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
	String id = request.getParameter("id");
%>


<!DOCTYPE html>
<html>
<head>
<title>아이디찾기</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<script type="text/javascript">
	function idFind(){
			var url = "idfind.jsp";
			var param = "jname="+$("#jname").val();
			param +="&email="+$("#email").val();
			
			$.get(url, param, function(data, textStatus, req) {	
				result = eval("("+data+")");
				$("#idfind").text(data);
				
		});
	}	
	function use(){
		opener.frm.id.value= result.id;
		self.close();
	}
	
</script>
<style type="text/css">
	#idfind,#pwfind{
		color : red;
	}
</style>
</head>
<body>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">아이디찾기</h1>
		<form class="form-horizontal" action="idfind.jsp" method="post" id="frm">
			<div class="form-group">
				<label class="control-label col-sm-2" for="jname" value="아이린">이름</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="jname"
						placeholder="Enter jname" name="jname" required value="아이린">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Email</label>
				<div class="col-sm-6">
					<input type="email" class="form-control" id="email"
						placeholder="Enter email" name="email" required  value="user1@mail.com">
				</div>
				<div class="col-sm-6" id="idfind">
					
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="button" class="btn btn-default" onclick="idFind()" id="btnfind">찾기</button>
					<button type="button" class="btn btn-default" onclick="use()">닫기</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
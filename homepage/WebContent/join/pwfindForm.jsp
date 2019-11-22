<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
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
<script type="text/javascript">
function pwFind(){
		var url = "pwfind.jsp";
		var param = "id="+$("#id").val();
		param +="&email="+$("#email").val();
		
		$.get(url, param, function(data, textStatus, req) {	
			result = eval("("+data+")");
			$("#pwfind").text(data);
			
	});
	}	
	function use(){
	opener.frm.passwd.value= result.pw;
	self.close();
	}
</script>
<style type="text/css">
	#pwfind{
		color : red;
	}
</style>
</head>
<body>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">비밀번호 찾기</h1>
		<form class="form-horizontal" action="pwfind.jsp"method="post" id="frm">	
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">아이디</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="id"
						placeholder="Enter id" name="id" required value="user1">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Email</label>
				<div class="col-sm-6">
					<input type="email" class="form-control" id="email"
						placeholder="Enter email" name="email" required value="user1@mail.com">
				</div>
				<div class="col-sm-6" id="pwfind">
				
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="button" class="btn btn-default" onclick="pwFind()">찾기</button>
					<button type="button" class="btn btn-default" onclick="use()">닫기</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
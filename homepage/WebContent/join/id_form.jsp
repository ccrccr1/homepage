<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html>
<html>
<head>
<title>id 중복확인</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style type="text/css">
	#red{
		color: red;
	}
</style>

</head>
<body>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">id 중복확인</h1>
		<form class="form-horizontal" action="id_proc.jsp" method="post">
			<p id="red" class="col-sm-offset-2 col-sm-10">아이디를 입력하세요</p>
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">ID</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="id"
						placeholder="Enter ID" name = "id" required>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn btn-default">중복 확인</button>
					<button type="reset" class="btn btn-default">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
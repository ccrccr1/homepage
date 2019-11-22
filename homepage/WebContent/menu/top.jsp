<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8");
	
	String root = request.getContextPath();
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
	
	String str = "";
	
	if(id !=null && grade.equals("A")){
		str = "관리자 페이지 입니다.";
	}else if(id !=null && !grade.equals("A")){
		str = "안녕하세요 " + id + "님";
	}

%>
<!DOCTYPE html> 
<html> 
<head>
  <title>memo</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
  #grade{
  	color : orange;
  }
  .video{
 	margin-top: 80px;
 	text-align: center;
  }
</style>
</head>
<body> 
<!-- 상단 메뉴 -->
<div class="container">

<div class="page-header row">
	<div class="col-sm-4">
		<img src="<%=root%>/menu/images/tree.jpg" class="img-responsive img-thumbnail" alt="CinqueTerre">
	</div>
	<div class="col-sm-8" id="video"><h1>Homepage</h1><br>
		<p id="grade"> <%=str %></p>	</div>	
</div>
<ul class="nav nav-tabs">
	<li class="active"><a href="<%=root%>/index.jsp">Home</a></li>
	<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">메모<span class="caret"></span></a>
		<ul class="dropdown-menu">
			<li><a href="<%=root%>/memo/list.jsp">메모 목록</a></li>
			<li><a href="<%=root%>/memo/createForm.jsp">메모 생성</a></li>
		</ul>
	</li>
	<li class="dropdown">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Guest<span class="caret"></span></a>
		<ul class="dropdown-menu">
			<li><a href="<%=root%>/guestbook/list.jsp">게시판 목록</a></li>
			<li><a href="<%=root%>/guestbook/createForm.jsp">게시판 생성</a></li>
		</ul>
	</li>
	<li class="dropdown">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">notice<span class="caret"></span></a>
		<ul class="dropdown-menu">
			<li><a href="<%=root%>/notice/list.jsp">notice 목록</a></li>
			<li><a href="<%=root%>/notice/createForm.jsp">notice 생성</a></li>
		</ul>
	</li>
	<%if(id==null){%>
	<li><a href="<%=root%>/join/agreement.jsp">회원가입</a></li>
	<li><a href="<%=root%>/join/loginForm.jsp">로그인</a></li>
	<%}else{ %>
	<li><a href="<%=root%>/join/read.jsp">나의정보</a></li>
	<li><a href="<%=root%>/join/updateForm.jsp">회원수정</a></li>
	<li><a href="<%=root%>/join/logout.jsp">로그아웃</a></li>
	<%} %>
	<%if(id !=null && grade.equals("A")){ %>
	<li><a href="<%=root%>/admin/list.jsp">회원목록</a></li>
	<%} %>
</ul>
</div>

</body>
</html>
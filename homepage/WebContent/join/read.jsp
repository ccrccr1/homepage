<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
	String id = request.getParameter("id");
	

	if(id==null){
		id = (String)session.getAttribute("id");
	}
	
	JoinDTO dto = dao.read(id);
	String grade = (String)session.getAttribute("grade");
%>

<!DOCTYPE html>
<html>
<head>
<title>회원정보</title>
<meta charset="utf-8">
<script type="text/javascript">
	function updateM(){
		var url = "updateForm.jsp";
		url += "?id=<%=dto.getId()%>";
		
		location.href = url;
	}
	function updateFile(){
		var url = "updateFileForm.jsp";
		url += "?id=<%=dto.getId()%>";
		url += "&oldfile=<%=dto.getFname()%>";
		
		location.href = url;
	}
	function updatePw(){
		var url = "updatePwForm.jsp";
		url += "?id=<%=dto.getId()%>";
		
		location.href = url;
	}
	
	function deleteM(){
		var url = "deleteForm.jsp";
		url += "?id=<%=dto.getId()%>";
		url += "&oldfile=<%=dto.getFname()%>";
		
		location.href = url;
	}
	
</script>
</head>
<body>
<div class="container">
<jsp:include page="/menu/top.jsp"/>
	<h2 class="col-sm-offset-2 col-sm-10"><%=dto.getJname()%>의 회원정보</h2>
	
	<table class="table table-bordered">
		<tr>
			<td colspan="2" style="text-align: center"><img
				src="./storage/<%=dto.getFname()%>" class="img-rounded"
				width="250px" height="250px"></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%=dto.getId()%></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><%=dto.getJname()%></td>

		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=dto.getTel()%></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail()%></td>

		</tr>
		<tr>
			<th>우편번호</th>
			<td><%=dto.getZipcode()%></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=dto.getAddress1()%> <%=dto.getAddress2()%></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=dto.getjdate()%></td>
		</tr>
	</table>
	
	<div style="text-align: center">
		<button class="btn btn-default" onclick="updateM()">정보수정</button>
		<%if(id !=null && !grade.equals("A")) {%>
		<button class="btn btn-default" onclick="updateFile()">사진수정</button>
		<button class="btn btn-default" onclick="updatePw()">패스워드 변경</button>
		<button class="btn btn-default" onclick="location.href='<%=root %>/download?dir=/member/storage&filename=<%=dto.getFname()%>'">다운로드</button> 
		<%} %>
		<button class="btn btn-default" onclick="deleteM()">회원탈퇴</button>
		<%if(id !=null && grade.equals("A")) {%>
		<button class="btn btn-default" onclick="location.href='list.jsp'">회원목록</button>
		<%} %>
	</div>
</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
	String id = request.getParameter("id");

	if(id==null){
		id = (String)session.getAttribute("id");
	}	
	JoinDTO dto = dao.read(id);
%>

<!DOCTYPE html>
<html>
<head>
<title>회원정보 수정</title>
<meta charset="utf-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                             
            } 

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
<script type="text/javascript">
function emailCheck(email){
	var url = "email_from.jsp";
	url +="?email="+email;
	
	var wr = window.open(url,"이메일검색","width=500, height=500");
	wr.moveTo((window.screen.width-500)/2 , (window.screen.height-500)/2);
}
</script>
<script type="text/javascript">
	function incheck(f){
		if(f.jname.value==""){
			alert("이름을 입력하세요");
			f.jname.focus();
			return false;
		}
		 if(f.tel.value==""){
		        alert("전화번호을 입력하세요");
		        f.tel.focus();
		        return false;
		      }
		 if(f.email.value==""){
		      	alert("이메일을 입력하세요");
		        f.email.focus();
		        return false;
		      }
	}
	function emailMsg(){
		alert("이메일을 변경을 원하시면 Email 변경 버튼을 클릭하세요 "); 
	}
	
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div class="container">
		<h2 class="col-sm-offset-2 col-sm-10">회원수정</h2>
		<label class="col-sm-offset-2 col-sm-10">(<span id="need" style="color:red;">*</span>필수입력사항)</label>
		<form class="form-horizontal" action="updateProc.jsp" method="post" name="frm" onsubmit="return incheck(this)">
		<input type="hidden" name="id" value="<%=dto.getId()%>">
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">아이디</label>
				<div class="col-sm-3">
					<%=dto.getId() %>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="jname">이름</label>
				<div class="col-sm-4">
					<%=dto.getJname() %>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="tel">전화번호</label>
				<div class="col-sm-4">
					<input type="text" name="tel" id="tel" class="form-control" value="<%=dto.getTel()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email"><span id="need">*</span>이메일</label>
				<div class="col-sm-3">
					<input type="email" name="email" id="email" class="form-control" 
					value="<%=dto.getEmail()%>" readonly onclick="emailMsg()">
				</div>
				<button type="button" onclick="emailCheck(document.frm.email.value)" class="btn col-sm-2" >Email 변경</button>
			</div> 

			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_postcode">우편번호</label>
				<div class="col-sm-1">
					<input type="text" name="zipcode" id="sample6_postcode" class="form-control" value="<%=dto.getZipcode()%>">
				</div>
				<button class="btn col-sm-1" type="button" onclick="sample6_execDaumPostcode()">주소검색</button>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_address">주소</label>
				<div class="col-sm-6">
					<input type="text" name="address1" id="sample6_address" class="form-control" value="<%=dto.getAddress1()%>">
					<input type="text" name="address2" id="sample6_detailAddress" class="form-control" value="<%=dto.getAddress2()%>">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn">수정</button>
					<button type="reset" class="btn">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
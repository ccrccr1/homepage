<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
//   function printClock() {

// 		var clock = document.getElementById("clock"); // 출력할 장소 선택
// 		var currentDate = new Date(); // 현재시간
// 		var calendar = currentDate.getFullYear() + "-"
// 				+ (currentDate.getMonth() + 1) + "-" + currentDate.getDate() // 현재 날짜
// 		var amPm = 'AM'; // 초기값 AM
// 		var currentHours = addZeros(currentDate.getHours(), 2);
// 		var currentMinute = addZeros(currentDate.getMinutes(), 2);
// 		var currentSeconds = addZeros(currentDate.getSeconds(), 2);

// 		if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
// 			amPm = 'PM';
// 			currentHours = addZeros(currentHours - 12, 2);
// 		}


// 		clock.innerHTML = currentHours + ":" + currentMinute + ":"
// 				+ currentSeconds + " <span style='font-size:50px;'>" + amPm
// 				+ "</span>"; //날짜를 출력해 줌

// 		setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
// 	}

// 	function addZeros(num, digit) { // 자릿수 맞춰주기
// 		var zero = '';
// 		num = num.toString();
// 		if (num.length < digit) {
// 			for (i = 0; i < digit - num.length; i++) {
// 				zero += '0';
// 			}
// 		}
// 		return zero + num;
// 	}
  </script>
<head>
<meta charset="UTF-8">
<title>기본페이지</title>
</head>
<body onload="printClock()">
<jsp:include page="/menu/top.jsp"></jsp:include>
<div>
	<div class="container"
		style="width: 600px; height: 250px; line-height: 250px; color: #000; font-size: 100px; text-align:center; ;"
		id="clock"></div>
</div>
</body>
</html>
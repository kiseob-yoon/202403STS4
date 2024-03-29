<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>ajax</h1>
	<select id="selectBox" onchange="move('${number.num}')">
		<option value="" selected disabled>선택</option>
		<option value="insertForm">insert</option>
		<option value="updateForm">update</option>
	</select>

<div id="here"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$(function() {
	$("#selectBox").on("change", function(){ //selectBox의 요소가 바뀌면
		console.log($(this).val());

		let sel = $(this).val(); //sel변수에 값을 가져옴
		if (sel=='insertForm') { //그 선택된 값이 'sample'과 같다면 ajax가 발동하여 메인페이지 url에 요청하여 성공시 메인페이지의 폼을 #here에 붙여준다.
			$.ajax({ 
				url : '/insertForm', 
				method : 'GET',
				success : function(data) {
					$('#here').html(data);
				}
			});
		} else if (sel == 'updateForm') { //선택된 값이 list면 ajax를 실행하고 url이 list인 곳으로 get요청하여 반환받은 값을 #here에 넣어준다.
			
			$.ajax({
				url : '/updateForm',
				method : 'GET',
				success : function(data) {
					$('#here').html(data);
				}
			});
		}
	});
});
</script>
</body>
</html>
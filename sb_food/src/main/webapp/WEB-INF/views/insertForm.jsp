<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
<h1>메뉴 추가</h1>
		<form id="insertForm" action="insert">
		<table>
		<tr>
		<th>메뉴</th>
		<td><input type="text" name="menu"></td>
		</tr>
		<tr>
		<th>가격</th>
		<td><input type="text" name="price"></td>
		</tr>
		<tr>
		<th>품목</th>
		<td><input type="text" name="item"></td>

		</tr>
		<tr>
		<td><input type="hidden" name="id" value="${store.id}" readonly> </td>
		</tr>
		
		
		</table>
		<input type="submit" value="메뉴 추가" class="green-button">
		<input type="reset" value="다시 입력하기" class="green-button">


		</form>

</body>
</html>
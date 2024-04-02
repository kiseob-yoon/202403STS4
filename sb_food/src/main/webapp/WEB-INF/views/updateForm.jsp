<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메뉴 수정</h1>
	<form action="update">
		<table>
			<tr>
				<th>메뉴</th>
				<td><input type="text" name="menu" value="${update.menu}"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price" value="${update.price}"></td>
			</tr>
			<tr>
				<th>품목</th>
				<td><input type="text" name="item" value="${update.item}"></td>
			</tr>
			<td><input type="hidden" name="num" value="${update.num}" readonly></td>
			</tr>

			<td><input type="hidden" name="id" value="${update.id}" readonly>
			</td>
			</tr>


		</table>
		<input type="submit" value="메뉴 수정"> <input type="reset"
			value="다시 입력하기">

	</form>
	<%-- <a href="delete?num=${update.num}&id=${update.id}"><button>삭제</button></a> --%>


</body>
</html>
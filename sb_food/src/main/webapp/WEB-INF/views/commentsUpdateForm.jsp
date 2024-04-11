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
	<p>
	<form action="commentsUpdate" id="insertForm">
	<h3>댓글 수정</h3>
		<table>
			<tr>
				<th>댓글</th>
				<td><input type="text" name="comment" value="${selectCommentstById.comment}"></td>
			</tr>
			<tr>
				<th>평점</th>
				<td><input type="text" name="grade" value="${selectCommentstById.grade}"></td>
			</tr>
			<td><input type="hidden" name="num" value="${selectCommentstById.num}" readonly></td>
	
			<td><input type="hidden" name="id" value="${selectCommentstById.id}" readonly>
			</td>

			</tr>


		</table>
		<input type="submit" value="메뉴 수정"> <input type="reset"
			value="다시 입력하기">

	</form>
	<%-- <a href="delete?num=${update.num}&id=${update.id}"><button>삭제</button></a> --%>


</body>
</html>
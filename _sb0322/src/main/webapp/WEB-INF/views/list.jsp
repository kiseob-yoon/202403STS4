<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<head>
	<title>top page</title>
	<meta http-equiv="Content-Type" 
		content="text/html; charset=UTF-8" />
	<style>
	h1 { font-size:18pt; font-weight:bold; color:gray; }
	body { font-size:13pt; color:gray; margin:5px 25px; }
	tr { margin:5px; }
	th { padding:5px; color:white; background:darkgray; }
	td { padding:5px; color:black; background:#e0e0ff; }
	.err { color:red; }
	</style>
</head>
<body>
	<h1>Hello page</h1>

	<hr/>
	<table>
	<tr>
	<th>ID</th>
	<th>이름</th>
	<th>연령</th>
	<th>메일</th>
	<th>메모</th>
	<th>Actions</th>
	</tr>
	<c:forEach var="item" items="${list}">

	<tr>
				<td>${item.getId()}</td>
				<td>${item.getName()}</td>
				<td>${item.getAge()}</td>
				<td>${item.getEmail()}</td>
				<td>${item.getMemo()}</td>
				<td><a href="updateForm?email=${item.getEmail()}">
				<button>Edit</button></a>
				
				<a href="delete?id=${item.getId()}">
				<button>Delete</button></td></a>
	</tr>
	</c:forEach>
	</table>
</body>
</html>

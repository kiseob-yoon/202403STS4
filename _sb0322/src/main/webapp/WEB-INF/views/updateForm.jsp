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
	<table>
	<form method="get" action="update">

		<tr><td><label for="name">이름</label></td>
			<td><input type="text" name="name" value="${select.name}"/></td></tr>
		<tr><td><label for="age">나이 </label></td>
			<td><input type="text" name="age" value="${select.age}"/></td></tr>
		<tr><td><label for="email">이메일 </label></td>
			<td><input type="text" name="email" value="${select.email}" readonly/></td></tr>
		<tr><td><label for="memo">메모</label></td>
			<td><textarea name="memo" cols="20" rows="5" >${select.memo}</textarea></td></tr>
		<tr><td></td><td><input type="submit" /></td></tr>
			

	</form>
	</table>
	<hr/>

</body>
</html>

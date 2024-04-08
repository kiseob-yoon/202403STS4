<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div>
<c:set var="number" value="1"/>
<c:forEach var="store" items="${storeAllList}" varStatus="loop">
<div style="width: 1200px; margin: 0 auto; text-align: center;">
<table class="table table-striped table-bordered table-hover">
<tbody>
<tr>
<td class="center-text">${number}</td>
<td class="center-text">${store.getStorename()}</td>
<td class="center-text">${store.getBusiness()}</td>
<td class="center-text">${store.getAddress()}</td>

</tr>
</tbody>
</table>
</div>
 <c:set var="number" value="${number + 1}"/> <!-- 변수 증가 -->
</c:forEach>
</div>
</body>
</html>
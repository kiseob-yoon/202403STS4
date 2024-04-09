<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>

    </style>

</head>
<body>
<div style="width: 1200px; margin: 0 auto; text-align: center;">
    <table class="table table-striped table-bordered table-hover">
        <thead class="table-light">
            <tr>
                <th scope="col" style="text-align: center;">순서</th>
                <th scope="col" style="text-align: center;">상호</th>
                <th scope="col" style="text-align: center;">업종</th>
                <th scope="col" style="text-align: center;">주소</th>
            </tr>
        </thead>
        <tbody>
            <c:set var="number" value="1"/>
            <c:forEach var="store" items="${storeAllList}" varStatus="loop">
                <tr>
                    <td class="center-text">${loop.index + 1}</td>
                    <td class="center-text" ><a href="menupan?id=${store.id}"style="text-decoration:none;">${store.storename}</a></td>
                    <td class="center-text">${store.business}</td>
                    <td class="center-text">${store.address}</td>
                </tr>
                <c:set var="number" value="${number + 1}"/> <!-- 변수 증가 -->
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
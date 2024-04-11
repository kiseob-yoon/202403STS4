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
        <form action="member_update" method="get">
        <h2>회원 정보 수정</h2>
            <table>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="id" readonly
                               value="${memberInfo.id}"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="pw" 
                               value="${memberInfo.pw}"></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" 
                               value="${memberInfo.name}"></td>
                </tr>
                
            <tr>
			<td><input type="hidden" name="memberno" value="${memberInfo.memberno}" readonly>
			</td>
			</tr>
			
            </table>    
            <input type="submit" value="저장"> 
        </form>
</body>
</html>
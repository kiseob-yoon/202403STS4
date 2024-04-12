<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
  form {
    max-width: 600px; /* 폼의 최대 너비 설정 */
    margin: auto; /* 폼을 페이지 중앙에 배치 */
  }
  .form-control {
    width: 100%; /* 입력 필드의 너비를 100%로 설정 */
  }
</style>
</head>
<body>
<form action="member_update" method="get">
<h1 style="text-align:center; margin-top:50px;">업체 수정</h1>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">ID</label>
    <input type="text" class="form-control" name="id" required readonly
                               value="${memberInfo.id}" id="id" aria-describedby="emailHelp">
  </div>

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">비밀번호</label>
    <input type="text" class="form-control" name="pw" value="${memberInfo.pw}" required id="pw" aria-describedby="emailHelp">
  </div>

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">이름</label>
    <input type="text" class="form-control" name="name" value="${memberInfo.name}" required id="name" aria-describedby="emailHelp">
  </div>
	<input type="submit" class="btn btn-success" value="저장">
	<a href="/"><input type="button" class="btn btn-success" value="홈 화면"></a>

</form>
</body>
</html>
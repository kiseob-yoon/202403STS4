<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
<form action="join" method="post">
<h1 style="text-align:center; margin-top:50px;">회원 가입</h1>
  <div class="mb-3">
    <label for="id" class="form-label">아이디</label>
    <input type="text" class="form-control" id="id" name="id" required aria-describedby="emailHelp">
  </div>

  <div class="mb-3">
    <label for="pw" class="form-label">비밀번호</label>
    <input type="text" class="form-control" id="pw" name="pw" required aria-describedby="emailHelp">
  </div>

  <div class="mb-3">
    <label for="name" class="form-label">이름</label>
    <input type="text" class="form-control" id="name" name="name" required aria-describedby="emailHelp">
  </div>

  <input type="submit" class="btn btn-success" value="확인">
  <a href="/"><input type="button" class="btn btn-success" value="홈 화면"></a>
</form>
</body>
</html>
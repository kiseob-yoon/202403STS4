<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어 등록</title>
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
<div class="header">
    <h1 style="text-align:center; margin-top:50px;">업체 등록</h1>
</div>
<form action="store_submit" method="get">
  <div class="mb-3">
    <label for="storename" class="form-label">상호명</label>
    <input type="text" class="form-control" id="storename" name="storename" required aria-describedby="emailHelp">
  </div>

  <div class="mb-3">
    <label for="business" class="form-label">업종</label>
    <input type="text" class="form-control" id="business" name="business" required>
  </div>

  <div class="mb-3">
    <label for="tel" class="form-label">전화번호</label>
    <input type="tel" class="form-control" id="tel" name="tel" pattern="02-[0-9]{3,4}-[0-9]{4}" placeholder="02-123-4567" required>
  </div>

  <div class="mb-3">
    <label for="address" class="form-label">주소</label>
    <input type="text" class="form-control" id="address" name="address" required>
  </div>

  <div class="mb-3">
    <label for="thema" class="form-label">테마</label>
    <input type="text" class="form-control" id="thema" name="Thema" required>
  </div>

  <div class="mb-3">
    <label for="latitude" class="form-label">위도</label>
    <input type="text" class="form-control" id="latitude" name="latitude" pattern="^-?([1-8]?[0-9](\.\d{1,8})?|90(\.0{1,8})?)" placeholder="예: 37.5665" title="위도는 -90.0에서 90.0 사이의 값이어야 합니다. 최대 8자리 소수점." required>
  </div>

  <div class="mb-3">
    <label for="longitude" class="form-label">경도</label>
    <input type="text" class="form-control" id="longitude" name="longitude" pattern="^-?((1[0-7][0-9]|[1-9]?[0-9])(\.\d{1,8})?|180(\.0{1,8})?)" placeholder="예: 126.9784" title="경도는 -180.0에서 180.0 사이의 값이어야 합니다. 최대 8자리 소수점." required>
  </div>

  <input type="submit" class="btn btn-success" value="업체 등록">
  <a href="/"><input type="button" class="btn btn-success" value="홈 화면"></a>
</form>
</body>
</html>

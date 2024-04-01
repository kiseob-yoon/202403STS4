<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #rest_container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap; /* 이미지들이 화면을 넘칠 경우 줄바꿈되도록 설정 */
    }
    #rest_item {
        width: 48%; /* 이미지가 옆으로 나란히 정렬되도록 너비 조정 */
        margin-bottom: 20px; /* 아래 여백 추가 */
    }
    #rest_bigimg {
        width: 100%;
        height: auto; /* 가로 세로 비율 유지 */
    }
    h1 {
        text-align: center;
    }
    .rest_info {
        text-align: center;
    }
</style>
</head>
<body>
<h1>이대맛집</h1>
<div style="text-align: right;">
    <a href="login_main">${login.name} <button>로그인</button></a>
</div>
<div id="rest_container">
    <div id="rest_item">
        <h2>천진분식</h2>
        <img id="rest_bigimg" src="img/1/img.jpeg">
        <p class="rest_info"><a href="menupan?id=1"><button>자세히 보기</button></a></p>
    </div>

    <div id="rest_item">
        <h2>맘스터치</h2>
        <img id="rest_bigimg" src="img/3/img.jpeg">
        <p class="rest_info"><a href="menupan?id=3"><button>자세히 보기</button></a></p>
    </div>
</div>

</body>
</html>
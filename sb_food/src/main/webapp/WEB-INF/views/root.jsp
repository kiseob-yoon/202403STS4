<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #rest_bigimg {
        width: 500px;
        height: auto; /* 이 속성을 사용하면 이미지의 가로 세로 비율을 유지합니다. */
    }
    h1{
    	text-align:center;
    }
</style>
</head>
<body>
<h1>맛집랭킹</h1>
<h2>천진분식</h2>
<img id="rest_bigimg" src="img/1/img.jpeg"></br>
<a href="menupan?id=1"><button>자세히 보기</button></a>


<h2>맘스터치</h2>
<img id="rest_bigimg" src="img/3/img.jpeg"></br>
<a href="menupan?id=3"><button>자세히 보기</button></a>
</body>
</html>
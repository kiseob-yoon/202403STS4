<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이대맛집</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
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
    h3{
    	text-align: center;
    }
    .rest_info {
        text-align: center;
    }
    
    section .inner{
    width: 1180px;
    margin: 0px auto;
}

section .inner .wrap{
    width: 100%;
}
section .inner .wrap::after{
    content: "";
    display: block;
    clear: both;
}
section .inner .wrap article{
    width: 280px;
    float: left;
    margin-right: 20px;
}
section .inner .wrap article:last-child{
    margin-right: 0px;
}
section .inner .wrap article h2{
    margin-bottom: 10px;
}
section .inner .wrap article h2 a{
    font:bold 16px/1 "arial";
    color: #555;
}
section .inner .wrap article p{
    font:14px/1.4 "arial";
    color: #777;
    text-align:center;
}
section .inner .wrap article .pic{
    width: 100%;
    height: 120px;
    background: #333;
    margin-bottom: 15px;
    position: relative;
    overflow: hidden;
}
section .inner .wrap article .pic img{
    object-fit: cover;
    width: 100%;
    height: 100%;
}
h2{
	text-align:center;
}

.table-striped tbody tr:nth-of-type(odd) {
    background-color: #f9f9f9;
}

/* 테이블 보더 스타일 */
.table-bordered {
    border: 1px solid #dee2e6;
}

/* 셀의 텍스트 가운데 정렬 */
.center-text {
    text-align: center;
}
    
</style>
</head>
<body>
<% 
    String info = (String) session.getAttribute("id2");
%>



<h1>이대맛집</h1>


<div style="text-align: right;">
    <% if(info == null) { %>
        <a href="login_main"><button type="button" class="btn btn-outline-success">로그인</button></a>
    <% } else { %>
        <a href="logout"><button type="button" class="btn btn-outline-success">로그아웃</button></a>
    <% } %>
</div>

<div class="WrapMain">

<section>
<h3>인기 BEST 4</h3>
    <div class="inner">
        <div class="wrap">
            <article>
                <div class="pic">
                    <img src="img/1/img.jpeg" alt="1번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">천진분식</a></h2>
                <p>중식당 맛집</p>
                <p class="rest_info"><a href="menupan?id=1"><button type="button" class="btn btn-outline-success">자세히 보기</button></a></p>
            </article>
            <article>
                <div class="pic">
                    <img src="img/3/img.jpeg" alt="2번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">맘스터치</a></h2>
                <p>햄버거 맛집</p>
                <p class="rest_info"><a href="menupan?id=3"><button type="button" class="btn btn-outline-success">자세히 보기</button></a></p>
            </article>
            <article>
                <div class="pic">
                    <img src="img/1/img.jpeg" alt="3번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">천진분식</a></h2>
                <p>중식당 맛집</p>
                <p class="rest_info"><a href="menupan?id=3"><button type="button" class="btn btn-outline-success">자세히 보기</button></a></p>
                
            </article>
                <article>
                <div class="pic">
                    <img src="img/1/img.jpeg" alt="3번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">천진분식</a></h2>
                <p>중식당 맛집</p>
                <p class="rest_info"><a href="menupan?id=3"><button type="button" class="btn btn-outline-success">자세히 보기</button></a></p>
                
            </article>
        </div>
            </div>
</section>

<section>
<h3>가성비 BEST 4</h3>
    <div class="inner">
        <div class="wrap">
            <article>
                <div class="pic">
                    <img src="img/1/img.jpeg" alt="1번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">천진분식</a></h2>
                <p>중식당 맛집</p>
                <p class="rest_info"><a href="menupan?id=1"><button type="button" class="btn btn-outline-success">자세히 보기</button></a></p>
            </article>
            <article>
                <div class="pic">
                    <img src="img/3/img.jpeg" alt="2번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">맘스터치</a></h2>
                <p>햄버거 맛집</p>
                <p class="rest_info"><a href="menupan?id=3"><button type="button" class="btn btn-outline-success">자세히 보기</button></a></p>
            </article>
            <article>
                <div class="pic">
                    <img src="img/1/img.jpeg" alt="3번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">천진분식</a></h2>
                <p>중식당 맛집</p>
                <p class="rest_info"><a href="menupan?id=3"><button type="button" class="btn btn-outline-success">자세히 보기</button></a></p>
                
            </article>
                <article>
                <div class="pic">
                    <img src="img/1/img.jpeg" alt="3번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">천진분식</a></h2>
                <p>중식당 맛집</p>
                <p class="rest_info"><a href="menupan?id=3"><button type="button" class="btn btn-outline-success">자세히 보기</button></a></p>
                
            </article>
        </div>
            </div>
</section>
<h3>맛집 정보 검색</h3>
<div class="tab" id="tab-area" style="display: flex; justify-content: center;">
    <ul class="tab_list" style="display: flex;">
    			<form action="commentAdd">
    			<input type="hidden"
					name="id" value=""><label for="rating">검색:</label>
				<select id="rating" name="grade">
					<option value="1">최신순</option>
					<option value="2">인기순</option>
				</select>
    </ul>
</div>
<div id="here"></div>



</div>
<script>
$(function() {
    $("#rating").on("change", function() {
        let sel = $(this).val();
        if (sel == '1') {
            $.ajax({
                url: '/selectAll',
                method: 'GET',
                success: function(data) {
                    $('#here').html(data);
                }
            });
        } else if (sel == '2') {
            $.ajax({
                url: '/selectRank',
                method: 'GET',
                success: function(data) {
                    $('#here').html(data);
                }
            });
        }
    });
});
</script>

</body>
</html>
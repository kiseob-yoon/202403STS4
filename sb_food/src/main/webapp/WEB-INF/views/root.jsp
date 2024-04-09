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
    .tab_list li:hover {
        text-decoration: underline;
    }
    
        .tab_list {
        display: flex;
        list-style-type: none;
    }
    
    .tab_list li {
        cursor: pointer;
        margin-right: 5px;
        padding: 5px 10px; /* 각 요소의 안쪽 여백을 조정합니다 */
        border: 1px solid #ccc; /* 테두리 추가 */
        border-radius: 5px; /* 요소의 모서리를 둥글게 만듭니다 */
    }
    
    /* 호버 상태일 때 배경색 변경 */
    .tab_list li:hover {
        background-color: #f0f0f0;
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
    <% 
    } 
    %>
</div>

<div class="WrapMain">

<section>
<h3>가성비 BEST 4</h3>
    <div class="inner">
        <div class="wrap">
        <c:forEach var="store" items="${storeAllList}" varStatus="loop">
            <article>
                <div class="pic">
                    <img src="img/${store.id}/img.jpeg" alt="1번째 콘텐츠 이미지">
                </div>
                <h2><a href="#">${store.storename}</a></h2>
                <p>${store.business} 맛집</p>
                <p class="rest_info"><a href="menupan?id=${store.id}"><button type="button" class="btn btn-outline-success">자세히 보기</button></a></p>
            </article>

             </c:forEach>
        </div>
            </div>
</section>
<h3>TOP10 맛집 정보</h3>
<div class="tab" id="tab-area" style="display: flex; justify-content: center;">
    <ul class="tab_list" style="display: flex; list-style-type: none;">
        <!-- 최신순 텍스트 -->
        <li id="latest" style="cursor: pointer; margin-right:5px">최신순</li>
        <!-- 인기순 텍스트 -->
        <li id="popularity" style="cursor: pointer;">인기순</li>
        
    </ul>
</div>
<div id="here"></div>



</div>
<script>
$(function() {
    // 최신순 클릭 이벤트 핸들러
    $("#latest").click(function() {
        $.ajax({
            url: '/selectAll',
            method: 'GET',
            success: function(data) {
                $('#here').html(data);
            }
        });
    });

    // 인기순 클릭 이벤트 핸들러
    $("#popularity").click(function() {
        $.ajax({
            url: '/selectRank',
            method: 'GET',
            success: function(data) {
                $('#here').html(data);
            }
        });
    });

    // 페이지 로드 시 초기 데이터 로드
    $.ajax({
        url: '/selectAll',
        method: 'GET',
        success: function(data) {
            $('#here').html(data);
        }
    });
});
</script>

</body>
</html>
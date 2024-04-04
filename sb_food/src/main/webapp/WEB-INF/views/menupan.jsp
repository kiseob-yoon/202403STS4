<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>이대맛집 | ${store.storename}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=xzes908xi0"></script>
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<div id="WrapTop" class="WrapTop" style="top: 0px;">
		<div class="container">
			<!-- 헤더 : Start -->
			<div class="header">

				<div class="login">
					<span style="font-size:25px;"> 
					<a href="/" style="text-decoration: none";>
			<form>
    			<input type="hidden" name="id" value="${info.id}">
        		<img src="img/logo.png" alt="홈" width="100" height="100" >
			</form>
			

							이대맛집
					</span>
					</a>
				</div>
			</div>

			<!-- //헤더 : End -->

			<div class="store">
				<span class="storeName">${store.storename}</span>

			</div>
			<!-- 네비 : Start -->
			<ul class="navi">
				<li class="owner" style="display: none;"><a href="javascript:;"><img
						class="tab_img" src="/IMAGE/Restaurant/Onepage/navi_tab05_off.gif"
						src_base="/IMAGE/Restaurant/Onepage/"
						src_over="navi_tab05_over.gif" src_on="navi_tab05_on.gif"
						src_off="navi_tab05_off.gif" alt="업주관리"></a></li>
				<li><a href="javascript:;"><img class="tab_img"
						src="/IMAGE/Restaurant/Onepage/navi_tab01_on.gif"
						src_base="/IMAGE/Restaurant/Onepage/"
						src_over="navi_tab01_over.gif" src_on="navi_tab01_on.gif"
						src_off="navi_tab01_off.gif" alt="상세정보"></a></li>
				<li><a href="javascript:;"><img class="tab_img"
						src="/IMAGE/Restaurant/Onepage/navi_tab02_off.gif"
						src_base="/IMAGE/Restaurant/Onepage/"
						src_over="navi_tab02_over.gif" src_on="navi_tab02_on.gif"
						src_off="navi_tab02_off.gif" alt="메뉴"></a></li>
				<li><a href="javascript:;"><img class="tab_img"
						src="/IMAGE/Restaurant/Onepage/navi_tab03_off.gif"
						src_base="/IMAGE/Restaurant/Onepage/"
						src_over="navi_tab03_over.gif" src_on="navi_tab03_on.gif"
						src_off="navi_tab03_off.gif" alt="리뷰"></a></li>
				<li><a href="javascript:;"><img class="tab_img"
						src="/IMAGE/Restaurant/Onepage/navi_tab04_off.gif"
						src_base="/IMAGE/Restaurant/Onepage/"
						src_over="navi_tab04_over.gif" src_on="navi_tab04_on.gif"
						src_off="navi_tab04_off.gif" alt="찾아가는길"></a></li>
				<a href="logout"><button>${status}</button></a>				
			</ul>

			<!-- //네비 : End -->
		</div>
	</div>
	<div class="WrapMain">

		<div class="mainArea">
			<div class="areaThumbnail">
				<dl>
					<dt>
						<img id="rest_bigimg" src="img/${store.id}/img.jpeg">
					</dt>
				</dl>
			</div>

			<div class="areaBasic">
				<div class="section">
					<dl class="restName">
						<dt>업체명</dt>
						<dd class="name">${store.storename}</dd>
					</dl>
					<dl class="restType">
						<dt>업종</dt>
						<dd class="type">${store.business}</dd>
					</dl>
				</div>
				<div class="section">
					<dl class="restTel">
						<dt>전화번호</dt>
						<dd class="tell">${store.tel}</dd>
					</dl>
					<dl class="restAdd">
						<dt>주소</dt>
						<dd class="add1">${store.address}</dd>
					</dl>
				</div>
				<div class="section">
					<dl class="restGrade">
						<dt>평점</dt>
						<dd class="grade">${grade}</dd>
					</dl>
					<dl class="restTheme">
						<dt>테마</dt>
						<dd class="theme">${store.thema}</dd>
					</dl>
				</div>
			</div>
		</div>


		<div class="tabInfo">
			<h3>메뉴판</h3>
			<table class="table table-striped table-bordered table-hover">
				<thead class="table-light">
					<tr>
						<th scope="col" style="text-align: center;">메뉴</th>
						<th scope="col" style="text-align: center;">가격</th>
						<th scope="col" style="text-align: center;">수량</th>
						<th scope="col" style="text-align: center;">분류</th>

						<th scope="col" style="text-align: center;">수정</th>
					</tr>
				</thead>
				<c:forEach var="item" items="${menu}">
					<tbody>
						<tr>

							<td class="center-text">${item.getMenu()}</td>
							<td class="center-text">${item.getPrice()}원</td>
							<td class="center-text">
								<form>
									<input type="checkbox"> <input type="number"
										name="quantity" min="1" value="1">
								</form>
							</td>
							<td class="center-text">${item.getItem()}</td>


							<td class="center-text"><a
								href="updateForm?num=${item.getNum()}">
									<button>수정</button>
							</a>
							
								<a href="delete?num=${item.getNum()}&id=${item.getId()}">
								<button>삭제</button>
								</a>
												
							<%-- <a href="#" class="delete-link" data-num="${item.getNum()}"> 
									<button class="delete-button">삭제</button></a> --%>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>

		</div>

		<a href="insertForm?id=${store.id}">
		<button>메뉴 등록</button></a>
		<p>
		
		<h3>리뷰&평가</h3>
		
		<div>
		<c:forEach var="comment" items="${comments}">
		<section>
			<div class="nickname">
			<img id="user" src="img/user.png">
            ${comment.getNickname()}
            ${comment.getCurTime()}
            <span style="float:right">평점:${comment.getGrade()}</span>
            </div>
            <div class="comment">${comment.getComment()}</div>
		
		</section>
		</c:forEach>
	
<div class="container" style="width:250px; text-align:center;">
    <ul class="pagination">
        <c:forEach var="pgn" items="${pgnList}">
            <li class="page-item">
                <a class="page-link pgn" href="redirect?page=${pgn.pageNo}&id=${store.id}">
                    <c:choose>
                        <c:when test="${pgn.curPage}">
                            <u>${pgn.display}</u>
                        </c:when>
                        <c:otherwise>
                            ${pgn.display}
                        </c:otherwise>
                    </c:choose>
                </a>
            </li>
        </c:forEach>
    </ul>
</div>
<button onclick="toggleForm()">댓글쓰기</button>
		</div>
		
<div id="reviewForm" class="reviewInfo" style="border: 1px solid #ccc;">
    <form action="commentAdd">
        <img id="user" src="img/user.png">
        <input type="text" name="nickname" value="${info.name}" readonly style="margin-bottom: 10px;"><br>
        <input type="hidden" name="id" value="${store.id}">
        <label for="rating">평점:</label>
        <select id="rating" name="grade">
            <option value="5.0">5.0</option>
            <option value="4.0">4.0</option>
            <option value="3.0">3.0</option>
            <option value="2.0">2.0</option>
            <option value="1.0">1.0</option>
        </select><br>
        <textarea name="comment" rows="9" placeholder="댓글을 입력해주세요" style="margin-bottom: 10px;"></textarea><br>
        <input type="submit" value="등록" style="float: right;">
        <input type="reset" value="초기화" style="float: right; margin-right:10px;">
    </form>
</div>

		<p>
		<h3>찾아가는길</h3>
		<div id="map" style="width:100%;height:400px;"></div>
	</div>

	</div>
	</div>

	<script>
		document.querySelectorAll('.delete-link').forEach(function(link) {
			link.addEventListener('click', function(event) {
				event.preventDefault(); // 기본 동작 방지

				var num = this.getAttribute('data-num');
				var result = confirm("게시물을 삭제하시겠습니까?");

				if (result) {
					location.href = 'delete?num=' + num;
					
				}
			});
		});
		
	    function toggleForm() {
	        var reviewForm = document.getElementById("reviewForm");
	        if (reviewForm.style.display === "none") {
	            reviewForm.style.display = "block";
	        } else {
	            reviewForm.style.display = "none";
	        }
	    }

	    window.onload = function() {
	        // 페이지가 로드될 때 폼을 숨깁니다.
	        var reviewForm = document.getElementById("reviewForm");
	        reviewForm.style.display = "none";
	    };
	    
	    var HOME_PATH = window.HOME_PATH || '.';

	    var cityhall = new naver.maps.LatLng(${store.latitude}, ${store.longitude}),
	        map = new naver.maps.Map('map', {
	            center: cityhall.destinationPoint(0, 500),
	            zoom: 15
	        }),
	        marker = new naver.maps.Marker({
	            map: map,	
	            position: cityhall
	        });

	    var contentString = [
	            '<div class="iw_inner">',
	            '   <h3>${store.storename}</h3>',
	            '   <p>${store.address}<br />',
	            '       <img src="'+ HOME_PATH +'/img/example/hi-seoul.jpg" width="55" height="55" alt="${store.storename}" class="thumb" /><br />',
	            '       <br />',
	            '       ',
	            '   </p>',
	            '</div>'
	        ].join('');

	    var infowindow = new naver.maps.InfoWindow({
	        content: contentString
	    });

	    naver.maps.Event.addListener(marker, "click", function(e) {
	        if (infowindow.getMap()) {
	            infowindow.close();
	        } else {
	            infowindow.open(map, marker);
	        }
	    });

	    infowindow.open(map, marker);
	    
	    document.addEventListener('DOMContentLoaded', function() {
	        const commentInput = document.querySelector('textarea[name="comment"]');
	        const charCountDisplay = document.createElement('div');
	        charCountDisplay.style.marginTop = '5px';
	        charCountDisplay.style.fontSize = '12px';
	        commentInput.parentNode.insertBefore(charCountDisplay, commentInput.nextSibling);

	        commentInput.addEventListener('input', function() {
	            const charCount = this.value.length;
	            charCountDisplay.textContent = '글자 수: ' + charCount;
	        });
	    });
	    	
	    
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
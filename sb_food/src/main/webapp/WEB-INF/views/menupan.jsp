<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>이대맛집 | ${store.storename}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript"
	src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=xzes908xi0"></script>
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<div id="WrapTop" class="WrapTop" style="top: 0px;">
		<div class="container">
			<div class="header">

				<div class="login">
					<span style="font-size: 25px;"> 
								<input type="hidden" name="id" value="${info.id}">
								<a href="/" style="text-decoration: none; color: black;">
								<img src="img/logo.png" alt="홈" width="100" height="100">
							 이대맛집 </a></span>
				</div>
			</div>

			<!-- //헤더 : End -->

			<div class="store">
				<span class="storeName">${store.storename}</span>

			</div>
			<ul class="nav nav-pills">
				<li class="nav-item"><a href="#" class="btn btn-outline-success" onclick="scrollToSection('menu')">메뉴판</a>
				<li class="nav-item"><a href="#" class="btn btn-outline-success" onclick="scrollToSection('review')">리뷰</a>
				<li class="nav-item"><a href="#" class="btn btn-outline-success" onclick="scrollToSection('directions')">찾아가는길</a>
				<li class="nav-item"><a href="logout"><button class="btn btn-outline-success">${status}</button></a></li>
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
						<dd id="starRating" class="grade">${grade}</dd>
						<dd style="margin-bottom: 7px;">${grade2}점
							| <a href="#" onclick="scrollToSection('review')" style="text-decoration: none;">후기 ${count}개</a>
						</dd>
					</dl>
					<script>
    // 평점 평균 값 (예시로 사용)
    let averageRating = ${grade}; // 이 값을 서버에서 받아오는 방식으로 설정해야 합니다.

    // 별점을 표시할 요소
    let starRatingElement = document.getElementById("starRating");

    // 별점 평균을 소수점 둘째 자리까지 표시 (반올림)
    let roundedRating = Math.round(averageRating * 10) / 10;

    // 평점을 별로 표시하기 위한 코드
    let starHTML = "";
    for (let i = 0; i < Math.floor(roundedRating); i++) {
    	starHTML += '<img src="img/star-fill.svg" width="20" height="20" />';
    }
    if (roundedRating % 1 !== 0) {
    	starHTML += '<img src="img/star-half.svg" width="20" height="20" />'; // 소수점 반올림 시 별 반개를 추가
    }

    // 결과를 요소에 적용
    starRatingElement.innerHTML = starHTML;
</script>


					<dl class="restTheme">
						<dt>테마</dt>
						<dd class="theme">${store.thema}</dd>
					</dl>
				</div>
			</div>
		</div>


		<div class="tabInfo">
			<h3 id="menu">메뉴판</h3>
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


							<td class="center-text" >
							<a style="margin-right:2px;" href="updateForm?num=${item.getNum()}"><button>수정</button></a> 
								
							<a href="delete?num=${item.getNum()}&id=${item.getId()}"><button>삭제</button></a>
							
							<%-- <a href="#" class="delete-link" data-num="${item.getNum()}"> 
									<button class="delete-button">삭제</button></a> --%></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>

		</div>

		<a href="insertForm?id=${store.id}">
			<button type="button" class="btn btn-outline-success">메뉴 등록</button>
		</a>
		<p>
		<h3 id="review">리뷰&평가</h3>

		<div>
			<c:forEach var="comment" items="${comments}" varStatus="loop">
				<section>
					<div class="nickname">
						<img id="user" src="img/user.png"> ${comment.getNickname()}
						${comment.getCurTime()} <span style="float: right">${comment.getGrade()}</span>
						<div id="starRating_${loop.index}"
							style="float: right; margin-right: 10px"></div>
					</div>
					<div class="comment">${comment.getComment()}</div>
				</section>
			</c:forEach>

			<script>
document.addEventListener('DOMContentLoaded', function() {
    <c:forEach var="comment" items="${comments}" varStatus="loop">
        var starRatingElement = document.getElementById("starRating_${loop.index}");

        var grade = ${comment.getGrade()};
        var starHTML = "";

        for (var i = 0; i < Math.floor(grade); i++) {
            starHTML += "⭐";
        }
        if (grade % 1 !== 0) {
            starHTML += '<img src="img/star-half.svg" width="20" height="20" />';
        }

        // 결과를 요소에 적용
        starRatingElement.innerHTML = starHTML;
    </c:forEach>
});
</script>

			<div class="container" style="width: 250px; text-align: center;">
				<ul class="pagination">
					<c:forEach var="pgn" items="${pgnList}">
						<li class="page-item"><a class="page-link pgn"
							href="redirect?page=${pgn.pageNo}&id=${store.id}"> <c:choose>
									<c:when test="${pgn.curPage}">
										<u>${pgn.display}</u>
									</c:when>
									<c:otherwise>
                            ${pgn.display}
                        </c:otherwise>
								</c:choose>
						</a></li>
					</c:forEach>
				</ul>
			</div>
			<button type="button" class="btn btn-outline-success" onclick="toggleForm()">댓글쓰기</button>
			<p>
		</div>

		<div id="reviewForm" class="reviewInfo"
			style="border: 1px solid #ccc;">
			<form action="commentAdd">
				<img id="user" src="img/user.png"> <input type="text"
					name="nickname" value="${info.name}" readonly
					style="margin-bottom: 10px;"><br> <input type="hidden"
					name="id" value="${store.id}"> <label for="rating">평점:</label>
				<select id="rating" name="grade">
					<option value="5.0">⭐⭐⭐⭐⭐</option>
					<option value="4.0">⭐⭐⭐⭐</option>
					<option value="3.0">⭐⭐⭐</option>
					<option value="2.0">⭐⭐</option>
					<option value="1.0">⭐</option>
				</select><br>
				<textarea name="comment" rows="9" placeholder="댓글을 입력해주세요"
					style="margin-bottom: 10px;"></textarea>
				<br> <input class="btn btn-outline-success" type="submit" value="등록" style="float: right;">
				<input class="btn btn-outline-success" type="reset" value="초기화"
					style="float: right; margin-right: 10px;">
			</form>
		</div>

		<p>
		<h3 id="directions">찾아가는길</h3>
		<div id="map"
			style="width: 100%; height: 400px; margin-bottom: 500px;"></div>
	</div>

	</div>
	<footer>
		<div class="inner">
			<div class="upper">
				<h1>이대맛집</h1>
				<ul>
					<li><a href="#">Policy</a></li>
					<li><a href="#">Terms</a></li>
					<li><a href="#">Family Site</a></li>
					<li><a href="#">Sitemap</a></li>
				</ul>
			</div>
			<div class="lower">
				<address>
					Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quas,
					facere.<br> TEL : 031-111-1234 C.P : 010-1234-5678
				</address>
				<p>2024 이대맛집 &copy; copyright all rights reserved.</p>
			</div>
		</div>
	</footer>
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
	    
	    function scrollToSection(sectionId) {
	        const section = document.getElementById(sectionId);
	        if (section) {
	            section.scrollIntoView({ behavior: 'smooth' });
	        }
	    }
	    	
	    
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
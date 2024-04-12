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
<title>맛집랭킹 | ${store.storename}</title>
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

<header class="b-example-divider">
    <div class="container1">
           	<div class="text-end" style="margin-right:35px;">
            <a href="logout" style="margin-right:5px;"><button type="button" class="btn btn-outline-primary">${status}</button></a>
                <a href="member_join"><button type="button" class="btn btn-warning">Sign-up</button></a>
                <a href="storeUpdateForm?id=${store.id}" class="btn btn-outline-success">업체정보 수정</a>
            </div>
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
            </a>
            

            <div class="login" style="margin-left:150px;">
                <span style="font-size: 25px;"> 
                    <input type="hidden" name="id" value="${info.id}">
                    <a href="/" style="text-decoration: none; color: black;">
                        <img src="img/award.svg" alt="홈" width="100" height="100"> 맛집랭킹
                    </a>
                </span>
            </div>

            
            <div class="storeName-container">
                <h2 class="storeName" style="margin-left:75px; font-size:48px;">${store.storename}</h2>
            </div>
                                <div class="nav-wrapper" style="margin-right:25px; font-size:24px;">
                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0" style="margin-left:50px";>                    
                    <li><a href="/" class="nav-link px-2 text-secondary">Home</a></li>
                    <li><a href="#" class="nav-link px-2 text-secondary" onclick="scrollToSection('menu')">메뉴판</a></li>
                      <li><a href="#" class="nav-link px-2 text-secondary" onclick="scrollToSection('review')">리뷰</a></li>
                        <li><a href="#" class="nav-link px-2 text-secondary" onclick="scrollToSection('directions')">찾아가는길</a></li>
                </ul>
        </div>
        

            </div>

            <hr style="border-top: 1px solid #e9ecef; width: 100%; margin: 0;">
    </div>
</header>

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
						<dd id="starRating" class="grade" style="margin-left:30px;">${grade}</dd>
						<dd style="margin-bottom: 7px;">${grade2}점
							| <a href="#" onclick="scrollToSection('review')" style="text-decoration: none;">후기 ${count}개</a>
						</dd>
					</dl>
					</div>

					<div class="section">
					<dl class="restTheme">
						<dt>테마</dt>
						<dd class="theme">${store.thema}</dd>
					</dl>
					</div>

					<div class="section">
					<dl class="hits">
						<dt>조회수</dt>
						<dd class="hits">${store.hits}회</dd>
					</dl>
					</div>
				

			</div>
			

				

					
		</div>
					<div class="section" style="padding: 50px;">
					<dl class="likes">
					<form action="likePost">
    				<input type="hidden" name="storeId" value="${store.id}">
    				<span>
    				
        			<button type="submit" class="btn btn-outline-primary"><img src="img/hand-thumbs-up.svg" style="margin:0px 5px 5px 0px;">좋아요</button>
    				</span>
					</form>
						<dd class="likes">${store.likes}명이 좋아합니다.</dd>
					</dl>
					</div>
							
		
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


							<td class="center-text">
							<a style="margin-right:2px;" href="updateForm?num=${item.getNum()}" id="updateButton"><button>수정</button></a>
								
							<a href="delete?num=${item.getNum()}&id=${item.getId()}"><button>삭제</button></a>
							
							<%-- <a href="#" class="delete-link" data-num="${item.getNum()}"> 
									<button class="delete-button">삭제</button></a> --%></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>

		</div>

			<button type="button" class="btn btn-outline-success" onclick="menuForm()">메뉴 등록</button>
		<div id="here" style="margin-bottom:50px;"></div><p>	
		
		<div id="insertForm" class="insertInfo">
		<h3>메뉴 입력</h3>
		<form action="insert" style="margin-bottom:50px;">
		<table>
		<tr>
		<th>메뉴</th>
		<td><input type="text" name="menu"></td>
		</tr>
		<tr>
		<th>가격</th>
		<td><input type="text" name="price"></td>
		</tr>
		<tr>
		<th>품목</th>
		<td><input type="text" name="item"></td>

		</tr>
		<tr>
		<td><input type="hidden" name="id" value="${store.id}" readonly> </td>
		</tr>
		
		
		</table>
		<input type="submit" value="메뉴 추가" class="green-button">
		<input type="reset" value="다시 입력하기" class="green-button">
		</form>
		
		
		
		</div>
		
		<p>
		<h3 id="review">리뷰&평가</h3>

		<div>
			<c:forEach var="comment" items="${comments}" varStatus="loop">
				<section>
					<div class="nickname">
						<img id="user" src="img/user1.png"> ${comment.getNickname()}
						${comment.getCurTime()}<span style="float: right">${comment.getGrade()}</span>
						
						<div id="starRating_${loop.index}"
							style="float: right";>
						
						</div>
						<img class="toggleMenuBtn" src="img/three-dots.svg" alt="Toggle Menu" style="cursor: pointer; width: 20px; height: 20px;">
		
					</div>
					<ul class="menu" style="display: none;">
    					<a href="commentsUpdateForm?num=${comment.getNum()}&id=${store.id}" id="commentButton" style="text-decoration:none; "><li>수정</li></a>

    					<a href="commentsDelete?num=${comment.getNum()}&id=${store.id}" style="text-decoration:none;"><li>삭제</li></a>
					</ul>

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
			<div id="commentUpdate"></div>
			</p>
			<button type="button" class="btn btn-outline-success" onclick="toggleForm()" style="margin-bottom:10px;">댓글쓰기</button>
			
			<p>
		</div>

		<div id="reviewForm" class="reviewInfo"
			style="border: 1px solid #ccc; margin-bottom:50px;">
			<form action="commentAdd">
				<img id="user" src="img/user1.png"> <input type="text"
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
				<br> <input id="sub" class="btn btn-outline-success" type="submit" value="등록" style="float: right;">
				<input id=replay class="btn btn-outline-success" type="reset" value="초기화"
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
				<h1>맛집랭킹</h1>
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
				<p>2024 맛집랭킹 &copy; copyright all rights reserved.</p>
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
		
		
	    function menuForm() {
	        var insertForm = document.getElementById("insertForm");
	        if (insertForm.style.display === "none") {
	        	insertForm.style.display = "block";
	        } else {
	        	insertForm.style.display = "none";
	        }
	    	
	    }
		
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
	        var insertForm = document.getElementById("insertForm");
	        insertForm.style.display = "none";
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
	    
	    $(document).ready(function() {
	        var clicked = false; // 버튼이 클릭되었는지 여부를 추적하는 변수

	        $(document).on("click", "#updateButton", function(e) {
	            e.preventDefault(); // 링크의 기본 동작인 페이지 이동을 방지합니다.
	            
	            if (!clicked) { // 버튼이 처음 클릭되었을 때
	                var url = $(this).attr("href"); // 링크의 URL을 가져옵니다.
	                $.ajax({
	                    url: url, // 가져온 URL로 Ajax 요청을 보냅니다.
	                    method: 'GET',
	                    success: function(data) {
	                        $('#here').html(data); // 성공적으로 데이터를 받았을 때 페이지를 업데이트합니다.
	                    },
	                    error: function(xhr, status, error) {
	                        console.error(xhr.responseText); // 에러 발생 시 콘솔에 에러 메시지를 출력합니다.
	                    }
	                });
	                clicked = true; // 버튼이 클릭되었음을 표시합니다.
	            } else { // 버튼이 이미 클릭된 상태일 때
	                // 원래의 폼으로 돌아가는 작업을 수행합니다.
	                // 예를 들어, 이전 상태로 페이지를 리로드하거나, 폼을 초기 상태로 되돌릴 수 있습니다.
	                location.reload(); // 페이지를 다시 로드하여 초기 상태로 복원합니다.
	                clicked = false; // 버튼 클릭 여부를 초기화합니다.
	            }
	        });
	    });
	    
	    $(document).ready(function() {
	        var clicked = false; // 버튼이 클릭되었는지 여부를 추적하는 변수

	        $(document).on("click", "#commentButton", function(e) {
	            e.preventDefault(); // 링크의 기본 동작인 페이지 이동을 방지합니다.
	            
	            if (!clicked) { // 버튼이 처음 클릭되었을 때
	                var url = $(this).attr("href"); // 링크의 URL을 가져옵니다.
	                $.ajax({
	                    url: url, // 가져온 URL로 Ajax 요청을 보냅니다.
	                    method: 'GET',
	                    success: function(data) {
	                        $('#commentUpdate').html(data); // 성공적으로 데이터를 받았을 때 페이지를 업데이트합니다.
	                    },
	                    error: function(xhr, status, error) {
	                        console.error(xhr.responseText); // 에러 발생 시 콘솔에 에러 메시지를 출력합니다.
	                    }
	                });
	                clicked = true; // 버튼이 클릭되었음을 표시합니다.
	            } else { // 버튼이 이미 클릭된 상태일 때
	                // 원래의 폼으로 돌아가는 작업을 수행합니다.
	                // 예를 들어, 이전 상태로 페이지를 리로드하거나, 폼을 초기 상태로 되돌릴 수 있습니다.
	                location.reload(); // 페이지를 다시 로드하여 초기 상태로 복원합니다.
	                clicked = false; // 버튼 클릭 여부를 초기화합니다.
	            }
	        });
	    });
	    
	   
	    
	    document.addEventListener('DOMContentLoaded', function() {
	        var toggleMenuButtons = document.querySelectorAll('.toggleMenuBtn');

	        toggleMenuButtons.forEach(function(button) {
	            button.addEventListener('click', function() {
	                // 버튼의 부모 요소들 중 'section'을 찾습니다.
	                var parentSection = this.closest('section');
	                // 찾은 'section' 내에서 '.menu' 클래스를 가진 요소를 찾습니다.
	                var menu = parentSection.querySelector('.menu');

	                if (menu) {
	                    // 메뉴의 표시 상태를 토글합니다.
	                    menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
	                }
	            });
	        });
	    });

	    
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menupan</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<div id="WrapTop" class="WrapTop" style="top: 0px;">
		<div class="container">
			<!-- 헤더 : Start -->
			<div class="header">

				<div class="login">
					<span style="font-size:25px;"> <form action="/root" method="get">
    <input type="hidden" name="id" value="${info.id}">
    <button type="submit">
        <img src="img/menupan.png" alt="홈" width="100" height="100">
    </button>
</form>

							이대맛집
					</span>
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
						<dd class="grade">${store.grade}</dd>
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
			<img id="user" src="img/user.png">
            <div class="nickname">${comment.getNickname()}</div>
            <div class="comment">${comment.getComment()}</div>
		
		</section>
		</c:forEach>
		
		<div style="width:680px; text-align:center;">	
    	<c:forEach var="pgn" items="${pgnList}">
		<a class="pgn" href="redirect?page=${pgn.pageNo}&id=${store.id}">
    	<c:choose>
        <c:when test="${pgn.curPage}">
            <u>${pgn.display}</u>
        </c:when>
        <c:otherwise>
            ${pgn.display}
        </c:otherwise>
    	</c:choose>
		</a>&nbsp;
    	</c:forEach>
    	
		</div>
		</div>
		
		<div class="reviewInfo">
		<form action="commentAdd" style="border">
		아이디<input type="text" name="nickname" value="${info.name}"readonly style="margin-bottom:10px;">
		<input type="hidden" name="id" value="${store.id}">
		<textarea name="comment" rows="10"></textarea>
		<input type="submit" value="글쓰기">
		
		</form>
		</div>

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
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
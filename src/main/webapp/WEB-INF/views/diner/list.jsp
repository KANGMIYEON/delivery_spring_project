<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../include/header.jsp"></jsp:include>
<link type="text/css" rel="stylesheet" href="/resources/css/list.css">
<script type="text/javascript" src="/resources/js/paging.js"></script>

<div class="header-box">
    <div class="search-box">
        <button type="button" class="gps-btn">
            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="red" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
            </svg>
        </button>
        <div class="search-input-box">
            <input id="search-input" type="text" placeholder="건물명, 도로명, 지번으로 검색하세요." value="${addr.jibunAddr}"></input>
            <button id="search-btn" type="button">검색</button>
        </div>
    </div>
</div>
		<form id="addr-form" action="/diner/search" method="get">
			<input type="text" id="jibunAddr" name="jibunAddr" value="${addr.jibunAddr}" hidden>
			<input type="text" id="siNm" name="siNm" value="${addr.siNm}" hidden>
			<input type="text" id="sggNm" name="sggNm" value="${addr.sggNm}" hidden>
			<input type="text" id="emdNm" name="emdNm" value="${addr.emdNm}" hidden>
			<input type="text" name="category" value="${category}" hidden>
		</form>
<main>
	<div class="category">
		<ul class="nav justify-content-center">
			<li class="nav-item">
				<div class="category-btn" data-cat="0">전체보기</div>
			</li>
			<li class="nav-item">
				<div class="category-btn" data-cat="1">1인분 주문</div>
			</li>
			<li class="nav-item">
				<div class="category-btn" data-cat="2">프랜차이즈</div>
			</li>
			<li class="nav-item">
				<div class="category-btn" data-cat="3">치킨</div>
			</li>
			<li class="nav-item">
				<div class="category-btn" data-cat="4">피자/양식</div>
			</li>
			<li class="nav-item">
				<div class="category-btn" data-cat="5">중국집</div>
			</li>
			<li class="nav-item">
				<div class="category-btn" data-cat="6">한식</div>
			</li>
			<li class="nav-item">
				<div class="category-btn" data-cat="7">일식/돈까스</div>
			</li>
			<li class="nav-item">
				<div class="category-btn" data-cat="8">족발/보쌈</div>
			</li>
			<li class="nav-item">
				<div class="category-btn" data-cat="9">야식</div>
			</li>
			<li class="nav-item">
				<div class="category-btn" data-cat="10">분식</div>
			</li>
			<li class="nav-item">
				<div class="category-btn" data-cat="11">카페/디저트</div>
			</li>
			<li class="nav-item">
				<div class="category-btn" data-cat="12">편의점/마트</div>
			</li>
		</ul>
	</div>

	<div class="contents bg-light">
		
		<div class="selection-wrap">
			<div class="row justify-content-end">
				<div class="col-6 ">
					<select name="" id="category-option">
						<option value="">기본 정렬순</option>
						<option value="">거리순</option>
						<option value="">별점순</option>
						<option value="">리뷰 많은 순</option>
					</select>
				</div>
				<div class="col-6">
					<select name="" id="search-option">
						<option value="">기본 정렬순</option>
						<option value="">거리순</option>
						<option value="">별점순</option>
						<option value="">리뷰 많은 순</option>
					</select>
				</div>
			</div>
		</div>
		<div class="registered py-5 bg-light">
				<c:forEach items="${list}" var="diner" varStatus="status" >
					<c:if test="${status.index%2==0}">
						<div class="one-row justify-content-center"> 
					</c:if>
					<!--  -->
					<c:if test="${status.index%2!=0 || status.index+1!=fn:length(list)}">
						<div class="diner-card bg-white" id="diner-card">
							<div class="diner-img">
								<img src="/resources/source/dinerimg.PNG" alt="" width="80px" height="80px">
							</div>
							<div class="diner-body">
								<a href="/detail"><h5 class="diner-title">${diner.diner_name}</h5></a>
								<p class="diner-text">
								<span class="score">★3.8</span>
								| 리뷰 1902 | 사장님댓글 791 
								</p>
								<p class="diner-text">
								<span class="del-option">${diner.diner_method_pay}</span> |
								<span>${diner.diner_min_pay}원 이상 배달</span>
								</p>
								<p class="delivery-time">
								22분
								</p>
							</div>
						</div>
					</c:if>
					<c:if test="${status.index%2==1 || status.index+1 == fn:length(list)}"> 
						</div>
					</c:if>
				</c:forEach>
			
		</div>
	</div>

</main>
<div id="endList"></div>
<script>
let category = '<c:out value="${category}" />';
</script>
<script src="/resources/js/list.js"></script>
<jsp:include page="../include/footer2.jsp"></jsp:include>

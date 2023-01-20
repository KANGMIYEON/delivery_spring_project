<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>먹어요</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<link type="text/css" rel="stylesheet" href="/resources/css/myOrderList.css">

<div class="category">
	<ul class="nav justify-content-center">
		<li class="nav-item">
			<div class="category-btn" onclick='location.href ="/order/myOrderList";'>주문/결제 조회</div>
		</li>
		<li class="nav-item">
			<div class="category-btn" onclick='location.href ="/dibs/myDibsList";'>찜목록</div>
		</li>
		<li class="nav-item">
			<div class="category-btn" id="cate-hh">리뷰 관리</div>
		</li>
		<li class="nav-item">
			<div class="category-btn" id="cate-pp">적립금 내역</div>
		</li>
		<li class="nav-item">
			<div class="category-btn" onclick='location.href ="/member/detail_userInfo";'>회원 정보</div>
		</li>
	</ul>
</div>


<main>
	<div class="row justify-content-center pt-5">
	<c:forEach items="${orderInfoList }" var="oiList">
	<fmt:parseDate value="${fn:substring(oiList.order_code, 0, 8)}" var="dateValue" pattern="yyyyMMdd"/>
	  <div class="col-sm-8 card-wrap">
	   	<h5 class="card-head"><fmt:formatDate value="${dateValue }" pattern="yyyy.MM.dd"/> 주문</h5>
		<div class="card mb-3">
		 <div class="row g-0 align-items-center">
		    <div class="col-md-2 ">
		      <img src="/resources/source/chicken.png" class="img-fluid rounded-start" alt="...">
		    </div>
		    <!-- 여러 메뉴 주문 시 반복 -->
		    <c:forEach items="${orderDetailList }" var="odList">
			    <div class="col-md-8">
			      <div class="card-body">
			        <h5 class="card-title">푸라닭 ${odList.basket}</h5>
			        <p class="card-text">20000원 ＊ 1 개</p>
			        <p class="card-text"><small class="text-muted">옵션.....................</small></p>
			      </div>
			    </div>
		    </c:forEach>
		    <div class=col-md-2>
		      	<div class="btn border-secondary mb-2 review-btn" style="--bs-border-opacity: .5;">리뷰 작성하기</div>
		      	<div class="btn border-secondary review-btn" style="--bs-border-opacity: .5;">교환 반품 신청</div>
		    </div>
		  </div>
		</div>
	  </div>
	</c:forEach>
	  
	 <!--  <div class="col-sm-8 card-wrap">
	   	<h5 class="card-head">2023.1.17 주문</h5>
		<div class="card mb-3">
		 <div class="row g-0 align-items-center">
		    <div class="col-md-2 ">
		      <img src="/resources/source/chicken.png" class="img-fluid rounded-start" alt="...">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card-title">푸라닭 블랙알리오치킨</h5>
		        <p class="card-text">20000원 ＊ 1 개</p>
		        <p class="card-text"><small class="text-muted">옵션.....................</small></p>
		      </div>
		    </div>
		    <div class=col-md-2>
		      	<div class="btn border-secondary mb-2 review-btn" style="--bs-border-opacity: .5;">리뷰 작성하기</div>
		      	<div class="btn border-secondary review-btn" style="--bs-border-opacity: .5;">교환 반품 신청</div>
		    </div>
		  </div>
		</div>
	  </div> -->
	  
	  
	</div>
	

</main>

<jsp:include page="../include/footer2.jsp"></jsp:include>

<script src="/resources/js/detail_userInfo.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>시공 상담</title>
	<title>Being</title>

	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
	<!--
			CSS
			============================================= -->

	<!-- <style>@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');</style> -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/linearicons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/1.6.11/css/lightgallery.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/interior.css">

<style>
            /*datepicker에서 사용한 이미지 버튼 style적용*/
            img.ui-datepicker-trigger {
                margin-left:5px; vertical-align:middle; cursor:pointer;
}
        </style>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <!-- datepicker 한국어로 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
      

</head>

<header>
<div class="login-logo">
         <a href="${pageContext.request.contextPath}/main/index.do">
            <img src="${pageContext.request.contextPath}/resources/img/logo4.png" alt="" title="" width="75px" height="75px"/>
         Being House
         </a>
      </div>
</header>
<body>

<%@ include file="../include/header.jspf" %>

<div class="box">
<form action="write.do" method="post">

<p>
	제목:<br/><input type="text" name="title" value="${param.title}">
	<c:if test="${errors.title}">제목을 입력하세요.</c:if>
</p>

<div id="interior-form-select">               
     <div id="interior-category">
          <ul class="interior-category">
          
             <li class="interior-ct">
                   <select id="name" name="name">
                   <option value="">업체 선택</option>
                         <option value="(주)개금디자인그룹">(주)개금디자인그룹</option>
                         <option value="(주)제이디자인">(주)제이디자인</option>
                         <option value="모던하우스">모던하우스</option>
                         <option value="디자인공간">디자인공간</option>
                         <option value="에버리치인테리어">에버리치 인테리어</option>
                         <option value="인테리어마루">인테리어 마루</option>
                         <option value="다린인테리어디자인">다린인테리어디자인</option>
                         <option value="디자인스토리">디자인스토리</option>
                         <option value="한샘리하우스">한샘리하우스</option>
                         <option value="디오디자인">디오디자인</option>
                         <option value="동산인테리어">동산인테리어</option>
                         <option value="이레토탈">이레토탈</option>
                         <option value="더라이브러리크리에이티브">더 라이브러리 크리에이티브</option>
                         <option value="디자인담다">디자인담다</option>
                         <option value="공간디자인컴퍼니">공간디자인컴퍼니</option>
                         <option value="박지희디자인">박지희 디자인</option>
                         <option value="원투디자인">원투 디자인</option>
                         <option value="코이디자인 ">코이 디자인</option>
                         <option value="실내건축전문가디자인그룹예아">실내건축전문가 디자인그룹예아</option>
                         <option value="달콤디자인">달콤 디자인</option>
                         <option value="엔샵디자인">엔샵디자인</option>
                         <option value="LG지인서광주점초원하우징">LG지인 서광주점 초원하우징</option>
                         <option value="현대데코인테리어">현대데코인테리어</option>
                         <option value="제우스디자인">제우스디자인</option>
                         <option value="올인홈디자인">올인홈디자인</option>
                         <option value="미라클인테리어">미라클인테리어</option>
                         <option value="디자인룩">디자인룩</option>
                         <option value="주식회사큐브인테리어">주식회사 큐브인테리어</option>
                         <option value="복인테리어">복인테리어</option>
                         <option value="큐원인테리어">큐원인테리어</option>
                         
            </select>
             </li>
         </ul>
     </div>
</div>

<div id="interior-form-select">               
     <div id="interior-category">
          <ul class="interior-category">
             <li class="interior-ct">
                   <select id="area" name="area">
                   <option value="">-평수-</option>
                         <option value="10평 이하">10평 이하</option>
                         <option value="20평대">20평대</option>
                         <option value="30평대">30평대</option>
                         <option value="40평대">40평대</option>
                         <option value="50평대 이상">50평대 이상</option>
            </select>
             </li>
         </ul>
     </div>
</div>

<p><input type="checkbox" name="fieldOf" value="창호,샷시"><br/>
   창호,샷시:<br/>
   발코니 확장:<input type="checkbox" name="fieldOf" value="발코니 확장"><br/>
   도배:<input type="checkbox" name="fieldOf" value="도배"><br/>
   바닥재:<input type="checkbox" name=" fieldOf" value="바닥재"><br/>
   주방:<input type="checkbox" name="fieldOf" value="주방"><br/>
   욕실:<input type="checkbox" name="fieldOf" value="욕실"><br/>
   도어,문틀:<input type="checkbox" name="fieldOf" value="도어,문틀"><br/>
</p>


<p>
	시공 주소:<br/>
	<textarea name="address" rows="5" cols="30">${param.address}</textarea>
</p>

<p>

시공 희망 기간:<br/>
<label for="dateStart">시작일</label>
          <input type="text" name="dateStart" id="dateStart">
          ~
          <label for="dateDone">완료일</label>
          <input type="text" name="dateDone" id="dateDone">
</p>

<p>
	희망 예산:<br/>
<%-- 	<input type="text" name="budget" value="${param.budget}"> --%>
	<textarea name="budget" rows="5" cols="30">${param.budget}</textarea>
</p>
<p>
	전달사항:<br/>
	<textarea name="message" rows="5" cols="30">${param.message}</textarea>
</p>

<p>
	연락처(전화번호):<br/>
	<input type="tel" name="tel" id="tel">
</p>

<input type="submit" value="상담 신청">
</form>
</div>

<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	 crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="${pageContext.request.contextPath}/resources/js/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/hoverIntent.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/superfish.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.lightbox.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/mail-script.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	
<!-- 터치슬라이드 -->
<script src='${pageContext.request.contextPath}/resources/js/swipe.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js'></script>
	<script src="${pageContext.request.contextPath}/resources/js/interiorAsk.js"></script>
</body>


</html>
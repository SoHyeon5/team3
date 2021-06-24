<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo4.png">
	<!-- Author Meta -->
	<meta name="author" content="colorlib">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>Being</title>

	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
	<!--
			CSS
			============================================= -->

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/linearicons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/1.6.11/css/lightgallery.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
</head>
<body>
<%@ include file="../include/header.jspf" %>

<table border="1">
	<tr>
		<td colspan="4"><a href="write.do">[업체등록]</a></td>
	</tr>
	<tr>
		<td>신청 제목</td>
		<td>업체명</td>
		<td>예산</td>
		<td>공급 면적</td>
		<td>시공 분야</td>
		<td>시공 희망일</td>
		<td>완료 희망일</td>
		<td>전달 사항</td>
		<td>전화번호</td>
		<td>업체 답변</td>
		<td>별점</td>
		<td>총평</td>
	</tr>
<c:if test="${interiorAskPage.hasNoInteriorAsk()}">
	<tr>
		<td colspan="4">업체가 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="interiorAsk" items="${interiorAskPage.content}">
	<tr>
		<td>
<!-- 		신청 제목 -->
		<a href="read.do?no=${interiorAsk.num}&pageNo=${interiorAskPage.currentPage}">
		<c:out value="${interiorAsk.title}"/>
		</a>
		<td>${interiorAsk.name}</td>
		<td>${interiorAsk.budget}</td>
		<td>${interiorAsk.area}</td>
		<td>${interiorAsk.fieldOf}</td>
		<td>${interiorAsk.dateStart}</td>
		<td>${interiorAsk.dateDone}</td>
		<td>${interiorAsk.message}</td>
		<td>${interiorAsk.tel}</td>
		<td>${interiorAsk.answer}</td>
		<td>${interiorAsk.grade}</td>
		<td>${interiorAsk.contentOf}</td>

	</tr>
</c:forEach>
<c:if test="${interiorAskPage.hasInteriorAsk()}">
	<tr>
		<td colspan="4">
			<c:if test="${interiorAskPage.startPage > 5}">
			<a href="list.do?pageNo=${interiorAskPage.startPage - 5}">[이전]</a>
			</c:if>
			<c:forEach var="pNo" 
					   begin="${interiorAskPage.startPage}" 
					   end="${interiorAskPage.endPage}">
			<a href="list.do?pageNo=${pNo}">[${pNo}]</a>
			</c:forEach>
			<c:if test="${interiorAskPage.endPage < interiorAskPage.totalPages}">
			<a href="list.do?pageNo=${interiorAskPage.startPage + 5}">[다음]</a>
			</c:if>
		</td>
	</tr>
</c:if>
</table>

 <%@ include file="../include/footer.jspf" %>

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
</body>
</html>
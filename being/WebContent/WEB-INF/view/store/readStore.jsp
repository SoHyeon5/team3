<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
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
	<title>상품</title>

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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/read.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store.css">
</head>

<body>
	<%@ include file="../include/header.jspf" %>


	<div class="store">
	<div class="category2">
   카테고리>
   <u:pre value='${storeData.store.category}'/>
   </div>
   
   
	<div class="flex-store">
	<div class="thumnail">
 
   <a href="#"><img src="${pageContext.request.contextPath}/resources/img/imga.png" width="400px" height="400px" style="border-radius: 7px;"></a>
	
  <%--   상품사진<u:pre value='${storeData.store.thumbnail}'/> --%>
   </div>
   
   <div class="right-store">
   <div class="brand">
   <!-- 브랜드 -->
   <u:pre value='${storeData.store.brand}'/>
	</div>
	
	<div class="name">
	<!-- 상품이름 -->
	<u:pre value='${storeData.store.name}'/>
	</div>
	
	<div class="price">
   <!-- 상품가격 -->
   <u:pre value='${storeData.store.price}'/>
	</div>
	
	<div class="dcprice">
   <!-- 할인가격 -->
   <u:pre value='${storeData.store.dcprice}'/>
   </div>
	
	<div class="freeyn">
	무료배송여부: 
   <u:pre value='${storeData.store.freeyn}'/>
   </div>
  
	
	<div class="avggrade">
   평균평점:
   <u:pre value='${storeData.store.avggrade}'/>
	</div>
	</div>
	</div>
	
	<div class="board-store">
	</div>
	
	
	<div class="down-store">
	<div class="introduce">
  <!--  상품소개 -->
   <u:pre value='${storeData.store.introduce}'/>
   </div>
   
   <div class="infoimage">
   <!-- 소개사진 -->
   <img src="${pageContext.request.contextPath}/resources/img/imga.png" width="320px" height="320px" alt="" />
   <u:pre value='${storeData.store.infoimage}'/>
   </div>
	
	<div class="link">
   판매사이트링크
   <u:pre value='${storeData.store.link}'/>
   </div>
   </div>
	
	
<div class="list">
	 <td colspan="2">
		<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo}" />
		<a href="list.do?pageNo=${pageNo}">목록</a>
		<a href="${pageContext.request.contextPath}/storeReview/write.do?no=${storeData.store.num}">상품평 등록</a>
		<%-- <c:if test="${authUser.id == storeData.article.writer.id}"> --%>
		<u:isAdmin>
		<a href="modify.do?no=${storeData.store.num}">게시글수정</a>
		<a href="delete.do?no=${storeData.store.num}">게시글삭제</a>
		</u:isAdmin>
		<%-- </c:if> --%>
	</td>
	</div>
</div>

<div class="store-review-border">
</div>

<div class="store-review-title">
<h2>리뷰</h2>
	<div class="avggrade">
   평균평점:
   ${storeData.store.avggrade}
   </div>
</div>

<div class="store-review">
<%-- <tr>
		<td>내용</td>
		<td>평점</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>수정</td>
		<u:isAdmin>
		<td>삭제</td>
		</u:isAdmin>
	</tr> --%>
	


<c:forEach var="storeData" items="${storeData.storeReview}">
<div class="store-review-area">
	
	

	
	<div class="name-content">
		<div class="name">		
<!-- 	작성자 -->
		<strong>${storeData.writer.name}</strong>
		</div>
		
		<div class="content">	
<!-- 		내용 -->
		${storeData.content}
		</div>
	</div>	
	
	<div class="grade">	
<!-- 		평점 -->
		<strong>평점</strong><span class="stars">${storeData.grade}</span>
	</div>	
	
	<div class="regDate">
<!-- 		작성일 -->
		${storeData.regDate}
	</div>
	
	<div class="delete">
<!-- 		상품평 수정 -->
		<td><a href="${pageContext.request.contextPath}/storeReview/modify.do?no=${storeData.num}">수정</a></td>
<!-- 		삭제 -->
		<div class="delete1">
		<u:isAdmin>
		<td>삭제</td>
		</u:isAdmin>
		</div>
	</div>
	
</div>
</c:forEach>
</div>









<!--######## start footer Area ########-->

	<footer class="footer-area">
	
			<div class="row">
				<div class="footer-test">
					<div class="single-footer-widget mail-chimp">
						<img src="${pageContext.request.contextPath}/resources/img/logo3.jpg" width="50px" height="50px" alt="" />
					</div>
				</div>
					<div class="single-footer-widget">
						<h6>공지사항 > 1boon이 콘텐츠뷰로 새롭게 개편합니다!</h6>
						<ul class="footer-nav">
							<li><a href="#">회사소개</a> · <a href="#">비즈니스</a> · <a href="#">검색등록</a> · <a href="#">제휴문의</a> · <a href="#">인재채용</a></li>
							<li><a href="#">이용약관</a> · <a href="#">운영정책</a> · <a href="#">청소년보호정책</a> · <a href="#">위치기반서비스이용약관</a> · <a href="#">개인정보처리방침</a> · <a href="#">웹접근성안내</a> · <a href="#">고객센터</a></li>
						</ul>
					</div>
				</div>
				
	


			<div class="footer-bottom d-flex justify-content-between align-items-center flex-wrap">
				<p class="col-lg-8 col-sm-12 footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>, distributed by <a href="https://bootthemes.com/" target="_blank">BootThemes</a>
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
			
	
	</footer>
	<!--######## End footer Area ########-->
	
	<!--######## End footer Area ########-->

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
	
	<!-- 별점 기능 -->
<script src='${pageContext.request.contextPath}/resources/js/star.js'></script>
	<script>
            $(function(){
                $('.stars').stars();
            });
        </script>

</body>
</html>
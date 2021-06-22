<%@ page contentType="text/html; charset=utf-8"%>
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
</head>

<body>
	<!--################ Start Header Area ########-->
	<header id="header" id="home">
		<div class="header-top">
			<div class="container">
				<div class="row">
					<a>첫 회원가입시 2000원 할인쿠폰 발급!</a>
				</div>
			</div>
		</div>
		<hr>
		<div class="container main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="${pageContext.request.contextPath}/main/index.do"><img src="${pageContext.request.contextPath}/resources/img/logo3.jpg" alt="" title="" width="75px" height="75px"/></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li class="menu-has-children"><a href="">커뮤니티</a>
							<ul>
								<li><a href="blog-home.html">홈</a></li>
								<li><a href="${pageContext.request.contextPath}/board/list.do">스토리</a></li>
								<li><a href="blog-single.html">노하우</a></li>
								<li><a href="blog-single.html">이벤트</a></li>
							</ul>
						</li>
						<li class="menu-has-children"><a href="../store/list.do">스토어</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/store/list.do">스토어홈</a></li>
								<li><a href="blog-single.html">카테고리</a></li>
								<li><a href="blog-single.html">오늘의 딜</a></li>
								<li><a href="blog-single.html">기획전</a></li>
							</ul>
						</li>
						<li class="menu-has-children"><a href="">인테리어시공</a>
							<ul>
								<li><a href="blog-home.html">업체찾기</a></li>
								<li><a href="blog-single.html">간편상담신청</a></li>
							</ul>
						</li>
						<u:isLogin>
						<li class="menu-active"><a>${authUser.name}님 </a></li>
						<li class="menu-active"><a href="${pageContext.request.contextPath}/logout.do" style="padding-left: 225px;">로그아웃</a></li>
						<li class="write"><a href="${pageContext.request.contextPath}/board/write.do">글쓰기</a></li>
						</u:isLogin>
						<u:isAdmin>
						<li class="menu-active"><a>관리자 </a></li>
						</u:isAdmin>
						
						<u:notLogin>
						<li class="menu-active"><a href="${pageContext.request.contextPath}/login.do" style="padding-left: 400px;">로그인</a></li>
						<li class="menu-active"><a href="${pageContext.request.contextPath}/join.do">회원가입</a></li>
						</u:notLogin>
					</ul>
				</nav>
				<!--######## #nav-menu-container -->
			</div>
		</div>
		
	</header>
<body>


	<div class="store">
	<div class="category2">
   카테고리>
   <u:pre value='${storeData.store.category}'/>
   </div>
   
   
	<div class="flex-store">
	<div class="thumnail">
 
   <a href="#"><img src="${pageContext.request.contextPath}/resources/img/ad1.png" width="400px" height="400px" style="border-radius: 7px;"></a>
	
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
	
	
	
	<div class="introduce">
  <!--  상품소개 -->
   <u:pre value='${storeData.store.introduce}'/>
   </div>
   
   <div class="infoimage">
   <!-- 소개사진 -->
   <u:pre value='${storeData.store.infoimage}'/>
   </div>
	
	<div class="link">
   판매사이트링크
   <u:pre value='${storeData.store.link}'/>
   </div>
	
	
<div class="list">
	 <td colspan="2">
		<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo}" />
		<a href="list.do?pageNo=${pageNo}">[목록]</a>
		<a href="${pageContext.request.contextPath}/storeReview/write.do?no=${storeData.store.num}">[상품평 등록]</a>
		<%-- <c:if test="${authUser.id == storeData.article.writer.id}"> --%>
		<u:isAdmin>
		<a href="modify.do?no=${storeData.store.num}">[게시글수정]</a>
		<a href="delete.do?no=${storeData.store.num}">[게시글삭제]</a>
		</u:isAdmin>
		<%-- </c:if> --%>
	</td>
	</div>
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

</body>
</html>
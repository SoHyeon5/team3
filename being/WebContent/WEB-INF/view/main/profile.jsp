<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/logo4.png">
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

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">

</head>

<body>


	<!-- /.col -->
	<div class="col-md-9">
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#activity" data-toggle="tab">Activity</a></li>
				<li><a href="#timeline" data-toggle="tab">Timeline</a></li>
				<li><a href="#settings" data-toggle="tab">설정</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane" id="activity">
					<div class="article">

						<table border="1">

							<tr>
								<!-- 		<td>번호</td> -->
								<td>제목</td>
								<td>작성자</td>
								<td>조회수</td>
							</tr>

							<c:forEach var="profileData" items="${profileData.article}">
								<tr>
									<%-- 		<td>${article.number}</td> --%>
									<td><a href="../board/read.do?no=${profileData.number}">
											<c:out value="${profileData.title}" />
									</a></td>
									<td>${profileData.writer.name}</td>
									<td>${profileData.readCount}</td>
								</tr>
							</c:forEach>

						</table>

					</div>

					<div class="storeReview">

						<table border="1">
							<tr>
								<td>상품명</td>
								<td>내용</td>
								<td>평점</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>수정</td>
							</tr>

							<c:forEach var="profileData" items="${profileData.storeReview}">
								<tr>
									<!-- 		상품명 -->
									<td>${profileData.prodName}</td>
									<!-- 		내용 -->
									<td>${profileData.content}</td>
									<!-- 		평점 -->
									<td>${profileData.grade}</td>
									<!-- 	작성자 -->
									<td>${profileData.writer.name}</td>
									<!-- 		작성일 -->
									<td>${profileData.regDate}</td>
									<!-- 		상품평 수정 -->
									<td><a
										href="${pageContext.request.contextPath}/storeReview/modify.do?no=${storeData.num}">[수정]</a></td>

								</tr>
							</c:forEach>
						</table>

					</div>

				</div>
				<!-- /.tab-pane -->
				<div class="tab-pane" id="timeline"></div>
				<!-- /.tab-pane -->

				<div class="active tab-pane" id="settings">
					<form class="form-horizontal" action="profile.do" method="post">
						<div class="form-group">
							<label for="inputName" class="col-sm-2 control-label">이름</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="name"
									value="${authUser.name}">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">이메일</label>

							<div class="col-sm-10">
								<input type="email" class="form-control" name="email"
									value="${authUser.id}">
							</div>
						</div>
						<div class="form-group">
							<label for="inputName" class="col-sm-2 control-label">현재
								암호</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="curPwd"
									placeholder="현재 암호">
								<c:if test="${errors.curPwd}">현재 암호를 입력하세요.</c:if>
								<c:if test="${errors.badCurPwd}">현재 암호가 일치하지 않습니다.</c:if>
							</div>
						</div>
						<div class="form-group">
							<label for="inputName" class="col-sm-2 control-label">새
								암호</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="newPwd"
									placeholder="새 암호">
								<c:if test="${errors.newPwd}">새 암호를 입력하세요.</c:if>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label> <input type="checkbox"> I agree to the
										<a href="#">terms and conditions</a>
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-danger">비밀번호 변경</button>
							</div>
							<div class="col-sm-offset-2 col-sm-10">
								<a href="../deleteMember.do">[회원탈퇴]</a>
							</div>
						</div>
					</form>
				</div>



				<!-- /.tab-pane -->
			</div>
			<!-- /.tab-content -->
		</div>
		<!-- /.nav-tabs-custom -->
	</div>
	<!-- /.col -->

	<!--######## End footer Area ########-->

	<script
		src="${pageContext.request.contextPath}/resources/js/vendor/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/hoverIntent.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/superfish.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.ajaxchimp.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.lightbox.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/mail-script.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	<!-- 터치슬라이드 -->
	<script src='${pageContext.request.contextPath}/resources/js/swipe.js'></script>
	<script
		src='${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js'></script>

</body>

</html>
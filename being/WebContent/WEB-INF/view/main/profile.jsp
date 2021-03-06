<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="zxx" class="no-js">

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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profile.css">
	
		<style>
	.star-rating { width:100px; }
	.star-rating,.star-rating span {
		display:inline-block; 
		height:18px; 
		overflow:hidden; 
		background:url(${pageContext.request.contextPath}/resources/img/star2.png)no-repeat; }
	.star-rating span{ 
		background-position:left bottom; 
		line-height:0; 
		vertical-align:top;}
	
	</style>
</head>

<body>
<%@ include file="../include/header.jspf"%>
	<!-- /.col -->
	<div class="col-md-9">
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#article" data-toggle="tab">?????????</a></li>
				<li><a href="#review" data-toggle="tab">????????????</a></li>
				<li><a href="#interior" data-toggle="tab">????????????</a></li>
				<li><a href="#settings" data-toggle="tab">??????</a></li>
			</ul>
			<div class="tab-content">
				<div class="active tab-pane" id="article">
					<div class="article">

						<div class="table-start">
						<table class="table">

							<tr>
								<!-- 		<td>??????</td> -->
								<td>??????</td>
								<td>?????????</td>
								<td>?????????</td>
							</tr>
							
							<c:if test="${empty profileData.article}">
							<tr>
								<td colspan="3">????????? ???????????? ????????????.</td>
							</tr>
						</c:if>

							<c:forEach var="profileData" items="${profileData.article}">
								<tr>
									<%-- 		<td>${article.number}</td> --%>
									<td><a href="../board/read.do?no=${profileData.number}">
											<c:out value="${profileData.title}" />
									</a></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${profileData.regDate}" /></td>
									<td>${profileData.readCount}</td>
								</tr>
							</c:forEach>

						</table>
						</div>

					</div>


				</div>
				
				<div class="tab-pane" id="review">
				<div class="storeReview">
				<div class="table-start">

						<table class="table">
							<tr>
								<td>?????????</td>
								<td>??????</td>
								<td>??????</td>
								<td>?????????</td>
								<td>?????????</td>
								<td>??????</td>
							</tr>
							
							<c:if test="${empty profileData.storeReview}">
							<tr>
								<td colspan="6">????????? ????????? ????????????.</td>
							</tr>
						</c:if>

							<c:forEach var="profileData" items="${profileData.storeReview}">
								<tr>
									<!-- 		????????? -->
									<td>
									<a href="${pageContext.request.contextPath}/store/read.do?no=${profileData.prodNum}">${profileData.prodName}</a>
									</td>
									<!-- 		?????? -->
									<td>${profileData.content}</td>
									<!-- 		?????? -->
									<td>${profileData.grade}
									
										<span class='star-rating'>
											<span style ="width:${profileData.grade * 20}%"></span>
										</span>
									</td>
									<!-- 	????????? -->
									<td>${profileData.writer.name}</td>
									<!-- 		????????? -->
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${profileData.regDate}" /></td>
									<!-- 		????????? ?????? -->
									<td><a
										href="${pageContext.request.contextPath}/storeReview/modify.do?no=${profileData.num}">[??????]</a></td>

								</tr>
							</c:forEach>
						</table>
				</div>

					</div>
				
				</div>
				
				
				<!-- /.tab-pane -->
				<div class="tab-pane" id="interior">

					<div class="table-start">
					<table class="table">
						<tr>
							<td colspan="4">???????????? ?????? ??????</td>
						</tr>
						<tr>
							<td>?????? ??????</td>
							<td>?????????</td>
							<td>?????? ??????</td>
							<td>????????????</td>

						</tr>
						<c:if test="${empty profileData.interiorAsk}">
							<tr>
								<td colspan="4">??????????????? ????????????.</td>
							</tr>
						</c:if>
						
						<c:forEach var="profileData" items="${profileData.interiorAsk}">
							<tr>
								<td>
									<!-- 		?????? ?????? --> <a href="../interiorAsk/read.do?no=${profileData.num}"> <c:out
											value="${profileData.title}" />
								</a>
								<td>${profileData.name}</td>
								<td>${profileData.message}</td>
								<td>${profileData.tel}</td>

							</tr>
						</c:forEach>
					</table>
				</div>
				</div>
				<!-- /.tab-pane -->

				<div class="tab-pane" id="settings">
					<form class="form-horizontal" action="profile.do" method="post">
						<div class="form-group">
							<label for="inputName" class="col-sm-2 control-label">??????</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="name"
									value="${authUser.name}">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">?????????</label>

							<div class="col-sm-10">
								<input type="email" class="form-control" name="email"
									value="${authUser.id}" disabled> //????????? ?????? ?????????????????? ????????????.
							</div>
						</div>
						<div class="form-group">
							<label for="inputName" class="col-sm-2 control-label">??????
								??????</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="curPwd"
									placeholder="?????? ??????">
								<c:if test="${errors.curPwd}">?????? ????????? ???????????????.</c:if>
								<c:if test="${errors.badCurPwd}">?????? ????????? ???????????? ????????????.</c:if>
							</div>
						</div>
						<div class="form-group">
							<label for="inputName" class="col-sm-2 control-label">???
								??????</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="newPwd"
									placeholder="??? ??????">
								<c:if test="${errors.newPwd}">??? ????????? ???????????????.</c:if>
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
								<button type="submit" class="btn btn-danger">???????????? ??????</button>
							</div>
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" class="btn btn-danger delete-member" onclick="location.href='../deleteMember.do' ">????????????</button>
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

	<!-- ?????????????????? -->
	<script src='${pageContext.request.contextPath}/resources/js/swipe.js'></script>
	<script
		src='${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js'></script>
	
	<script type="text/javascript">

	$(document).ready(function(){
		
		$('ul.nav-tabs li').click(function(){
			var tab_id = $(this).attr('data-toggle');

			$('ul.nav-tabs li').removeClass('active');
			$('.tab-pane').removeClass('active');

			$(this).addClass('active');
			$("#"+tab_id).addClass('active');
		})

	})
	
</script>

</body>
<%@ include file="../include/footer.jspf"%>
</html>
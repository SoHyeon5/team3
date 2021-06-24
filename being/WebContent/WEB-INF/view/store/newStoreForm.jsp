<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 등록</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/linearicons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/1.6.11/css/lightgallery.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Squada+One&display=swap" rel="stylesheet">



</head>
<body>

   <%@ include file="../include/header.jspf" %>

<p class="box-title">상품 등록하기</p>

<div class="box">
<form action="write.do" method="post">
<!-- <div class="register-box"> -->
<!-- 		<div class="login-logo"> -->
<%--          <a href="${pageContext.request.contextPath}/main/index.do"> --%>
<%--             <img src="${pageContext.request.contextPath}/resources/img/logo4.png" alt="" title="" width="75px" height="75px"/> --%>
<!--          Being House -->
<!--          </a> -->
         
        
<!-- </div> -->
<div class="regist-box">

<div id="story-form-select">               
     <div id="story-category">
          <ul class="story-category">
          <li>카테고리</li>
        	  <li class="category-ct">
       		   	<select id="category" name="category">
       		   	<option value="">-카테고리-</option>
                         <option value="책장">책장</option>
                         <option value="의자">의자</option>
                         <option value="소파">소파</option>
                         <option value="거울">거울</option>
                         <option value="식탁">식탁</option>
                         <option value="수납용품">수납용품</option>
                         <option value="기타">기타</option>
					
				</select>
         	 </li>
          		<li>배송비</li>
               <li class="freeyn-ct">
                   <select name = "freeyn">
                        <option value="Y">무료배송</option>
                        <option value="N">유료배송</option>
                        
                    </select>
                </li>
                
                
                
          </ul>
	</div> 
</div>
</div>

<div class="all-content">
<div class="title">
<p>
상품 이름
	<input type="text" name="name" placeholder="제목">
	<c:if test="${errors.title}"></c:if>
</p>
</div>
<div class="content">
<p>
상세 내용
	<input type="text" name="introduce" placeholder="내용을 입력하세요">
</p>
</div> 
<div class="price">
<p>
가격
	<input type="text" name="price" placeholder="가격">
</p>
</div>
<div class="dcprice">
<p>
할인 가격
	<input type="text" name="dcprice" placeholder="할인 가격">
</p>
</div>
<div class="brand">
<p>
브랜드
	<input type="text" name="brand" placeholder="브랜드">
</p>
</div>

<div class="keywd">
<p>
키워드
	<input type="text" name="keywd" placeholder="키워드">
</p>
</div>

<div class="thumbnail">
<p>
썸네일
	<input type="text" name="thumbnail" placeholder="썸네일">
</p>
</div>

<div class="infoimage">
<p>
소개 이미지
	<input type="text" name="infoimage" placeholder="소개 이미지">
</p>
</div>
<div class="link">
<p>
상품 링크
	<input type="text" name="link" placeholder="상품 링크">
</p>
</div>
</div>
<div>	
	 <button type="submit" class="btn" id="btn">새 글 등록</button> 
</div>
</form>
</div>
</body>
</html>
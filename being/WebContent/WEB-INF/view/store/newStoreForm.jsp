<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Squada+One&display=swap" rel="stylesheet">



</head>
<body>
<form action="write.do" method="post">
<div class="register-box">
		<div class="login-logo">
         <a href="${pageContext.request.contextPath}/main/index.do">
            <img src="${pageContext.request.contextPath}/resources/img/logo4.png" alt="" title="" width="75px" height="75px"/>
         Being House
         </a>
         
         <button type="submit" class="btn" id="btn">새 글 등록</button>
      </div>
<div class="regist-box">

<div id="story-form-select">               
     <div id="story-category">
          <ul class="story-category">
          
        	  <li class="category=ct">
       		   	<select id="category" name="CATEGORY">
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
          
               <li class="freeyn-ct">
                   <select name = "FREEYN">
                        <option value="Y">무료배송</option>
                        <option value="N">유료배송</option>
                        
                    </select>
                </li>
                
                
                
          </ul>
	</div>  
</div>
</div>
</div>

<div class="all-content">
<div class="title">
<p>
	<input type="text" name="name" value="${param.NAME}"placeholder="제목">
	<c:if test="${errors.title}"></c:if>
</p>
</div>
<div class="content">
<p>
	<textarea name="introduce" rows="5" cols="30" ${param.INTRODUCE} placeholder="내용을 입력하세요"></textarea>
</p>
</div> 
<div class="price">
<p>
	<textarea name="price" rows="5" cols="30" ${param.PRICE} placeholder="가격"></textarea>
</p>
</div>
<div class="dcprice">
<p>
	<textarea name="dcprice" rows="5" cols="30" ${param.DCPRICE} placeholder="할인가격"></textarea>
</p>
</div>
<div class="brand">
<p>
	<textarea name="brand" rows="5" cols="30" ${param.BRAND} placeholder="브랜드"></textarea>
</p>
</div>

<div class="keywd">
<p>
	<textarea name="keywd" rows="5" cols="30" ${param.KEYWD} placeholder="키워드"></textarea>
</p>
</div>

<div class="thumbnail">
<p>
	<textarea name="thumbnail" rows="5" cols="30" ${param.THUMNAIL} placeholder="썸네일"></textarea>
</p>
</div>

<div class="infoimage">
<p>
	<textarea name="infoimage" rows="5" cols="30" ${param.INFOIMAGE} placeholder="소개이미지"></textarea>
</p>
</div>
<div class="link">
<p>
	<textarea name="link" rows="5" cols="30" ${param.LINK} placeholder="링크"></textarea>
</p>
</div>
</div>
</form>
</body>
</html>
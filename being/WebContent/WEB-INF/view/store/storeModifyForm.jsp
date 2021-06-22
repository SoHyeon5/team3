<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 수정</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Squada+One&display=swap" rel="stylesheet">

</head>
<body>
<form action="modify.do" method="post">
<input type="hidden" name="no" value="${modReq.num}">

<div class="register-box">
		<div class="login-logo">
         <a href="${pageContext.request.contextPath}/main/index.do">
            <img src="${pageContext.request.contextPath}/resources/img/logo4.png" alt="" title="" width="75px" height="75px"/>
         Being House
         </a>
         
         <button type="submit" class="btn" id="btn"> 상품 수정 </button>
      </div>
<div class="regist-box">

<div id="story-form-select">               
     <div id="story-category">
          <ul class="story-category">
          
        	  <li class="category=ct">
       		   	<select id="category" name="CATEGORY">
       		   	<option value="${modReq.category}">${modReq.category}</option>
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
                   <option value="${modReq.freeyn}">${modReq.freeyn}</option>
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
	<input type="text" name="name" value="${modReq.name}"placeholder="제목">
	<c:if test="${errors.title}"></c:if>
</p>
</div>
<div class="introduce">
<p>
	<input type="text" name="introduce" value="${modReq.introduce}">
</p>
</div>
<div class="price">
<p>
	<input type="text" name="price" value="${modReq.price}">
</p>
</div> 
<div class="dcprice">
<p>
	<input type="text" name="dcprice" value="${modReq.dcprice}">
</p>
</div>
<div class="brand">
<p>
	<input type="text" name="brand" value="${modReq.brand}">
</p>
</div>

<div class="keywd">
<p>
	<input type="text" name="keywd" value="${modReq.keywd}">
</p>
</div>
<div class="thumbnail">
<p>
	<input type="text" name="thumbnail" value="${modReq.thumbnail}">
</p>
</div>

<div class="infoimage">
<p>
	<input type="text" name="infoimage" value="${modReq.infoimage}">
</p>
</div>
<div class="link">
<p>
	<input type="text" name="link" value="${modReq.link}">
</p>
</div>
</div>

</form>
</body>



</html>
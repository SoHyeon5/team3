<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시글 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Squada+One&display=swap" rel="stylesheet">

</head>
<body>
<form action="modify.do" method="post">
<input type="hidden" name="no" value="${modReq.articleNumber}">

<div class="register-box">
		<div class="login-logo">
         <a href="${pageContext.request.contextPath}/main/index.do">
            <img src="${pageContext.request.contextPath}/resources/img/logo4.png" alt="" title="" width="75px" height="75px"/>
         Being House
         </a>
         
         <button type="submit" class="btn" id="btn">글 수정 </button>
      </div>
      
<input type="hidden" name="no" value="${modReq.articleNumber}">
<%-- <p>
	번호:<br/>${modReq.articleNumber}
</p> --%>

<div class="regist-box">
<div id="story-form-select">               
     <div id="story-category">
          <ul class="story-category">
          
        	  <li class="type=ct">
       		   	<select id="type" name="TYPE" size="1">
       		   	<option value="${modReq.type}">${modReq.type}</option>
                         <option value="원룸&오피스텔">원룸,오피스텔</option>
                         <option value="아파트">아파트</option>
                         <option value="빌라&연합">빌라,연합</option>
                         <option value="단독주택">단독주택</option>
                         <option value="사무공간">사무공간</option>
                         <option value="상업공간">상업공간</option>
                         <option value="기타">기타</option>
					
				</select>
         	 </li>
          
               <li class="acreage-ct">
                   <select name = "ACREAGE">
                        <option value="${modReq.acreage}">${modReq.acreage}</option>
                        <option value="10평 미만">10평 미만</option>
                        <option value="10평대">10평대</option>
                        <option value="20평대">20평대</option>
                        <option value="30평대">30평대</option>
                        <option value="40평대">40평대</option>
                        <option value="50평대 이상">50평대 이상</option>
                    </select>
                </li>
                
                 <li class="budget-ct">
                   <select name = "BUDGET">
                        <option value="${modReq.budget}">${modReq.budget}</option>
                        <option value="1백만원 미만">1백만원 미만</option>
                        <option value="1백만원대">1백만원대</option>
                        <option value="2백만원대">2백만원대</option>
                        <option value="3백만원대">3백만원대</option>
                        <option value="4백만원대">4백만원대</option>
                        <option value="5백만원 이상">5백만원 이상</option>
                    </select>
                </li>
                
                
                <li class="field-ct">
                    <select name="FIELD">
                        <option value="${modReq.field}">${modReq.field}</option>
						<option value="리모델링">리모델링</option>
						<option value="홈스타일링">홈스타일링</option>
						<option value="부분 공사">부분 공사</option>
                     </select>
                </li>
                
                
                <li class="space-ct">
                   <select name = "SPACE">
                        <option value="${modReq.space}">${modReq.space}</option>
                        <option value="화장실">화장실</option>
                        <option value="거실">거실</option>
                        <option value="방">방</option>
                        <option value="베란다">베란다</option>
                    </select>
                </li>
                
                
          </ul>
	</div>  
</div> 





<div class="title">
<p>
	<input type="text" name="title" value="${modReq.title}">
	<c:if test="${errors.title}"></c:if>
</p>
</div>
<div class="content">
<p>
<input type="text" name="content-box" value="${modReq.content}">
</p>
</div>
</div>

</form>
</body>


</html>
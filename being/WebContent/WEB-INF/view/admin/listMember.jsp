<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시글 목록</title>
</head>
<body>

<table border="1" width="100%">
	<tr>
		<td>회원 별명</td>
		<td>회원 아이디</td>
		<td>가입일</td>
		<td>회원 레벨</td>
		<td>회원 레벨 수정</td>
	</tr>
<c:if test="${memberPage.hasNoMember()}">
	<tr>
		<td colspan="4">업체가 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="member" items="${memberPage.content}">
	<tr>
<!-- 		회원 별명 -->
		<td>${member.name}</td>
<!-- 		회원 아이디 -->
		<td>${member.id}</td>
<!-- 	작성일 -->
		<td>${member.regDate}</td>
<!-- 		회원 레벨 -->
		<td>${member.level}</td>
<!-- 		상품평 수정 -->
		<td><a href="${pageContext.request.contextPath}/admin/modify.do?id=${member.id}">[회원 레벨 수정]</a></td>
<!-- 		삭제 -->
<%-- 		<u:isAdmin> --%>
<!-- 		<td>[삭제]</td> -->
<%-- 		</u:isAdmin> --%>

	</tr>
</c:forEach>

<c:if test="${memberPage.hasMember()}">
	<tr>
		<td colspan="4">
			<c:if test="${memberPage.startPage > 5}">
			<a href="list.do?pageNo=${memberPage.startPage - 5}">[이전]</a>
			</c:if>
			<c:forEach var="pNo" 
					   begin="${memberPage.startPage}" 
					   end="${memberPage.endPage}">
			<a href="list.do?pageNo=${pNo}">[${pNo}]</a>
			</c:forEach>
			<c:if test="${memberPage.endPage < memberPage.totalPages}">
			<a href="list.do?pageNo=${memberPage.startPage + 5}">[다음]</a>
			</c:if>
		</td>
	</tr>
</c:if>

</table>
</body>
</html>
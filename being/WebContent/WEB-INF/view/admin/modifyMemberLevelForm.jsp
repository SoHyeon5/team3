<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>업체 수정</title>
</head>
<body>
<form action="modify.do" method="post">
<input type="hidden" name="id" value="${modReq.id}">
<p>
	회원 별명:<br/>${modReq.name}
</p>
<p>
	회원 아이디:<br/>${modReq.id}
</p>
<p>
	가입일:<br/>${modReq.regDate}
</p>
<p>
	회원 레벨:<br/><input type="text" name="level" value="${modReq.level}">
<%-- 	<c:if test="${errors.name}">제목을 입력하세요.</c:if> --%>
</p>


<input type="submit" value="회원 레벨 수정">
</form>
</body>

</html>
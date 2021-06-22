<%@ page contentType="text/html; charset=utf-8"%>
<%-- <%@ page import="util.Cookies"%> --%>
<%
	// 	response.addCookie(Cookies.createCookie("AUTH", "", "/", 0));
session.invalidate();
%>
<html>
<head>
<title>회원탈퇴</title>
</head>
<body>

	<script>
		alert("탈퇴되었습니다.");
	location.href="login.do";
		
	</script>
</body>
</html>

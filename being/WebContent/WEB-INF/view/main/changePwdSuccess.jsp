<%@ page contentType = "text/html; charset=utf-8" %>
<%
// 	response.addCookie(Cookies.createCookie("AUTH", "", "/", 0));
	session.invalidate();
%>

<%
	request.setCharacterEncoding("utf-8");
%>

<script>
	alert("비밀번호가 변경되었습니다. 변경된 비밀번호로 다시 로그인하시기 바랍니다.");
	location.href="profile.do";
</script>

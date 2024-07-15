<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="세션을 삭제하고 jstl_if.jsp로 이동"%>
<%
	session.removeAttribute("id");
	response.sendRedirect("http://localhost/jsp_prj/day0429/jstl_if.jsp");
%>
<script type="text/javascript">
alert("로그아웃 하셨습니다.");
location.href="http://localhost/jsp_prj/day0429/jstl_if.jsp";

</script>
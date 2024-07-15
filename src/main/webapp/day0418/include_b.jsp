<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="인크루드"%>

<div>
	<% 
	//여러 JSP에서 사용하게 될 공통코드를 정의 : 로그인 후 session정보를 체크하는 코드
	String msg="오늘은 미세먼지 가득한 목요일";
	%>
	안쪽JSP : <%= msg %>
	<!-- 공통코드를 가지는 JSP에서는 어떤 JSP에 include 되어서 사용될지 알 수 없기 때문에
	외부 JSP의 변수를 사용하지 않는다. -->
	<%-- 오늘은 <%= day %>일 --%>
</div>
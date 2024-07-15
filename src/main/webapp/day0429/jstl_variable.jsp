<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSTL 변수, 출력 사용"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.230/jsp_prj/common/favicon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<!--sist스타일시트 시작--> 
<link rel="stylesheet" href="http://192.168.10.230/jsp_prj/common/css/main.css" type="text/css" media="all" /> 
<link rel="stylesheet" href="http://192.168.10.230/jsp_prj/common/css/board.css" type="text/css" media="all" /> 
<!--sist스타일시트 끝-->

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">


</style>
<script type="text/javascript">
	$(function() {
		
	});//ready
</script>
</head>
<body>
<div>
	<!--  변수선언 -->
	<c:set var="day" value="29"/>
	<c:set var="name" value="진수현"/>
	
	<!--  출력 -->
	${ name }, ${ day }<br/>
	<!-- 입력된 값을 그대로 출력 => EL사용 -->
	<c:out value="name"/><br/>
	<c:out value="${ name }"/>, <c:out value="${ day }"/>일<br/>

	<!--  속성에 값으로 넣을때에는 c:out을 사용하지 않는다. -->
	<input type="text" value="${ name }"/>
	<!--  웹브라우저로 출력할 때에만 사용 c:out을 사용 -->
	오늘은 <c:out value="${ day }"/>일 입니다.<br/>
	
	<!-- 변수의 삭제 -->
	<c:remove var="name"/>
	삭제 후
	<c:out value="${ name }"/>, <c:out value="${ day }"/>일<br/>
	<%
	String name="<strong>김동섭</strong>";
	pageContext.setAttribute("name", name);
	%>
	<c:set var="name" value="${ name }"/><br/>
	<c:out value="<%= name %>"/><br/>
	<c:out value="${ name }"/><br/>
	<!--  HTML Tag를 해석하여 보여주고 싶다면 -->
	<c:out value="${ name }" escapeXml="false"/><br/>
</div>
</body>
</html>
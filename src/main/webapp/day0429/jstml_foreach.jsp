<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--<link rel="icon" href="http://192.168.10.210/jsp_prj/common/favicon.ico"/>-->
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<link rel="stylesheet" href="http://192.168.10.213/jsp_prj/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://192.168.10.213/jsp_prj/common/css/board.css" type="text/css" media="all" />
<!--jquery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jquery CDN 끝-->

<style type="text/css">
	
	
</style>
<script type="text/javascript">
	$(function(){
	
	});//ready
</script>
</head>
<body>
<div>
	<c:forEach var="i" begin="1" end="10" step="3">
	<c:out value="${ i }"/>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="6" step="1">
	<h${ i }> 안녕하세요? </h${i }>
	</c:forEach>
	
	<hr>
	<%
	Calendar cal=Calendar.getInstance();
	int nowYear=cal.get(Calendar.YEAR );
	int nowMonth=cal.get(Calendar.MONTH )+1;
	int nowDay=cal.get(Calendar.DAY_OF_MONTH );
	int lastDay=cal.getActualMaximum(Calendar.DATE );
	
	
	pageContext.setAttribute("nowYear", nowYear);
	pageContext.setAttribute("nowMonth", nowMonth);
	pageContext.setAttribute("nowDay", nowDay);
	pageContext.setAttribute("lastDay", lastDay);
	%>
	// select 출력 2022 2023 2024 2025 2026
	<select>
	<c:forEach var="year" begin="${ nowYear-2 }" end="${ nowYear+2 }" step="1">
	<option value="${ year }"${ year eq nowYear?" selected='selected'":""}><c:out value="${ year }"/></option>
	</c:forEach>
	</select>년
	<select>
	<c:forEach var="month" begin="1" end="12" step="1">
	<option value="${ month }"${ month eq nowMonth ?" selected='selected'":"" }><c:out value="${ month }"/></option>
	</c:forEach>
	</select>월
	<select>
	<c:forEach var="day" begin="1" end="${ lastDay }" step="1">
	<option value="${ day }"${ day eq nowDay ?" selected='selected'":"" }><c:out value="${ day }"/></option>
	</c:forEach>
	</select>일

	
</div>
</body>
</html>
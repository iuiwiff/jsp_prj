<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	<%
		String msg = "오늘은 월요일 입니다.";
	%>
	
	<h2>EL에서는 변수를 직접접근할 수 없다.</h2>
	EL : ${ msg }<br/>
	Expression : <%= msg %><br/>
	
	<%
	//EL에서 변수를 접근하려면 scope객체에 할당되어야 하고, scope객체명으로 접근 가능
	//1. scope객체 할당
	pageContext.setAttribute("m", msg);
	%>
	
	2. scope객체를 사용한 접근 : <strong>${ pageScope.m }</strong>
	<hr>
	<%
		pageContext.setAttribute("pageName", "김동섭");
		request.setAttribute("reqName", "정명호");
		session.setAttribute("sesName", "진수현");
		application.setAttribute("appName", "윤웅찬");
		//---------------------------------------
		pageContext.setAttribute("name", "김동섭");
		request.setAttribute("name", "정명호");
		session.setAttribute("name", "진수현");
		application.setAttribute("name", "윤웅찬");
	%>
	<ul>
	<li>pageScope : ${ pageScope.pageName }( ${pageName} )</li>
	<li>requestScope : ${ requestScope.reqName }( ${reqName} )</li>
	<li>sessionScope : ${ sessionScope.sesName }( ${sesName} )</li>
	<li>applicationScope : ${ applicationScope.appName }( ${appName} )</li>
	</ul>
	<ul>
	<li>pageScope : ${ pageScope.name }</li>
	<li>requestScope : ${ requestScope.name }</li>
	<li>sessionScope : ${ sessionScope.name }</li>
	<li>applicationScope : ${ applicationScope.name }</li>
	</ul>
	${ name }
	
</div>
</body>
</html>
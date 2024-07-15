<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="쿠키 읽기"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 읽기</title>
<link rel="icon" href="http://192.168.10.218/jsp_prj/common/favicon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->

<link rel="stylesheet" href="http://192.168.10.218/jsp_prj/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://192.168.10.218/jsp_prj/common/css/board.css" type="text/css" media="all" />

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">
	
</style>

<script type="text/javascript">
	$(function(){
		
	});//ready
</script>

</head>
<body>
<div>
<%
//쿠키 읽기
Cookie[] cookies = request.getCookies();

boolean flag = false;
String name="";
if(cookies != null){
	%>
	<ul>
	<% 
	for(Cookie tempCookie : cookies){ 
		if( !"JSESSIONID".equals(tempCookie.getName())){
			flag=true;
			if("name".equals(tempCookie.getName())){//쿠키명이 "name"인 경우에만
				name = tempCookie.getValue();//쿠키의 값을 얻어와서 변수에 저장
			}//end if
	%>
			<li>
			<strong>쿠키 명 : </strong><%= tempCookie.getName() %>,
			<strong>쿠키 값 : </strong><%= tempCookie.getValue() %>,
			</li>
	<%	}//end if
	 }//end for %>
	</ul>
	<%
}//end if
%>

<% if( flag ){ %>
	쿠키에서 가져온 <%= name %>님<br/>
	<a href="remove_cookie.jsp">쿠키삭제</a>
<% } else{ %>
	<a href="add_cookie.jsp">쿠키심기</a>
	
<% }//end else %>
</div>
</body>
</html>
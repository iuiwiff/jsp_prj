<%@page import="day0425.TestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="usebean 액션태그의 사용"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<%-- <% --%>
<!-- // // TestVO tvo = new TestVO(10, "개발부","서울"); -->
<!-- // TestVO tvo = new TestVO(); -->
<!-- // //scope객체 값 설정 -->
<!-- // session.setAttribute("data", tvo); -->
<!-- // tvo.setDeptno(20); -->
<!-- // tvo.setDname("SM"); -->
<!-- // tvo.setLoc("서울"); -->
<%-- %> --%>

<!-- 객체생성, 값 할당을 action tag로 수행 -->
<!-- 객체생성 : 기본생성만 사용된다. -->
<jsp:useBean id="tVO" class="day0425.TestVO" scope="page"/>
<!-- setter method 호출 -->
<jsp:setProperty property="deptno" name="tVO" value="20"/>
<jsp:setProperty property="dname" name="tVO" value="QA"/>
<jsp:setProperty property="loc" name="tVO" value="부산"/>

<!-- getter method호출 : 반환값이 웹브라우저로 출력 -->
<jsp:getProperty property="deptno" name="tVO"/>
<jsp:getProperty property="dname" name="tVO"/>
<jsp:getProperty property="loc" name="tVO"/>

<jsp:useBean id="data" class="day0425.TestVO" scope="session"/>
<% //useBean의 id는 객체명이므로 scriptlet, expression에서 id를 사용할 수 있다.
data.setDeptno(10);
data.setDname("개발부");
data.setLoc("서울");

%>


<a href="usebean2.jsp">이동</a>
</div>
</body>
</html>
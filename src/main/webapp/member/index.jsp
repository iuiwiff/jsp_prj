<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="http://192.168.10.230/jsp_prj/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://192.168.10.230/jsp_prj/common/css/board.css" type="text/css" media="all" />

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">
	#wrap{ width: 1462px;height: 749px; margin: 0px auto;
			position: relative; background: #FFFFFF url('http://192.168.10.230/jsp_prj/common/images/bg.png')}
	#memberDiv{ position: absolute; left:1300px;top: 35px }
	.memberLink{ font-weight: bold; color: #333;text-decoration: none}
</style>
<script type="text/javascript">
	$(function(){
		
	});//ready
</script>
</head>
<body>
<c:set var="title" value="로그인"/>
<c:set var="url" value="login_frm.jsp"/>
<c:if test="${ not empty sessionScope.loginData.id }">
<c:set var="title" value="로그아웃"/>
<c:set var="url" value="log_out.jsp"/>
</c:if>
<div id="wrap">
	<div id="memberDiv">
	<a href="http://192.168.10.230/jsp_prj/member/${ url }" class="memberLink"><c:out value="${ sessionScope.loginData.name }${ pageScope.title }"/></a> | 
	<a href="http://192.168.10.230/jsp_prj/member/member_join_frm.jsp" class="memberLink">회원가입</a>
	</div>
</div>
</body>
</html>
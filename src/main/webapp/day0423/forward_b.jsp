<%@page import="day0423.UrlVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="업무처리한 결과를 받아서 디자인을 만들고 응답하는 페이지"%>
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
	멋지고, 이쁜 디자인<br/>
	<%
	//업무처리한 결과를 받아와서
	String name = (String)request.getAttribute("name");
	UrlVO[] urlArr = (UrlVO[])request.getAttribute("urlArr");
	//화면에 적절하게 보여준다.
	%>
	<marquee><%= name %>님 어서오고!</marquee>
	<select name="url">
	<%for (UrlVO uVO : urlArr) { %>
	<option value="<%= uVO.getCode() %>"><%= uVO.getUrl() %></option>
	<%}//end for %>
	</select>
	
	<div>
	
	<ul>
	<%for( UrlVO uVO : urlArr){ %>
	<li><a href="<%= uVO.getUrl() %>" title="<%= uVO.getInfo()%> "><%= uVO.getCode()%>
	</a>
	<%} //end for %>
	</ul>
	
	</div>
</div>
</body>
</html>
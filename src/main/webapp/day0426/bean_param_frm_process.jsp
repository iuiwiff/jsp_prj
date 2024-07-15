<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "jsp:useBean액선으로 web parameter 받기" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "icon" href = "http://192.168.10.232/jsp_prj/common/favicon.ico">
<!--bootstrap ����-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap ��-->
<!--sist css ����-->
<link rel="stylesheet" href="http://192.168.10.231/jsp_prj/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://192.168.10.231/jsp_prj/common/css/board.css" type="text/css" media="all" />
<!--sist css ��-->
<!--jQuery CDN ����-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN ��-->
<style type = "text/css">

</style>
<script type = "text/javascript">
    $(function() {

    }); // ready
</script>
</head>
<body>
<div>
<div>
<%
request.setCharacterEncoding("UTF-8");
%>
<!-- 객체생성 -->
<jsp:useBean id="memberVO" class="day0426.ParamVO" scope="page"/>

<!-- 웹 파마메터 받아서 vo객체에 설정 -->
<jsp:setProperty property="*" name="memberVO" />

<%= memberVO %>
<li>이름 : <jsp:getProperty property="name" name="memberVO"/>(${param.id})</li>
<li>점심식사 : <jsp:getProperty property="lunch" name="memberVO"/>(${param.password})
<li>휴대폰 : <jsp:getProperty property="tel" name="memberVO"/>(${param.tel})
<li>cell : <jsp:getProperty property="cell" name="memberVO"/>(${param.cell})
<li>issms : <jsp:getProperty property="issms" name="memberVO"/>(${param.issms == null? "수신안함":"수신함"}, ${empty param.issms == null? "수신안함":"수신함"})
<li>점심식사 : <jsp:getProperty property="lunch" name="memberVO"/>(${param.lunch}, ${param.lunch})
<br/>
<%
String[] lunch = memberVO.getLunch();
if(lunch == null){
%>
다이어트 중이세요
<% }else{
	int i = 0;
	for(String temp : lunch){
		%><%=temp %>&nbsp;
wj	<% }
}%>
</li>
</div>
</div>
</body>
</html>
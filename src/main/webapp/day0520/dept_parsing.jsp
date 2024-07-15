<%@page import="java.net.URL"%>
<%@page import="java.util.List"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
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
<table class="table">
<tr>
<th style="width: 100px">부서번호</th>
<th style="width: 200px">부서명</th>
<th style="width: 200px">위치</th>
</tr>
<%
//1. 빌더 생성
SAXBuilder builder = new SAXBuilder();
//2. XML문서 객체 얻기
Document doc = builder.build(new URL("http://localhost/jsp_prj/day0520/dept.xml"));
//3. 최상위 부모노드 얻기
Element deptsNode = doc.getRootElement();
//out.println( deptsNode ); //web browser는 HTML태그만 해석한다.
//4. 자식노드들 얻기
List<Element> deptNodes = deptsNode.getChildren("dept");
//out.println(deptNodes.size() + "개");
Element deptnoNode = null;
Element dnameNode = null;
Element locNode = null;
for( Element deptNode : deptNodes ){
//5. 자식노드 얻기
deptnoNode = deptNode.getChild("deptno");
dnameNode = deptNode.getChild("dname");
locNode = deptNode.getChild("loc");
//6. 파싱
%>
<tr>
	<td><%= deptnoNode.getValue() %></td>
	<td><%= dnameNode.getValue() %></td>
	<td><%= locNode.getValue() %></td>
</tr>
<%
}
%>
</table>
</div>
</body>
</html>
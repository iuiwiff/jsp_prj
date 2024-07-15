<%@page import="day0425.TestVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="배열, collection 출력"%>
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
<%
String[] lunch={"오징어볶음", "뼈다귀해장국", "백반", "돈가스", "우동", "제육볶음"};
pageContext.setAttribute("lunch", lunch); //EL에서 사용할 수 있다.
%>
<c:forEach var="lunch" items="${ lunch }" varStatus="i">

	<c:if test="${ i.first }">
		점심메뉴시작<br/>
	</c:if>

	<input type="checkbox" value="${ lunch }" name="lunch"/>
<%-- 	<c:out value="${ i.index }"/> 0번부터 출력--%>
<%--   	<c:out value="${ i.count }"/> 1번부터 출력--%>
<%--	<c:out value="${ i.first } ${ i.last }"/> --%>
	<c:out value="${ lunch }"/>
	
	<c:if test="${ i.last }">
	<br/>
	<c:out value="${ i.count }"/>건의 메뉴가 제안되었습니다.
	</c:if>
</c:forEach>

<%
	List<String> list=new ArrayList<String>();
	list.add("우미연");
	list.add("정명호");
	list.add("박시현");
	list.add("이명화");
	list.add("홍성강");

	pageContext.setAttribute("list", list); //EL에서 사용 가능
%>
<br/>
<c:forEach var="name" items="${ list }" varStatus="i">
<strong><c:out value="${ i.count }"/></strong>
<input type="text" name="name" value="${ name }" style="width:150px"/><br/>
</c:forEach>
<hr/>
<%
List<TestVO> deptList=new ArrayList<TestVO>();
deptList.add(new TestVO(10, "SI개발부", "서울"));
deptList.add(new TestVO(20, "SM", "서울"));
deptList.add(new TestVO(30, "OP", "경주"));
deptList.add(new TestVO(40, "QA", "서울"));
deptList.add(new TestVO(11, "Solution", "나주"));

pageContext.setAttribute("deptList", deptList);

TestVO t = new TestVO(140, "테스트", "서울");
pageContext.setAttribute("t", t);
%>
부서번호 : <c:out value="${ t.deptno }"/>
부서명 : <c:out value="${ t.dname }"/>
부서위치 : <c:out value="${ t.loc }"/>

<hr>
<table class="table">
<thead>
<tr>
	<th style="width: 100px">번호</th>
	<th style="width: 100px">부서번호</th>
	<th style="width: 300px">부서명</th>
	<th style="width: 150px">부서위치</th>
</tr>
</thead>
<tbody>
<c:forEach var="dept" items="${ deptList }" varStatus="i">
<tr>
<td><c:out value="${ i.count }"/></td>
<td><c:out value="${ dept.deptno }"/></td>
<td><c:out value="${ dept.dname }"/></td>
<td><c:out value="${ dept.loc }"/></td>
</tr>
</c:forEach>
</tbody>
</table>

</div>
</body>
</html>
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
		$("#btn").click(function() {
			$.ajax({
				url:"http://localhost/jsp_prj/day0521/msgs.xml",
				type:"GET",
				dataType:"XML",
				error: function( xhr ){
					alert("문제 발생");
					console.log( xhr.status );
				},
				success: function( xmlObj ){
					var output="<ul>";
					//1. 응답되는 XML 문서객체를 jQueryObject에 할당하여 노드를 찾아 반복시키고
					var msgNode = $( xmlObj ).find("msg").each( function(i, msgNode){
					//2. 찾아낸 노드에서 parsing 수행
						output+="<li>" + $(msgNode).text() + "</li>";
					});
					output+="</ul>";
					
					$("#output").html(output);
					
				}//success
			});//ajax
		});//click
		
		$("#btn2").click(function() {
			$.ajax({
				url: "http://localhost/jsp_prj/day0520/create_dept_2.jsp",
				type: "GET",
				dataType: "XML",
				error: function( xhr ){
					alert("문제발생");
					console.log( xhr.status );
				},
				success: function( xmlObj ){
					//alert( xmlObj )
					var output = "<table class='table table-hover'>";
					output += "<thead><tr><th style='width:80px'>번호</th>";
					output += "<th style='width:100px'>부서번호</th>";
					output += "<th style='width:200px'>부서명</th>";
					output += "<th style='width:150px'>위치</th>";
					output += "</tr></thead><tbody>";
					//1. 반복시킬 노드를 찾고 반복시킨다. (find, each)
					var deptno="";
					var dname="";
					var loc="";
					$(xmlObj).find("dept").each( function(i, deptNode){
						
					//2. 노드를 찾고 파싱 (find, text)
					deptno = $(deptNode).find("deptno").text();
					dname = $(deptNode).find("dname").text();
					loc = $(deptNode).find("loc").text();
					
					output += "<tr><td>" + (i+1) + "</td>";
					output += "<td>" + deptno + "</td>";
					output += "<td>" + dname + "</td>";
					output += "<td>" + loc + "</td>";
					output += "</tr>";
					});
					
					output+="</tbody></table>";
					$("#output").html(output);
					
				}//success
			});//ajax
		});//click
		
	});//ready
</script>
</head>
<body>
<div>
	<div>
		<input type="button" value="xml요청" class="btn btn-sm btn-success" id="btn"/>
		<input type="button" value="xml요청2" class="btn btn-sm btn-success" id="btn2"/>
	</div>
	<div id="output"></div>
</div>
</body>
</html>
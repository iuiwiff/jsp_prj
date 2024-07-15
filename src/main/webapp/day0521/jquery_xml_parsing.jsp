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
				url:"http://localhost/jsp_prj/day0520/parsing.xml",
				type:"GET",
				dataType:"XML",
				error: function( xhr ){
					alert("문제 발생");
					console.log( xhr.status );
				},
				success: function( xmlObj ){
					//1. 응답되는 XML 문서객체를 jQueryObject에 할당하여 노드를 찾고
					var msgNode = $( xmlObj ).find("msg");
					//2. 찾아낸 노드에서 parsing 수행
					var data = msgNode.text();
					
					var data2 = $( xmlObj ).find("msg2").text();
					$("#output").html( data + "<br/>" + data2);
				}
			});//ajax
		});//click
	});//ready
</script>
</head>
<body>
<div>
	<div>
		<input type="button" value="xml요청" class="btn btn-sm btn-success" id="btn"/>
	</div>
	<div id="output"></div>
</div>
</body>
</html>
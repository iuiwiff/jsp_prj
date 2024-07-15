<%@page import="java.util.List"%>
<%@page import="org.jdom2.Element"%>
<%@page import="java.net.URL"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jdom2.JDOMException"%>
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
	
</style>
<script type="text/javascript">
	$(function(){
		
	});//ready
	
	function xmlParsing( url ){
		$.ajax({
			url: "https://fs.jtbc.co.kr/RSS/" + url + ".xml",
			type: "GET",
			dataType: "XML",
			error: function( xhr ){
				alert("문제발생");
				console.log( xhr.status + " / " + xhr.statusText);
			},
			success: function( xmlObj ) {
				var pubDate=$( xmlObj ).find("channel").find("pubDate").first().text();
				var output="뉴스 생성일자 : <strong>" + pubDate + "</strong><br/>";
				
				output+="<div>";
				//1. 파싱한 노드에 접근하여 반복
				$( xmlObj ).find("item").each(function(i, itemNode){
				//2. 파싱
				output+="<div>";
				output+="<table class='table'>";
				output+="<tr>";
				output+="<td style='width:80px;font-weight:bold;'>번호</td><td>" + (i+1) + "</td>";
				output+="<td style='width:300px;font-weight:bold;'>제목</td><td>" + 
						"<a href='"+ $( itemNode ).find("link").text()+"' target='blank'>"+
						$( itemNode ).find("title").text()
				 + "</a></td>";
				output+="<td style='width:150px;font-weight:bold;'>기사작성일</td><td>" + 
						$( itemNode ).find("pubDate").text()
				 + "</td>";
					
				output+="</tr>";
				output+="<tr>";
				output+="<td style='width:80px;font-weight:bold;'>내용</td><td colspan='5'>" + 
						$( itemNode ).find("description").text()
				 + "</td>";
					
				output+="</tr>";
				output+="</table>";
				output+="</div>";
				});
				
				$("#output").html(output);
			}//success
		});//ajax
	}//xmlParsing
</script>
</head>
<body>
<div>
<%
String[] title="속보,정치,경제,사회,국제,문화,연예,스포츠,풀영상,뉴스랭킹,뉴스룸,아침&amp;".split(",");
String[] url="newsflash,politics,economy,society,international,culture,entertainment,sports,fullvideo,newsrank,newsroom,newmorning".split(",");

%>	
https://fs.jtbc.co.kr/RSS/
<table>
	<tr>
	<%
	for(int i = 0; i < title.length; i++) {
	%>
	<td><a href="#void" onclick="xmlParsing('<%= url[i]%>')"><%= title[i] %></a></td>
	<%
	} //end for
	%>
	</tr>
</table>
</div>
<div id="output">
	
</div>
</body>
</html>











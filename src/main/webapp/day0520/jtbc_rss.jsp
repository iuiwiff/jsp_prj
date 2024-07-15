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
<link rel="icon" href="http://192.168.10.210/jsp_prj/common/favicon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<link rel="stylesheet" href="http://192.168.10.210/jsp_prj/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://192.168.10.210/jsp_prj/common/css/board.css" type="text/css" media="all" />

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
String[] title="속보,정치,경제,사회,국제,문화,연예,스포츠,풀영상,뉴스랭킹,뉴스룸,아침&amp;".split(",");
String[] url="newsflash,politics,economy,society,international,culture,entertainment,sports,fullvideo,newsrank,newsroom,newmorning".split(",");

%>	
https://fs.jtbc.co.kr/RSS/
<table>
	<tr>
	<%
	for(int i = 0; i < title.length; i++) {
	%>
	<td><a href="jtbc_rss.jsp?url=<%= url[i]%>"><%= title[i] %></a></td>
	<%
	} //end for
	%>
	</tr>
</table>
</div>
<div>
<c:if test="${ not empty param.url }">
<%
try{
	//1. 빌더 생성
	SAXBuilder builder = new SAXBuilder();
	//2. XML문서 객체 생성
	String paramUrl = request.getParameter("url");
	Document doc = builder.build(new URL("http://fs.jtbc.co.kr/RSS/" + paramUrl + ".xml" ));
	//3. 최상위 부모노드 얻기
	Element rssNode = doc.getRootElement();
	//자식노도 얻기
	Element channelNode = rssNode.getChild("channel");
	
	Element categoryNode = channelNode.getChild("category");
	Element pubDateNode = channelNode.getChild("pubDate");
	
	List<Element> itemNodes = channelNode.getChildren("item");
	%>
	<div>
		<strong><%= categoryNode.getValue() %></strong>
		(<%= pubDateNode.getValue() %>)
		<br>
		<strong>조회뉴스 : </strong> <%= itemNodes.size() %>건
	</div>
	<%
	if(itemNodes.isEmpty()) {
	%>
	<div><span style="color: #C42B1C; font-weight: bold;">조회된 뉴스가 존재하지 않습니다.</span></div>
	<%
	}//end if
	
	Element titleNode = null;
	Element linkNode = null;
	Element descriptionNode = null;
	Element pubDateNode2 = null;
	for( Element itemNode : itemNodes ){
		titleNode=itemNode.getChild("title");
		linkNode=itemNode.getChild("link");
		descriptionNode=itemNode.getChild("description");
		pubDateNode2=itemNode.getChild("pubDate");
		
		%>
		<div>
		<table class="table table-hover">
		<tr>
		<td style="width: 80px">제목</td>
		<td style="width: 400px"><a href="<%= linkNode.getValue()%>"><%= titleNode.getValue() %></a></td>
		<td style="width: 80px">작성일</td>
		<td style="width: 200px"><%= pubDateNode2.getValue() %></td>
		</tr>
		<tr>
		<td style="width: 80px">설명</td>
		<td colspan="3"><%= descriptionNode.getValue() %></td>
		</table>
		</div>
		<%
	}
	
}catch(JDOMException | IOException je) {
	je.printStackTrace();
	%>
	문제발생!
	<% 
}//end catch
%>
</c:if>
</div>
</body>
</html>











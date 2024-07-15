<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="HTML Form Control의 입력 값을 받는 페이지"%>
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
<strong><%= request.getMethod() %>요청방식</strong>
	<%
	//request 내장 객체를 사용하여 Form Control의 입력 값 받기(web parameter)
	request.setCharacterEncoding("UTF-8"); //GET방식에는 적용되지 않는다.
	//name속성의 값이 유일한 경우 request.getParameter로 받는다.
	String txt=request.getParameter("txt"); //<input type="txt" name="txt">
	//request.setCharacterEncoding("UTF-8"); //GET방식에는 적용되지 않는다.
	String pass=request.getParameter("txt"); //<input type="password" name="pass">
	String hid=request.getParameter("hid"); //<input type="hidden" name="hid">
	String chk=request.getParameter("chk"); //<input type="checkbox" name="chk"> checked된 상태에서만 값이 넘어온다.
	String loc=request.getParameter("loc"); //<select name="loc">
	String ta=request.getParameter("ta"); //<textarea name="ta">
	
	//String class로 encoding
	String str = new String( txt.getBytes("8859_1"), "UTF-8");
	String str2 = URLDecoder.decode(URLEncoder.encode(hid, "8859_1"), "UTF-8");
	
	//name속성에 값이 같으면 배열로 처리되고, request.getParameterValues("이름")받는다.
	String[] names=request.getParameterValues("name");//<input type="text" name="name">
	String[] hobby=request.getParameterValues("hobby");//<input type="checkbox" name="hobby">
	%>
	
	<ul>
	<li><strong>text</strong> : <%= txt %>, <%= str %></li>
	<li><strong>password</strong> : <%= pass %></li>
	<li><strong>hidden</strong> : <%= hid %>, <%= str2 %></li>
	<li><strong>checkbox</strong> : <%= chk %></li>
	<li><strong>select</strong> : <%= loc %></li>
	<li><strong>textarea</strong> : <%= ta %></li>
	</ul>
	이름
	<%
	for(String name : names) { %>	
	<%= name %>
	<% } //end for%>
	<br/>
	취미
	<%
	//try {
	if(hobby != null) {
	for(String temp : hobby) {  //checkbox는 체크하지 않으면 
		//Parameter로 생성되지 않아 배열에 null이 들어간다.
		// => 반복하면 배열명.length 사용하는 코드에서 NullPointerException이 발생하게 됨%>
	<%= temp %>
	<% } //end for
	//}catch (NullPointerException npe){
	//	out.println("선택된 취미 없음.");
	//}
	} else {
		out.println("취미는 하나 정도 있는게 좋을 것 같음");
	}//end else
	%>
	<br/>
	
	
	<a href="javascript:history.back()">뒤로</a>
</div>
</body>
</html>
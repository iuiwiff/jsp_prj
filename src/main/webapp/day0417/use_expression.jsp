<%@page import="day0417.DataVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="표현식의 사용" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.231/jsp_prj/common/favicon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<!--sist스타일시트 시작--> 
<link rel="stylesheet" href="http://192.168.10.231/jsp_prj/common/css/main.css" type="text/css" media="all" /> 
<link rel="stylesheet" href="http://192.168.10.231/jsp_prj/common/css/board.css" type="text/css" media="all" /> 
<!--sist스타일시트 끝-->

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">
	td{ border: 1px solid #333; width: 120px; text-align: center; cursor: pointer;}
	td:hover{background-color: gray;}
</style>
<script type="text/javascript">
	$(function() {
		$("#goUrl").change(function() {
			var sel=$("#goUrl")[0];
			if(sel.selectedIndex != 0) {
				if(confirm(sel.value + "로 이동하시겠습니까?")) {
					location.href=sel.value;
				}//end if
			}//end if
		});//change
	});//ready
	
	function print(i, j, result) { //웹 서버에서 모든 일을 다하고 결과만 출력
		alert(i + "x" + j + " = " + result);
	}
	
	function print2(i, j) { //웹 서버와 클라이언트가 나눠서 일을 수행
		alert(i + "x" + j + " = " + (i * j));
	}
	
</script>
</head>
<body>
<div>
	<%
	String msg="피곤한 수요일";
	String msg2="피곤함 오지는 수요일";
	%>
	<%-- <%= msg, msg2 %> 표현식은 out.print()로 코드가 변환되며
		JspWriter클래스에는 print() method가 매개변수를 하나로만 Overload되어있다.
		--%><br/>
	<%= msg %><br><%= msg2 %>
	
	<table>
	<%
	for(int i=1; i < 10; i++) {
	%>
	<tr>
		<td onclick="printFunction(2, <%= i %>, <%= 2 * i %>)">2 * <%= i %></td>
        <td onclick="printFunction2(2, <%= i %>)">2 * <%= i %></td>
	</tr>
	<%
	} //end for
	%>
	</table>
	
	<%
		DataVO[] data = new DataVO[5];
		data[0]=new DataVO("김동섭", "http://danawa.com", "danawa.png");
		data[1]=new DataVO("진수현", "http://youtube.com", "youtube.png");
		data[2]=new DataVO("윤웅찬", "http://google.com", "google.png");
		data[3]=new DataVO("홍성강", "http://www.coupang.com", "coupang.png");
		data[4]=new DataVO("김병년", "http://sist.com", "sist.png");
	%>
	
	<select id="goUrl">
		<option>---선택----</option>
		<%for(int i=0; i < data.length; i++) { %>
		<option value="<%=data[i].getUrl()%>"> <%= data[i].getName() %></option>
		<% }//end for %>
	</select>
	
	<table class="table">
		<tr>
			<th>이름</th>
			<th>자주 방문하는 사이트</th>
		</tr>
		<% for(int i = 0; i < data.length; i++) { %>
		<tr>
			<td><%=data[i].getName() %></td>
			<td>
			<a href="<%=data[i].getUrl() %>">
			<img src= "http://localhost/jsp_prj/day0417/images/<%= data[i].getImg() %>"/></a></td>
	<% }//end for %>
	</table>
	
	<table>
		<% for(int i = 2; i < 10; i++) { %>
		<tr>
			<% for(int j = 1; j < 10; j++) { %>
			<td><%=i %> * <%=j %> = <%=i * j%></td>
		<% } //end for %>
		</tr>
		<% } //end for %>
	</table>
	
</div>
</body>
</html>
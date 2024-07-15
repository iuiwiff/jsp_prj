<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"
    pageEncoding="UTF-8"
    info="엑셀로 다운로드"%>
<%
response.setHeader("Content-Disposition", "attachment;fileName=download.xslx");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	table,th,td{border:1px solid #333}
</style>
</head>

<body>
<table>
<tr>
	<th style="width: 100px; background-color: #B4CFB0">번호</th>
	<th style="width: 150px; background-color: #B4CFB0">이름</th>
	<th style="width: 300px; background-color: #B4CFB0">이메일</th>
</tr>
<tr>
	<td>1</td>
	<td>테스트</td>
	<td>test@test.com</td>
</tr>
<tr>
	<td>2</td>
	<td>테스트</td>
	<td>test2@test.com</td>
</tr>
<tr>
	<td>3</td>
	<td>테스트</td>
	<td>test3@test.com</td>
</tr>
</table>
</body>
</html>
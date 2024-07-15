<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="업로드된 파일의 목록"%>
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
		File uploadDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
		File[] fileList = uploadDir.listFiles();
		
	%>
	
	<table class="table">
		<tr>
			<th style="width: 80px">번호</th>
			<th style="width: 400px">파일명</th>
			<th style="width: 150px">마지막 수정일</th>
		</tr>
	<%
		if(fileList != null) {
			
			//이미지만 업로드하도록 설정
			
			String[] extArr = {"png", "gif", "jpg", "jpeg", "bmp"};
			boolean flag = false;
			
			String ext = "";
			File tempFile = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			for(int i = 0; i < fileList.length; i++) {
				tempFile = fileList[i];
				ext = tempFile.getName().substring(tempFile.getName().lastIndexOf(".")+1);
				
				flag = false;
				for(int j = 0; j < extArr.length; j++) {
					if(extArr[j].equals(ext)) {
						flag = true;
						break;
					}//end if
				}//end for
			%>
				<tr>
					<td><%= i+1 %></td>
					<td>
						<% if(flag) { %>	
						<img src="../upload/<%= tempFile.getName() %>" style="width: 60px; height: 50px;"/>
						<% }//end if %>
						<a href="download.jsp?fileName=<%= tempFile.getName() %>"><%= tempFile.getName() %></a>
					</td>
					<td><%= sdf.format( new Date(tempFile.lastModified()) ) %></td>
				</tr>
			<%	
			}
		}else { //업로드된 파일이 없는 경우
		%> 
		<tr><td colspan="3">업로드된 파일이 없습니다.
		<a href="../day0508/file_frm.jsp">업로드</a></td></tr>
	</table>
		<%
		
		}//end if
		
		%>
			
</div>
</body>
</html>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="파일업로드 처리"%>
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
	//enctype="multipart/form-data"인 경우에는 parameter 전송방식이 아니므로
	//request.getParameter method로 값을 받을 수 없음
	//String uploader = request.getParameter("uploader");
	//System.out.println("uploader --------->" + uploader);
	
	//1. 업로드된 파일이 저장될 폴더를 얻기
	File saveDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload/");
	
	//2. 업로드 파일 크기 설정 (5Mbyte) - 크게설정
	int maxSize = 1024 * 1024 * 100;
	
	try {
	//3. 업로드 컴포넌트 (cos.jar)를 생성 (파일이 업로드 된다.)
	MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(),
			maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	//4. 파라메터를 받을 때에는 업로드 컴포넌트를 사용한다.
	String uploader = mr.getParameter("uploader");
	String age = mr.getParameter("age");
	
	//파일명 받기
	//원본 파일명 : 중복파일명이 있더라도 원본 이름이 반환
	String originName = mr.getOriginalFileName("upFile");
	//새로운 파일명 : 중복파일이 있다면 새롭게 변경된 이름이 반환
	String newName = mr.getFilesystemName("upFile");
	
	int limitSize = 1024 * 1024 * 5; //(5MB)
	File readFile = new File(saveDir.getAbsolutePath() + "/" + newName);
	boolean flag = false;
	if(readFile.length() > limitSize) {
		flag = true;
		readFile.delete();
	}//end if
	
	if( !flag ) {
	%>
	
	
	파일 업로드 결과<br>
	업로더 : <%=uploader %><br>
	나이 : <%=age %><br>
	파일명 : <%=newName %>(<%=originName %>)<br>
	
	
	<%
	} else {
		out.println("업로드 파일은 5Mbyte까지만 가능합니다.");
	}//end else
	} catch(Exception e) {
		e.printStackTrace();
		%>
		업로드 문제 발생
		<%
	}//end catch
	%>
	
	
	<a href="file_frm.jsp">뒤로</a>
	<a href="../day0509/file_list.jsp">파일목록</a>
</div>
</body>
</html>
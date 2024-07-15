<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="파일 업로드 폼"%>
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
			
			//이미지만 업로드하도록 설정
			var file=$("#upFile").val();
			var selectExt = file.substring( file.lastIndexOf(".")+1) 
			
			var extArr = ["png", "gif", "jpg", "jpeg", "bmp"];
			
			var flag = false;
			
			for(var i = 0; i < extArr.length; i++) {
				if(extArr[i] == selectExt) {
					flag = true;
					break;
				}//end if
			}//end for
			
			if(!flag) {
				alert(selectExt + "는 업로드 가능한 파일의 확장자가 아닙니다.")
				return;
			}//end if
			
			$("#frm").submit();
		});
	});//ready
</script>
</head>
<body>
<div>
	<form action="upload_process.jsp" name="frm" id="frm" method="post" enctype="multipart/form-data"> <!-- 파일전송방식 -->
	<label>업로더명</label>
	<input type="text" name="uploader" value="김본좌"/><br>
	<label>나이</label>
	<select name="age">
	<c:forEach var="i" begin="10" end="40" step="10">
	<option value="${ i }"><c:out value="${ i }"/>세</option>
	</c:forEach>
	</select><br/>
	<label>업로드파일</label>
	<input type="file" name="upFile" id="upFile" style="width: 300px"/><br>
	<input type="button" value="업로드" id="btn" class="btn btn-info btn-sm"/><br>
	</form>
	<a href="../day0509/file_list.jsp">파일목록</a>
</div>
</body>
</html>
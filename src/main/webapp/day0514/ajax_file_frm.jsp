<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.user.member.ProfileVO"%>
<%@page import="kr.co.sist.user.member.ProfileDAO"%>
<%@page import="java.sql.SQLException"%>
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
		//이미지 미리보기
		$("#profileImg").change(function(event){
			if($("#profileImg").val() == ""){
				alert("이미지를 선택해주세요");
				return;
			}//end if
			
			//1. 파일 컴포넌트 얻기
			var file = event.target.files[0];
				//alert(file);
			//2. 스트림 생성 - 데이터 내보내려면 스트림으로 데이터 찾기
			var reader = new FileReader();
			
			//3. onload이벤트 핸들러 설정( 파일읽기가 완료되면 호출 )
			reader.onload = function(evt){
				//이미지 태그에 src속성을 선택한 파일명으로 설정
				$("#previewProfile").prop("src", evt.target.result);
			}//function
			
			//4. FileReader객체를 사용하여 선택한 파일을 읽어들인다.
			reader.readAsDataURL(file);
		});//change
		
		//파일 업로드
		$("#btnImg").click(function() {
			if($("#profileImg").val() == ""){
				alert("이미지를 선택해주세요");
				return;
			}//end if
			
			//1. 폼얻기
			var frm = $("#frm")[0];
			//2. AJAX로 전송할 폼객체 생성
			var formData = new FormData( frm );
			
			$.ajax({
				url: "ajax_file_upload_process.jsp",
				type: "post",
				processData: false, /* querystring 제거 */
				contentType: false, /* file전송방식으로 변환 */
				data: formData, /* file만 전송 */
				async: false,
				dataType: "JSON",
				error: function( xhr ) {
					alert("업로드 실패");
					console.log( xhr.status );
				},
				success: function( jsonObj ) {
					var msg = "이미지 변경 실패";
					if( jsonObj.result ) {
						var msg = "이미지 변경 성공";
					}//end if
					$("#uploadResult").html( msg );
				}//success
			});//ajax
		
		});//click
		
		$("#btnSubmit").click(function() {
			$("#frm").submit();
		});//click
		
		
	});//ready
</script>

</head>
<body>
<div>
<%
String id = (String)session.getAttribute("id");
if(id == null){
	id="kim";//id test pass 1234
}
try{
	ProfileDAO pDAO = ProfileDAO.getInstance();
	ProfileVO pVO = pDAO.selectProfile(id);
	
	//복호화 
	String key="gdyb21LQTcIANtvYMT7QVQ==";
	
	DataDecrypt dd=new DataDecrypt(key);
			
	pVO.setName(dd.decryption(pVO.getName()));
	
	pageContext.setAttribute("pVO", pVO);
}catch(SQLException e){
	e.printStackTrace();
}
%>
<c:if test="${ empty pVO }">
	<c:redirect url="http://192.168.10.230/jsp_prj/day0502/index.jsp"/>
</c:if>
<form action="info_frm_process.jsp" method="post" id="frm" name="frm">
<label>프로필 이미지</label>
<input type="file" name="profileImg" id="profileImg"/>
<input type="button" value="이미지업로드" id="btnImg" class="btn btn-warning btn-sm"/>
<span id="uploadResult" ></span>
<br>
<img src="http://192.168.10.230/jsp_prj/upload/${ pVO.img }" id="previewProfile" style="width: 100px"/>
<br>
<label>ID</label> : <input type="text" name="id" id="id" value="${ pVO.id }"/><br/>
<label>name</label> : <input type="text" name="name" id="name" value="${ pVO.name }"/><br/>
<input type="button" value="변경" id="btnSubmit" class="btn btn-info btn-sm"/>

</form>
</div>
</body>
</html>
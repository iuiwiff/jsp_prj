<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원 가입 폼에서 입력된 값을 받는 JSP"%>
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
#success{ width: 597px; height: 508px; margin:0px auto; position:relative;
background: #FFFFFF url('http://192.168.10.210/jsp_prj/member/images/member_success_bg.png') }
#result{ position: absolute;top:95px;left :110px }	
</style>
<script type="text/javascript">
	$(function(){
		
	});//ready
</script>
</head>
<body>
<div>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="wmVO" class="kr.co.sist.user.member.WebMemberVO" scope="page"/>
<jsp:setProperty property="*" name="wmVO"/>

<c:catch var="e"> 
<%
//입력값에 대한 전처리, 유효성 검증 수행
wmVO.setEmail( wmVO.getEmail1()+"@"+wmVO.getEmail2());
wmVO.setIp(request.getRemoteAddr());

//암호화 복호화
//정보의 중요도
//일방향 Hash ( 비번)
wmVO.setPassword(DataEncrypt.messageDigest("MD5", wmVO.getPassword()));
//복호화가능한 암호화 ( 이름, 전화번호, 이메일)
String key="gdyb21LQTcIANtvYMT7QVQ==";

DataEncrypt de=new DataEncrypt(key);
wmVO.setName(de.encryption(wmVO.getName()));
wmVO.setCell(de.encryption(wmVO.getCell()));
wmVO.setEmail(de.encryption(wmVO.getEmail()));

System.out.println(wmVO.getCell());
//DB Table 추가
MemberDAO mDAO=MemberDAO.getInstance();
//try{
	//웹의 비 연결성으로 동시에 같은 값을 사용하는 경우에 
	if(!"".equals(mDAO.selectId(wmVO.getId()))){//조회를 하여 같은 값이 있는지 판단하고 있다면 
	%>
	입력하신 아이디는 이미 사용중입니다. <br/>
	다른 아이디로 재 가입해주세요.<br>
	<a href="#void" onclick="history.back()">뒤로</a>
	<%
	}else{//그렇지 않다면 정상작업 진행		
	
	 mDAO.insertWebMember(wmVO);//웹의 비연결성에 대한 특성  
%>
<div id="success">
	<div id="result">
		<h2>회원가입해주셔서 감사합니다.</h2>
		<strong>${ param.name }</strong>님의 회원가입을 축하드립니다.<br>
		입력하신 정보는 아래와 같습니다.<br/>
		<ul>
			<li><strong>아이디 : </strong><c:out value="${ param.id }"/></li>
			<li><strong>전화번호 : </strong><c:out value="${ param.cell }"/></li>
			<li><strong>이메일 : </strong><c:out value="${ param.email1 }@${param.email2 }"/></li>
			<li><strong>성별 : </strong><c:out value="${ param.gender eq '1'?'남자':'여자' }"/></li>
			<li><strong>주소 : </strong>
					<c:out value="${ param.zipcode }"/><br>
					<c:out value="${ param.addr0 }"/> <c:out value="${ param.addr1 }"/>
			</li>
		</ul>
		
	</div>
</div>
<%	 
	}//end else
//}catch(SQLException se){
//se.printStackTrace();
//}
%>
</c:catch>
<c:if test="${ not empty e }"><!-- 다양한 경우의 문제의 에러상황 -->
죄송합니다. 잠시 후 다시 시도해주세요.<br/>
<a href="http://192.168.10.210/jsp_prj/index.html">메인으로</a>
<a href="#void" onclick="history.back()">뒤로</a>
</c:if>

</div>
</body>
</html>










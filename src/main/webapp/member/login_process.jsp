<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.user.member.WebMemberVO"%>
<%@page import="kr.co.sist.user.member.MemberDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="아이디와 비번을 받아서 로그인 처리"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="lVO" class="kr.co.sist.user.member.LoginVO" scope="page"/>
<jsp:setProperty name="lVO" property="*"/>
<%
//비번은 일방향 Hash로 암호화
lVO.setPass(DataEncrypt.messageDigest("MD5", lVO.getPass()));


pageContext.setAttribute("msg", "로그인 실패. 아이디나 비번을 확인.");
pageContext.setAttribute("url", "login_frm.jsp");

MemberDAO mDAO=MemberDAO.getInstance();
try{
	WebMemberVO wmVO=mDAO.selectLogin(lVO);
	if( wmVO != null ){ //로그인 성공
		//복호화 
		String key="gdyb21LQTcIANtvYMT7QVQ==";
		DataDecrypt dd=new DataDecrypt(key);
		
		wmVO.setName(dd.decryption(wmVO.getName()));
		wmVO.setEmail(dd.decryption(wmVO.getEmail()));
		wmVO.setCell(dd.decryption(wmVO.getCell()));
		
		//세션에 값 설정 
		session.setAttribute("loginData", wmVO);
		
		pageContext.setAttribute("msg", "로그인 성공");
		pageContext.setAttribute("url", "http://192.168.10.230/jsp_prj/index.jsp");
	}//end if
}catch(Exception e){
	pageContext.setAttribute("msg", "문제 발생 잠시 후 다시 시도해주세요.");
	pageContext.setAttribute("url", "login_frm.jsp");

	e.printStackTrace();
}//end catch
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.230/jsp_prj/common/favicon.ico"/>
<script type="text/javascript">
alert("${ pageScope.msg }");
location.href="${ pageScope.url }";
</script>
</head>
<body>
<div>
	
</div>
</body>
</html>
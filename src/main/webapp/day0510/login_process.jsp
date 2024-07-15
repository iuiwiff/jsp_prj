<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.user.member.WebMemberVO"%>
<%@page import="kr.co.sist.user.member.MemberDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="application/json"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    info="AJAX에서 보내오는 Parameter받기"%>

<jsp:useBean id="lVO" class="kr.co.sist.user.member.LoginVO" scope="page"/>
<jsp:setProperty property="*" name="lVO"/>

<%
	//비번은 일방향 Hash로 암호화
	lVO.setPass(DataEncrypt.messageDigest("MD5", lVO.getPass()));
	
	//JSONObject생성
	JSONObject jsonObj=new JSONObject();
	
	jsonObj.put("result", false);
	
	MemberDAO mDAO=MemberDAO.getInstance();
	
	try{
	WebMemberVO wmVO=mDAO.selectLogin(lVO);
	if(wmVO !=null) { //객체가 생성>로그인 성공
	    
	//복호화
	String key="gdyb21LQTcIANtvYMT7QVQ==";
	DataDecrypt dd=new DataDecrypt(key);
	
	wmVO.setName(dd.decryption(wmVO.getName()));
	wmVO.setEmail(dd.decryption(wmVO.getEmail()));
	wmVO.setCell(dd.decryption(wmVO.getCell()));
	
	//세션에 값 설정
	session.setAttribute("loginData", wmVO);
	
	jsonObj.put("result", true);
	jsonObj.put("name", wmVO.getName());
	jsonObj.put("email", wmVO.getEmail());
	
	}//end if
}catch(Exception e) {
    
    e.printStackTrace();
}//end catch
%>

<%=jsonObj.toJSONString()%>